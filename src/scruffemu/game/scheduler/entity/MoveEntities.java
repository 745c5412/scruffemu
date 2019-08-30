package scruffemu.game.scheduler.entity;

import scruffemu.entity.npc.NpcMovable;
import scruffemu.game.GameClient;
import scruffemu.game.Updatable;
import scruffemu.main.Config;
import scruffemu.main.Main;

public class MoveEntities extends Updatable
{
  public final static Updatable updatable=new MoveEntities(Config.getInstance().moveEntityUpdate);
  public MoveEntities(int wait)
  {
    super(wait);
  }

  public void update()
  {
    if(this.verify())
    {
      for(GameClient client : Main.gameServer.getClients())
        if(client.getPlayer()!=null)
          client.getPlayer().getCurMap().moveMobGroups(5);
      NpcMovable.moveAll();
    }
  }

  @Override
  public Object get()
  {
    return null;
  }
}
