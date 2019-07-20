package scruffemu.game;

import org.apache.mina.core.session.IdleStatus;

import scruffemu.client.Account;
import scruffemu.client.Player;
import scruffemu.main.Config;
import scruffemu.main.Main;

import org.apache.mina.core.service.IoAcceptor;
import org.apache.mina.filter.codec.ProtocolCodecFilter;
import org.apache.mina.filter.codec.textline.LineDelimiter;
import org.apache.mina.filter.codec.textline.TextLineCodecFactory;
import org.apache.mina.transport.socket.nio.NioSocketAcceptor;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

public class GameServer
{

  public short MAX_PLAYERS=700;
  private final ArrayList<Account> waitingClients=new ArrayList<>();
  private final IoAcceptor acceptor;
  private int sessions=0;

  public GameServer()
  {
    acceptor=new NioSocketAcceptor();
    acceptor.getFilterChain().addLast("codec",new ProtocolCodecFilter(new TextLineCodecFactory(Charset.forName("UTF8"),LineDelimiter.NUL,new LineDelimiter("\n\0"))));
    acceptor.getSessionConfig().setIdleTime(IdleStatus.BOTH_IDLE,60*10 /*10 Minutes*/);
    acceptor.setHandler(new GameHandler());
  }

  public boolean start()
  {
    if(acceptor.isActive())
    {
      Main.logger.warn("Error already start but try to launch again");
      return false;
    }

    try
    {
      acceptor.bind(new InetSocketAddress(Config.getInstance().gamePort));
      Main.logger.info("Game server started on address : {}:{}",Config.getInstance().Ip,Config.getInstance().gamePort);
      return true;
    }
    catch(IOException e)
    {
      Main.logger.error("Error while starting game server",e);
      return false;
    }
  }

  public void stop()
  {
    if(!acceptor.isActive())
    {
      acceptor.getManagedSessions().values().stream().filter(session -> session.isConnected()||!session.isClosing()).forEach(session -> session.close(true));
      acceptor.dispose();
      acceptor.unbind();
    }

    Main.logger.error("The game server was stopped.");
  }

  @SuppressWarnings("deprecation")
  public List<GameClient> getClients()
  {
    return acceptor.getManagedSessions().values().stream().filter(session -> session.getAttachment()!=null).map(session -> (GameClient)session.getAttachment()).collect(Collectors.toList());
  }

  //v2.8 - correct number
  public int getPlayersNumberByIp()
  {
    //return (int)this.getClients().stream().filter(client -> client!=null&&client.getAccount()!=null).map(client -> client.getAccount().getCurrentIp()).distinct().count();
    ArrayList<String> IPs=new ArrayList<String>();
    for(Player player : World.world.getOnlinePlayers())
      if(player.getGameClient()!=null)
      {
        boolean same=false;
        for(String IP : IPs)
          if(player.getGameClient().getAccount().getCurrentIp().equals(IP))
            same=true;
        if(same==false)
          IPs.add(player.getGameClient().getAccount().getCurrentIp());
      }
    return IPs.size();
  }

  public void setState(int state)
  {
    Main.exchangeClient.send("SS"+state);
  }

  public Account getWaitingAccount(int id)
  {
    for(Account account : this.waitingClients)
      if(account.getId()==id)
        return account;
    return null;
  }

  public void deleteWaitingAccount(Account account)
  {
    if(this.waitingClients.contains(account))
      this.waitingClients.remove(account);
  }

  public void addWaitingAccount(Account account)
  {
    if(!this.waitingClients.contains(account))
      this.waitingClients.add(account);
  }

  public void a()
  {
    Main.logger.warn("Unexpected behaviour detected");
  }

  public void kickAll(boolean kickGm)
  {
    for(Player player : World.world.getOnlinePlayers())
    {
      if(player!=null&&player.getGameClient()!=null)
      {
        if(player.getGroupe()!=null&&!player.getGroupe().isPlayer()&&kickGm)
          continue;
        player.send("M04");
        player.getGameClient().disconnect();
      }
    }
  }

  public String getServerTime()
  {
    return "BT"+(new Date().getTime()+3600000*2);
  }

  public int getSessions()
  {
    return sessions;
  }

  public void setSessions(int sessions)
  {
    this.sessions = sessions;
  }
}
