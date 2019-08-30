package scruffemu.game.scheduler.entity;

import scruffemu.area.map.GameMap;
import scruffemu.entity.mount.Mount;
import scruffemu.game.Updatable;
import scruffemu.main.Config;
import scruffemu.main.Main;

public class MountUpdate extends Updatable
{
  public final static Updatable updatable=new MountUpdate(Config.getInstance().mountUpdate);
  public MountUpdate(int wait)
  {
    super(wait);
  }

  public synchronized void update()
  {
    if(this.verify())
    {
      for(String s : Config.getInstance().mountMaps)
      {
        short mapId=(short)Integer.parseInt(s);
        GameMap map = Main.world.getMap(mapId);
        map.getMountPark().startMoveMounts();
      }

      for(Mount mount : Main.world.getMounts().values())
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
