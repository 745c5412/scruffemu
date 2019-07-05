package scruffemu.main;

import java.util.HashMap;
import java.util.Map;

import scruffemu.database.Database;
import scruffemu.utility.Points;

public class Config
{
  public static final Config singleton=new Config();
  public final long startTime=System.currentTimeMillis();

  /** Text */
  public String version="ScruffEmu v2.8", name="Rushu";
  public String url="http://herofus.ddns.net";
  public String discord="https://discordapp.com/invite/Fg52GeR";
  public String startMessage="Welcome to <b>Herofus</b>, type .commands for a list of commands or .info for server info.";
  public String colorMessage="ff0000";

  /** Server info */
  public boolean HALLOWEEN=false, NOEL=false; //events
  public boolean autoReboot=false, onlyLocal=false, debugMode=false, useSubscribe=false;
  public int maxconnections=4; //connections per ip limit

  /** Starting info */
  public boolean allZaap=false, allEmote=false; //start options
  public int startLevel=1, startKamas=0;
  public int startMap=0, startCell=0; //if 0 choose basic class starting locations
  public int rateKamas=1, rateDrop=1, rateHonor=1, rateJob=8, rateFm=1;
  public float rateXp=4;

  /** Config data */
  public boolean encryptPackets=true;
  public boolean allowMulePvp=false; //honor for killing character on same IP
  public boolean HEROIC=false;
  public boolean VOTESHOP=false;
  public boolean ALIGNCOMM=false; //alignment commands
  public boolean EXOLIMIT=true; //ap, mp and ra exo limit
  public int starHour=2; //how many hours for a mob to gain one star
  public int AIDelay=100, craftDelay=200, gameActionDelay=5; //delay in ms
  public int weaponBonusBase=80, primaryWeaponBonus=30, secondaryWeaponBonus=20, daggerSwordNerf=5; //class weapon bonus
  public String lessDurationSpells=",95,98,148,149,577,612,741,760,811,813,962,1004,1092,1122,1129,1143,2079,2081,53,170,1164,1169,1172,2118,"; //spells with one turn less duration when selfcast, e.g. amplification, mutilation, clock
  public int erosion=10;
  public int basePods=3000;
  public int idleTime=1000*60*20; //20 minutes
  public int idleCheck=1000*60*5; //5 minutes
  public int starUpdate=1000*60*120; //updates stars of mobs in database every 2 hours
  public int averagePingUpdate=1000*60*5; //5 minutes
  public int moveEntityUpdate=1000*60*3; //3 minutes
  public int worldMarket=10111; //mapID of world market
  public Map<Integer, Integer> teleports=new HashMap<Integer, Integer>();
  public boolean mapAsBlocked=false, fightAsBlocked=false, tradeAsBlocked=false;

  /** Connection data */
  public String key="rushu";
  public int serverId=2, exchangePort=547;
  public String exchangeIp="127.0.0.1";
  public String loginHostDB="127.0.0.1", loginNameDB="scruffemu_login", loginUserDB="root", loginPassDB="", loginPortDB="3306";
  public int gamePort=5555;
  public String hostDB="127.0.0.1", nameDB="scruffemu_game", userDB="root", passDB="", portDB="3306";
  public String Ip="145.131.6.37"; //145.131.6.37

  public Points points=new Points()
  {
    @Override
    public int load(String user)
    {
      return Database.getStatics().getAccountData().loadPointsWithoutUsersDb(user);
    }

    @Override
    public void update(int id, int points)
    {
      Database.getStatics().getAccountData().updatePointsWithoutUsersDb(id,points);
    }
  };

  public static Config getInstance()
  {
    return singleton;
  }
}