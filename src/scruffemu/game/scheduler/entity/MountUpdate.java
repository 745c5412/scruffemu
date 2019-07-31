package scruffemu.game.scheduler.entity;

import scruffemu.area.map.GameMap;
import scruffemu.entity.mount.Mount;
import scruffemu.game.Updatable;
import scruffemu.game.World;
import scruffemu.main.Config;

public class MountUpdate extends Updatable
{
  public final static Updatable updatable=new MoveEntities(Config.getInstance().mountUpdate);
  public MountUpdate(int wait)
  {
    super(wait);
  }

  public void update()
  {
    if(this.verify())
    {
      for(GameMap map : World.world.getMaps())
      {
        if(map.getMountPark()!=null)
          map.getMountPark().startMoveMounts();
      }

      for(Mount mount : World.world.getMounts().values())
      {
        if(mount.getFatigue()<=0)
          continue;
        mount.setFatigue(mount.getFatigue()-3);
        if(mount.getFatigue()<0)
          mount.setFatigue(0);
      }
    }
  }

  @Override
  public Object get()
  {
    return null;
  }
}
