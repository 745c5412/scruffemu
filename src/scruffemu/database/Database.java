package scruffemu.database;

import com.zaxxer.hikari.HikariDataSource;

import scruffemu.database.active.DynamicsDatabase;
import scruffemu.database.passive.StaticsDatabase;
import scruffemu.main.Main;

import java.sql.Connection;

public class Database
{
  private final static DynamicsDatabase dynamics=new DynamicsDatabase();
  private final static StaticsDatabase statics=new StaticsDatabase();

  public static boolean launchDatabase()
  {
    if(!statics.initializeConnection()||!dynamics.initializeConnection())
    {
      Main.stop("Initialization of database connection failed");
      return false;
    }
    return true;
  }

  public static DynamicsDatabase getDynamics()
  {
    return dynamics;
  }

  public static StaticsDatabase getStatics()
  {
    return statics;
  }

  public static boolean tryConnection(HikariDataSource dataSource)
  {
    try
    {
      Connection connection=dataSource.getConnection();
      connection.close();
      return true;
    }
    catch(Exception e)
    {
      e.printStackTrace();
      return false;
    }
  }
}
