package scruffemu.game.scheduler.entity;

import scruffemu.area.map.GameMap;
import scruffemu.client.Player;
import scruffemu.common.SocketManager;
import scruffemu.database.Database;
import scruffemu.entity.Prism;
import scruffemu.entity.monster.MobGroup;
import scruffemu.game.Updatable;
import scruffemu.game.World;
import scruffemu.main.Main;
import scruffemu.object.GameObject;
import scruffemu.utility.Pair;

import java.util.ArrayList;
import java.util.List;

public class WorldSave extends Updatable
{
  public final static Updatable updatable=new WorldSave(7200000);
  private static Thread thread;

  private WorldSave(int wait)
  {
    super(wait);
  }

  @Override
  public void update()
  {
    if(this.verify())
      if(!Main.isSaving)
      {
        thread=new Thread(() -> WorldSave.cast(1));
        thread.setName(WorldSave.class.getName());
        thread.setDaemon(true);
        thread.start();
      }
  }

  //v2.8 - heroic mobgroup save fix
  public static void cast(int trys)
  {
    if(trys!=0)
      Main.gameServer.setState(2);

    try
    {
      World.world.logger.debug("Starting the save of the world..");
      SocketManager.GAME_SEND_Im_PACKET_TO_ALL("1164;");
      Main.isSaving=true;

      /** Save of data **/
      World.world.logger.info("-> of accounts.");
      World.world.getAccounts().stream().filter(account -> account!=null).forEach(account -> Database.getStatics().getAccountData().update(account));

      World.world.logger.info("-> of players.");
      World.world.logger.info("-> of members of guilds.");
      World.world.getPlayers().stream().filter(player -> player!=null).filter(Player::isOnline).forEach(player -> {
        Database.getStatics().getPlayerData().update(player);
        if(player.getGuildMember()!=null)
          Database.getDynamics().getGuildMemberData().update(player);
      });

      World.world.logger.info("-> of prisms.");
      for(Prism prism : World.world.getPrisms().values())
        if(World.world.getMap(prism.getMap()).getSubArea().getPrismId()!=prism.getId())
          Database.getDynamics().getPrismData().delete(prism.getId());
        else
          Database.getDynamics().getPrismData().update(prism);

      World.world.logger.info("-> of guilds.");
      World.world.getGuilds().values().stream().forEach(guild -> Database.getStatics().getGuildData().update(guild));

      World.world.logger.info("-> of collectors.");
      World.world.getCollectors().values().stream().filter(collector -> collector.getInFight()<=0).forEach(collector -> Database.getDynamics().getCollectorData().update(collector));

      World.world.logger.info("-> of houses.");
      World.world.getHouses().values().stream().filter(house -> house.getOwnerId()>0).forEach(house -> Database.getDynamics().getHouseData().update(house));

      World.world.logger.info("-> of trunks.");
      World.world.getTrunks().values().stream().forEach(trunk -> Database.getDynamics().getTrunkData().update(trunk));

      World.world.logger.info("-> of parks.");
      World.world.getMountparks().values().stream().filter(mp -> mp.getOwner()>0||mp.getOwner()==-1).forEach(mp -> Database.getDynamics().getMountParkData().update(mp));

      World.world.logger.info("-> of mounts.");
      World.world.getMounts().values().stream().forEach(mount -> Database.getStatics().getMountData().update(mount));

      World.world.logger.info("-> of areas.");
      World.world.getAreas().values().stream().forEach(area -> Database.getDynamics().getAreaData().update(area));
      World.world.getSubAreas().values().stream().forEach(subArea -> Database.getDynamics().getSubAreaData().update(subArea));

      World.world.logger.info("-> of objects.");
      try
      {
        for(GameObject object : new ArrayList<>(World.world.getGameObjects()))
        {
          if(object==null)
            continue;
          if(object.modification==0)
            Database.getStatics().getObjectData().insert(object);
          else if(object.modification==1)
            Database.getStatics().getObjectData().update(object);
          object.modification=-1;
        }
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }

      World.world.logger.info("-> of group-monsters.");

      List<Pair<Short, MobGroup>> groups=new ArrayList<Pair<Short, MobGroup>>();
      List<Pair<Short, MobGroup>> groupsFix=new ArrayList<Pair<Short, MobGroup>>();

      for(GameMap map : World.world.getMaps())
      {
        for(MobGroup group : map.getMobGroups().values())
        {
            if(group.getIsDynamic())
              groups.add(new Pair<Short, MobGroup>(map.getId(),group));
            else if(group.isFix())
              groupsFix.add(new Pair<Short, MobGroup>(map.getId(),group));
        }
      }
      try
      {
      Database.getDynamics().getHeroicMobsGroups().batchResetFix(groupsFix);
      Database.getDynamics().getHeroicMobsGroups().batchReset(groups);
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }

      World.world.logger.debug("The save has been done successfully !");
      SocketManager.GAME_SEND_Im_PACKET_TO_ALL("1165;");
    }
    catch(Exception exception)
    {
      exception.printStackTrace();
      World.world.logger.error("Error when trying save of the world : "+exception.getMessage());
      if(trys<10)
      {
        World.world.logger.error("Fail of the save, num of try : "+(trys+1)+".");
        WorldSave.cast(trys+1);
        return;
      }
      Main.isSaving=false;
    } finally
    {
      Main.isSaving=false;
    }

    if(trys!=0)
      Main.gameServer.setState(1);

    if(thread!=null)
    {
      Thread copy=thread;
      thread=null;
      copy.interrupt();
    }
  }

  @Override
  public GameObject get()
  {
    return null;
  }
}