package scruffemu.database.active.data;

import com.zaxxer.hikari.HikariDataSource;

import scruffemu.area.map.GameMap;
import scruffemu.database.active.AbstractDAO;
import scruffemu.entity.monster.MobGroup;
import scruffemu.game.scheduler.entity.RespawnGroup;
import scruffemu.main.Config;
import scruffemu.main.Main;
import scruffemu.object.GameObject;
import scruffemu.utility.Pair;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class HeroicMobsGroups extends AbstractDAO<Object>
{

  public HeroicMobsGroups(HikariDataSource dataSource)
  {
    super(dataSource);
  }

  @Override
  public void load(Object obj)
  {
  }

  @Override
  public boolean update(Object obj)
  {
    return false;
  }

  public void load()
  {
    Result result=null;
    try
    {
      result=getData("SELECT * FROM `mobgroups_dynamic`;");
      ResultSet RS=result.resultSet;
      while(RS.next())
      {
        final MobGroup group=new MobGroup(RS.getInt("id"),RS.getShort("map"),RS.getInt("cell"),RS.getString("group"),RS.getString("objects"),RS.getInt("stars"));
        final GameMap map=Main.world.getMap(RS.getShort("map"));
        if(map!=null)
          map.respawnGroup(group);
      }
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobData load",e);
    } finally
    {
      close(result);
    }
  }

  public void loadFix()
  {
    Result result=null;
    try
    {
      result=getData("SELECT * FROM `mobgroups_fix_dynamic`;");
      ResultSet RS=result.resultSet;
      while(RS.next())
      {
        RespawnGroup.fixMobGroupObjects.put(RS.getInt("map")+","+RS.getInt("cell"),new Pair<ArrayList<GameObject>, Integer>(new ArrayList<GameObject>(),RS.getInt("stars")));
      }
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups loadFix",e);
    } finally
    {
      close(result);
    }
  }

  public void insert(short map, MobGroup group, ArrayList<GameObject> array)
  {
    PreparedStatement prepare=null;
    try
    {
      final StringBuilder objects=new StringBuilder(),groups=new StringBuilder();
      if(Config.getInstance().HEROIC)
        array.stream().filter(object -> object!=null).forEach(object -> objects.append(objects.toString().isEmpty() ? "" : ",").append(object.getGuid()));

      group.getMobs().values().stream().filter(monster -> monster!=null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));
      prepare=getPreparedStatement("INSERT INTO `mobgroups_dynamic` VALUES (?, ?, ?, ?, ?, ?);");
      prepare.setInt(1,group.getId());
      prepare.setInt(2,map);
      prepare.setInt(3,group.getCellId());
      prepare.setString(4,groups.toString());
      if(Config.getInstance().HEROIC)
        prepare.setString(5,objects.toString());
      else
        prepare.setString(5,"");
      prepare.setInt(6,group.getStarBonus(group.getInternalStarBonus()));
      execute(prepare);
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups insert",e);
    } finally
    {
      close(prepare);
    }
  }

  public void insertFix(short map, MobGroup group, ArrayList<GameObject> array)
  {
    PreparedStatement prepare=null;
    try
    {
      final StringBuilder objects=new StringBuilder(),groups=new StringBuilder();
      if(Config.getInstance().HEROIC)
        array.stream().filter(object -> object!=null).forEach(object -> objects.append(objects.toString().isEmpty() ? "" : ",").append(object.getGuid()));

      group.getMobs().values().stream().filter(monster -> monster!=null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));
      prepare=getPreparedStatement("INSERT INTO `mobgroups_fix_dynamic` VALUES (?, ?, ?, ?, ?)");
      prepare.setInt(1,map);
      prepare.setInt(2,group.getCellId());
      prepare.setString(3,groups.toString());
      if(Config.getInstance().HEROIC)
        prepare.setString(4,objects.toString());
      else
        prepare.setString(4,"");
      prepare.setInt(5,group.getStarBonus(group.getInternalStarBonus()));
      execute(prepare);
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups insertFix",e);
    } finally
    {
      close(prepare);
    }
  }

  public void update(short map, MobGroup group)
  {
    PreparedStatement prepare=null;
    try
    {
      final StringBuilder objects=new StringBuilder(),groups=new StringBuilder();
      group.getObjects().stream().filter(object -> object!=null).forEach(object -> objects.append(objects.toString().isEmpty() ? "" : ",").append(object.getGuid()));
      group.getMobs().values().stream().filter(monster -> monster!=null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));
      prepare=getPreparedStatement("UPDATE `mobgroups_dynamic` SET `objects` = ? WHERE `id` = ? AND `map` = ? AND `group` = ?;");
      prepare.setString(1,objects.toString());
      prepare.setLong(2,group.getId());
      prepare.setInt(3,map);
      prepare.setString(4,groups.toString());
      execute(prepare);
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups update",e);
    } finally
    {
      close(prepare);
    }
  }

  public void updateFix()
  {
    PreparedStatement prepare=null;
    try
    {
      for(Map.Entry<String, Pair<ArrayList<GameObject>, Integer>> entry : RespawnGroup.fixMobGroupObjects.entrySet())
      {
        String[] split=entry.getKey().split(",");
        final StringBuilder objects=new StringBuilder();
        entry.getValue().getLeft().stream().filter(object -> object!=null).forEach(object -> objects.append(objects.toString().isEmpty() ? "" : ",").append(object.getGuid()));

        prepare=getPreparedStatement("UPDATE `mobgroups_fix_dynamic` SET `objects` = ? WHERE `map` = ? AND `cell` = ? AND `group` = ?;");
        prepare.setString(1,objects.toString());
        prepare.setLong(2,Integer.parseInt(split[0]));
        prepare.setInt(3,Integer.parseInt(split[1]));
        prepare.setString(4,Main.world.getGroupFix(Integer.parseInt(split[0]),Integer.parseInt(split[1])).get("groupData"));
        execute(prepare);
      }
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups updateFix",e);
    } finally
    {
      close(prepare);
    }
  }

  //v2.8 - reset objects, group and cell of mob replacing old mob
  public void reset(short map, MobGroup group)
  {
    PreparedStatement prepare=null;
    try
    {
      final StringBuilder groups=new StringBuilder();
      group.getMobs().values().stream().filter(monster -> monster!=null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));
      prepare=getPreparedStatement("UPDATE `mobgroups_dynamic` SET `objects` = ?, `stars` = ?, `group` = ?, `cell` = ? WHERE `id` = ? AND `map` = ?;");
      prepare.setString(1,"");
      prepare.setInt(2,0);
      prepare.setString(3,groups.toString());
      prepare.setInt(4,group.getCellId());
      prepare.setInt(5,group.getId());
      prepare.setInt(6,map);
      execute(prepare);
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups reset",e);
    } finally
    {
      close(prepare);
    }
  }

  //v2.8 - reset objects, group and cell of mob replacing old mob
  public void resetFix(short map, MobGroup group)
  {
    PreparedStatement prepare=null;
    try
    {
      final StringBuilder groups=new StringBuilder();
      group.getMobs().values().stream().filter(monster -> monster!=null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));
      prepare=getPreparedStatement("UPDATE `mobgroups_fix_dynamic` SET `objects` = ?, `stars` = ?, `group` = ?, `cell` = ? WHERE `map` = ?;");
      prepare.setString(1,"");
      prepare.setInt(2,0);
      prepare.setString(3,groups.toString());
      prepare.setInt(4,group.getCellId());
      prepare.setInt(5,map);
      execute(prepare);
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroupsFix reset",e);
    } finally
    {
      close(prepare);
    }
  }

  //v2.8 - reset objects, group and cell of mob replacing old mob
  public void batchReset(List<Pair<Short, MobGroup>> groupsFix)
  {
    try
    {
      PreparedStatement prepare=getPreparedStatement("UPDATE `mobgroups_dynamic` SET `objects` = ?, `stars` = ?, `group` = ?, `cell` = ? WHERE `id` = ? AND `map` = ?;");
      for(Pair<Short, MobGroup> p : groupsFix)
      {
        Short mapId=(Short)p.getLeft();
        MobGroup group=(MobGroup)p.getRight();
        final StringBuilder groups=new StringBuilder();
        group.getMobs().values().stream().filter(monster -> monster!=null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));
        prepare.setString(1,"");
        prepare.setInt(2,group.getStarBonus(group.getInternalStarBonus()));
        prepare.setString(3,groups.toString());
        prepare.setInt(4,group.getCellId());
        prepare.setInt(5,group.getId());
        prepare.setInt(6,mapId);
        prepare.addBatch();
      }
      prepare.executeBatch();
      close(prepare);
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups reset",e);
    }
  }

  //v2.8 - reset objects, group and cell of mob replacing old mob
  public void batchResetFix(List<Pair<Short, MobGroup>> groupsFix)
  {
    try
    {
      PreparedStatement prepare=getPreparedStatement("UPDATE `mobgroups_fix_dynamic` SET `objects` = ?, `stars` = ?, `group` = ? WHERE `map` = ? AND `cell` = ?;");
      for(Pair<Short, MobGroup> p : groupsFix)
      {
        Short mapId=(Short)p.getLeft();
        MobGroup group=(MobGroup)p.getRight();
        final StringBuilder groups=new StringBuilder();
        group.getMobs().values().stream().filter(monster -> monster!=null).forEach(monster -> groups.append(groups.toString().isEmpty() ? "" : ";").append(monster.getTemplate().getId()).append(",").append(monster.getLevel()).append(",").append(monster.getLevel()));
        prepare.setString(1,"");
        prepare.setInt(2,group.getStarBonus(group.getInternalStarBonus()));
        prepare.setString(3,groups.toString());
        prepare.setInt(4,mapId);
        prepare.setInt(5,group.getCellId());
        prepare.addBatch();
      }
      prepare.executeBatch();
      close(prepare);
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups reset",e);
    }
  }

  //v2.8 - batch SQL updating
  public void batchUpdateStars(List<Pair<Pair<MobGroup, Integer>, Integer>> info)
  {
    try
    {
      PreparedStatement prepare=getPreparedStatement("UPDATE `mobgroups_dynamic` SET `stars` = ? WHERE `id` = ? AND `map` = ?;");
      for(Pair<Pair<MobGroup, Integer>, Integer> p : info)
      {
        MobGroup group=p.getLeft().getLeft();
        int mobId=p.getLeft().getRight();
        int mapId=p.getRight();
        prepare.setInt(1,group.getStarBonus(group.getInternalStarBonus()));
        prepare.setInt(2,mobId);
        prepare.setInt(3,mapId);
        prepare.addBatch();
      }
      prepare.executeBatch();
      close(prepare);
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups updateStars",e);
    }
  }

  //v2.8 - batch SQL updating
  public void batchUpdateFixStars(List<Pair<MobGroup, Integer>> info)
  {
    try
    {
      PreparedStatement prepare=getPreparedStatement("UPDATE `mobgroups_fix_dynamic` SET `stars` = ? WHERE `map` = ? AND `cell` = ?;");
      for(Pair<MobGroup, Integer> p : info)
      {
        MobGroup group=p.getLeft();
        int mapId=p.getRight();
        prepare.setInt(1,group.getStarBonus(group.getInternalStarBonus()));
        prepare.setInt(2,mapId);
        prepare.setInt(3,group.getSpawnCellId());
        prepare.addBatch();
      }
      prepare.executeBatch();
      close(prepare);
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups updateStars",e);
    }
  }

  //v2.8 - get stars by groupid and mapid
  public int getStars(int mobId, int mapId)
  {
    Result result=null;
    int stars=0;
    try
    {
      result=getData("SELECT * FROM mobgroups_dynamic WHERE map = "+mapId+" AND id = "+mobId+";");
      ResultSet RS=result.resultSet;
      if(RS.next())
      {
        stars=RS.getInt("stars");
      }
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups getStars",e);
    } finally
    {
      super.close(result);
    }
    return stars;
  }

  //v2.8 - get stars by groupid and mapid
  public int getFixStars(int mapId, int cellId)
  {
    Result result=null;
    int stars=0;
    try
    {
      result=getData("SELECT * FROM mobgroups_fix_dynamic WHERE map = "+mapId+" AND cell = "+cellId+";");
      ResultSet RS=result.resultSet;
      if(RS.next())
      {
        stars=RS.getInt("stars");
      }
    }
    catch(SQLException e)
    {
      super.sendError("HeroicMobsGroups getStars",e);
    } finally
    {
      super.close(result);
    }
    return stars;
  }
}
