package scruffemu.game.scheduler.entity;

import scruffemu.database.Database;
import scruffemu.game.Updatable;
import scruffemu.main.Main;

public class WorldPlayerOption extends Updatable
{
  public final static Updatable updatable=new WorldPub(300000);

  public WorldPlayerOption(int wait)
  {
    super(wait);
  }

  @Override
  public void update()
  {
    if(this.verify())
    {
      Database.getStatics().getAccountData().updateVoteAll();
      Main.world.getOnlinePlayers().stream().filter(player -> player!=null&&player.isOnline()).forEach(scruffemu.client.Player::checkVote);
    }
  }

  @Override
  public Object get()
  {
    return null;
  }
}