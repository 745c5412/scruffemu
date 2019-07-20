package scruffemu.game.scheduler.entity;

import scruffemu.client.Player;
import scruffemu.database.Database;
import scruffemu.game.GameClient;
import scruffemu.game.Updatable;
import scruffemu.game.World;
import scruffemu.main.Config;
import scruffemu.main.Main;

import java.util.ArrayList;

public class WorldKickIdle extends Updatable
{
  public final static ArrayList<String> pubs=new ArrayList<>();
  public final static Updatable updatable=new WorldKickIdle(Config.getInstance().idleCheck);
  public WorldKickIdle(int wait)
  {
    super(wait);
  }

  //v2.8 - fixed idle gamethreads kicker
  public void update()
  {
    if(this.verify())
    {
      int idleClient=0;
      int idleSession=0;
      int idlePlayer=0;
      for(Player player : World.world.getOnlinePlayers())
      {
        if(player.getGameClient()==null)
        {
          player.resetVars();
          player.getAccount().resetAllChars();
          Database.getStatics().getAccountData().update(player.getAccount());
          idlePlayer++;
        }
      }

      for(GameClient client : Main.gameServer.getClients())
      {
        boolean found=false;
        for(Player player : World.world.getOnlinePlayers())
          if(client.getPlayer()==player)
          {
            if(!client.getCharacterSelect()==true)
            {
              found=true;
              break;
            }
          }
        if(!found)
        {
          if(!client.getCharacterSelect()==true)
          {
            client.kickSession();
            idleSession++;
          }
        }
        else if(System.currentTimeMillis()-client.timeLastAct>Config.getInstance().idleTime)
        {
          if(!client.getCharacterSelect()==true)
          {
            client.disconnect();
            idleClient++;
          }
        }
      }
      System.out.println("Purged "+idleClient+" idle client(s), "+idleSession+" idle session(s) and "+idlePlayer+" idle player(s).");
    }
  }

  @Override
  public Object get()
  {
    return null;
  }
}