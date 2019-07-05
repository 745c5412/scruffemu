package scruffemu.game.scheduler.entity;

import scruffemu.area.map.GameMap;
import scruffemu.entity.npc.NpcMovable;
import scruffemu.game.Updatable;
import scruffemu.game.World;
import scruffemu.main.Config;

public class MoveEntities extends Updatable
{
  public final static Updatable updatable=new MoveEntities(Config.getInstance().averagePingUpdate);
  public MoveEntities(int wait)
  {
    super(wait);
  }

  public void update()
  {
    if(this.verify())
    {
      for(GameMap map : World.world.getMaps())
      {
        map.onMapMonsterDeplacement();
        if(map.getMountPark()!=null)
          map.getMountPark().startMoveMounts();
      }
      NpcMovable.moveAll();
    }
  }

  @Override
  public Object get()
  {
    return null;
  }
}
