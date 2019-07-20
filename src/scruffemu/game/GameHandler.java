package scruffemu.game;

import org.apache.mina.core.service.IoHandler;
import org.apache.mina.core.session.IdleStatus;
import org.apache.mina.core.session.IoSession;
import scruffemu.game.GameClient;
import scruffemu.game.filter.PacketFilter;
import scruffemu.game.World;

import scruffemu.main.Config;
import scruffemu.main.Main;

public class GameHandler implements IoHandler
{

  private final static PacketFilter filter=new PacketFilter().activeSafeMode();

  @SuppressWarnings("deprecation")
  @Override
  public void sessionCreated(IoSession arg0) throws Exception
  {
    if(!filter.authorizes(arg0.getRemoteAddress().toString().substring(1).split(":")[0]))
    {
      arg0.close(true);
    }
    else
    {
      World.world.logger.info("Session "+arg0.getId()+" created");

      arg0.setAttachment(new GameClient(arg0));
      Main.gameServer.setSessions(Main.gameServer.getSessions()+1);
      Main.refreshTitle();
    }
  }

  @SuppressWarnings("deprecation")
  @Override
  public void messageReceived(IoSession arg0, Object arg1) throws Exception
  {
    GameClient client=(GameClient)arg0.getAttachment();
    String packet=(String)arg1;

    if(Config.getInstance().encryptPackets&&!packet.startsWith("AT")&&!packet.startsWith("Ak"))
    {
      packet=World.world.getCryptManager().decryptMessage(packet,client.getPreparedKeys());
      if(packet!=null)
        packet=packet.replace("\n","");
      else
        packet=(String)arg1;
    }

    String[] s=packet.split("\n");

    for(String str : s)
    {
      client.parsePacket(str);
      if(Config.getInstance().debugMode)
        World.world.logger.trace(" <-- "+str);
    }
  }

  @SuppressWarnings("deprecation")
  @Override
  public void sessionClosed(IoSession arg0) throws Exception
  {
    GameClient client=(GameClient)arg0.getAttachment();
    if(client!=null)
      client.disconnect();
    World.world.logger.info("Session "+arg0.getId()+" closed");
    Main.gameServer.setSessions(Main.gameServer.getSessions()-1);
    Main.refreshTitle();
  }

  @Override
  public void exceptionCaught(IoSession arg0, Throwable arg1) throws Exception
  {
    if(arg1==null)
      return;
    if(arg1.getMessage()!=null&&(arg1 instanceof org.apache.mina.filter.codec.RecoverableProtocolDecoderException||arg1.getMessage().startsWith("Une connexion ")||arg1.getMessage().startsWith("Connection reset by peer")||arg1.getMessage().startsWith("Connection timed out")))
      return;
    arg1.printStackTrace();
    World.world.logger.warn("Exception connexion client : "+arg1.getMessage());
    this.kick(arg0);
  }

  @SuppressWarnings("deprecation")
  @Override
  public void messageSent(IoSession arg0, Object arg1) throws Exception
  {
    GameClient client=(GameClient)arg0.getAttachment();

    if(client!=null)
    {
      String packet=(String)arg1;
      if(Config.getInstance().encryptPackets&&!packet.startsWith("AT")&&!packet.startsWith("HG"))
        packet=World.world.getCryptManager().decryptMessage(packet,client.getPreparedKeys()).replace("\n","");
      if(packet.startsWith("am"))
        return;
      if(Config.getInstance().debugMode)
        World.world.logger.trace(" --> "+packet);
    }
  }

  @Override
  public void inputClosed(IoSession ioSession) throws Exception
  {
    ioSession.close(true);
  }

  @Override
  public void sessionIdle(IoSession arg0, IdleStatus arg1) throws Exception
  {
    World.world.logger.info("Session "+arg0.getId()+" idle");
  }

  @Override
  public void sessionOpened(IoSession arg0) throws Exception
  {
    World.world.logger.info("Session "+arg0.getId()+" opened");
  }

  @SuppressWarnings("deprecation")
  private void kick(IoSession arg0)
  {
    GameClient client=(GameClient)arg0.getAttachment();
    if(client!=null)
    {
      client.disconnect();
      arg0.setAttachment(null);
    }
    Main.refreshTitle();
  }
}
