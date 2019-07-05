package scruffemu.game.scheduler.entity;

import scruffemu.client.Player;
import scruffemu.common.SocketManager;
import scruffemu.game.Updatable;
import scruffemu.game.World;
import scruffemu.main.Config;

public class AveragePing extends Updatable
{
  public final static Updatable updatable=new AveragePing(Config.getInstance().averagePingUpdate);
  public AveragePing(int wait)
  {
    super(wait);
  }

  //v2.8 - fixed idle gamethreads kicker
  public void update()
  {
    if(this.verify())
      for(Player player : World.world.getOnlinePlayers())
        SocketManager.sendAveragePingPacket(player.getGameClient());
  }

  @Override
  public Object get()
  {
    return null;
  }
}
