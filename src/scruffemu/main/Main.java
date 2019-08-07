package scruffemu.main;

import org.fusesource.jansi.AnsiConsole;
import org.slf4j.LoggerFactory;
import ch.qos.logback.classic.Level;
import ch.qos.logback.classic.Logger;
import scruffemu.area.map.entity.InteractiveObject;
import scruffemu.comhandler.ExchangeClient;
import scruffemu.database.Database;
import scruffemu.game.GameServer;
import scruffemu.game.World;
import scruffemu.game.scheduler.entity.AveragePing;
import scruffemu.game.scheduler.entity.MountUpdate;
import scruffemu.game.scheduler.entity.MoveEntities;
import scruffemu.game.scheduler.entity.UpdateStarBonus;
import scruffemu.game.scheduler.entity.WorldKickIdle;
import scruffemu.game.scheduler.entity.WorldPlayerOption;
import scruffemu.game.scheduler.entity.WorldPub;
import scruffemu.game.scheduler.entity.WorldSave;

import java.io.File;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.*;

public class Main
{
  public static Logger logger=(Logger)LoggerFactory.getLogger(Main.class);
  public static final List<Runnable> runnables=Collections.synchronizedList(new LinkedList<Runnable>());
  public static ExchangeClient exchangeClient;
  public static GameServer gameServer=null;
  public static boolean isRunning=false, isSaving=false;

  public static void main(String[] args) throws SQLException
  {
    Runtime.getRuntime().addShutdownHook(new Thread() 
    {
      public void run()
      {
        if(Main.isRunning)
        {
          Main.isRunning=false;
          gameServer.setState(0);
          WorldSave.cast(0);
          gameServer.setState(0);
          if(Main.gameServer!=null)
            Main.gameServer.kickAll(true);
          Logging.getInstance().stop();
          Database.getStatics().getServerData().loggedZero();
        }
        Main.logger.info("The server is now closed.");
      }
    }
    );

    try
    {
      System.setOut(new PrintStream(System.out,true,"IBM850"));
      if(!new File("Logs/Error").exists())
        new File("Logs/Error").mkdir();
      System.setErr(new PrintStream(new FileOutputStream("Logs/Error/"+new SimpleDateFormat("dd-MM-yyyy - HH-mm-ss",Locale.FRANCE).format(new Date())+".log")));
    }
    catch(Exception e)
    {
      e.printStackTrace();
    }
    Main.start();
  }

  public static void start()
  {
    Main.setTitle("ScruffEmu - Loading data..");
    Main.logger.info("You use "+System.getProperty("java.vendor")+" with the version "+System.getProperty("java.version"));
    Main.logger.debug("Starting of the server : "+new SimpleDateFormat("dd/MM/yyyy - HH:mm:ss",Locale.FRANCE).format(new Date()));
    Main.logger.debug("Current timestamp : "+System.currentTimeMillis());
    Logging.getInstance().initialize();

    if(Database.launchDatabase())
    {
      Main.isRunning=true;
      World.world.createWorld();
      gameServer=new GameServer();
      gameServer.start();
      new ExchangeClient().initialize();
      Main.refreshTitle();
      gameServer.setState(1);
      Main.logger.info("The server is ready ! Waiting for connection..\n");
      if(!Config.getInstance().debugMode)
      {
        ch.qos.logback.classic.Logger root=(ch.qos.logback.classic.Logger)org.slf4j.LoggerFactory.getLogger(ch.qos.logback.classic.Logger.ROOT_LOGGER_NAME);
        root.setLevel(Level.OFF);
      }
      Config.getInstance().teleports.put(1868,316);

      while(Main.isRunning)
      {
        try
        {
          WorldSave.updatable.update();
          InteractiveObject.updatable.update();
          WorldPlayerOption.updatable.update();
          WorldPub.updatable.update();
          WorldKickIdle.updatable.update();
          UpdateStarBonus.updatable.update();
          AveragePing.updatable.update();
          MoveEntities.updatable.update();
          MountUpdate.updatable.update();
          if(!runnables.isEmpty())
          {
            List<Runnable> copyRunnables=new LinkedList<Runnable>(runnables);
            List<Runnable> toRemove=new LinkedList<Runnable>(runnables);
            for(Runnable runnable : copyRunnables)
            {
              try
              {
                if(runnable!=null)
                {
                  new Thread(runnable).start();
                  toRemove.add(runnable);
                }
              }
              catch(Exception e)
              {
                e.printStackTrace();
              }
            }
            runnables.removeAll(toRemove);
          }
          Thread.sleep(100);
        }
        catch(Exception e)
        {
          e.printStackTrace();
        }
      }
    }
    else
    {
      Main.logger.error("An error occurred when the server have try a connection on the Mysql server. Please check your identification.");
    }
  }

  public static void stop(String reason)
  {
    Logging.getInstance().write("Error",reason);
    System.exit(0);
  }

  private static void setTitle(String title)
  {
    AnsiConsole.out.printf("%c]0;%s%c",'\033',title,'\007');
  }

  public static void refreshTitle()
  {
    if(Main.isRunning)
      Main.setTitle(Config.getInstance().name+" - Port : "+Config.getInstance().gamePort+" | "+Config.getInstance().key+" | "+gameServer.getSessions()+" Session(s) | "+gameServer.getClients().size()+" Client(s) | "+World.world.getOnlinePlayers().size()+" Player(s)");
  }

  public static void clear()
  {
    AnsiConsole.out.print("\033[H\033[2J");
  }
  
  public static void exit(String reason)
  {
    Logging.getInstance().write("Error",reason);
  }
}
