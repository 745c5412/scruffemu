package scruffemu.guild;

import scruffemu.area.map.entity.House;
import scruffemu.client.Player;
import scruffemu.client.other.Stats;
import scruffemu.database.Database;
import scruffemu.entity.Collector;
import scruffemu.fight.spells.Spell.SortStats;
import scruffemu.main.Constant;
import scruffemu.main.Main;

import java.util.*;
import java.util.Map.Entry;
import java.util.stream.Collectors;

public class Guild
{
  public Map<Short, Long> timePutCollector=new HashMap<>();
  private int id;
  private String name="";
  private String emblem="";
  private Map<Integer, GuildMember> members=new TreeMap<>();
  private int lvl;
  private long xp;
  //Percepteur
  private int capital=0;
  private int nbrPerco=0;
  private Map<Integer, SortStats> spells=new HashMap<>(); //<ID, Level>
  private Map<Integer, Integer> stats=new HashMap<>(); //<Effet, Quantit�>
  //Stats en combat
  private Map<Integer, Integer> statsFight=new HashMap<>();
  private long date;

  public Guild(String name, String emblem)
  {
    this.id=Database.getStatics().getGuildData().getNextId();
    this.name=name;
    this.emblem=emblem;
    this.lvl=1;
    this.xp=0;
    this.date=System.currentTimeMillis();
    decompileSpell("462;0|461;0|460;0|459;0|458;0|457;0|456;0|455;0|454;0|453;0|452;0|451;0|");
    decompileStats("176;100|158;1000|124;100|");
  }

  public Guild(int id, String name, String emblem, int lvl, long xp, int capital, int nbrmax, String sorts, String stats, long date)
  {
    this.id=id;
    this.name=name;
    this.emblem=emblem;
    this.xp=xp;
    this.lvl=lvl;
    this.capital=capital;
    this.nbrPerco=nbrmax;
    this.date=date;
    decompileSpell(sorts);
    decompileStats(stats);
    //Mise en place des stats
    statsFight.clear();
    statsFight.put(Constant.STATS_ADD_FORC,this.lvl);
    statsFight.put(Constant.STATS_ADD_SAGE,getStats(Constant.STATS_ADD_SAGE));
    statsFight.put(Constant.STATS_ADD_INTE,this.lvl);
    statsFight.put(Constant.STATS_ADD_CHAN,this.lvl);
    statsFight.put(Constant.STATS_ADD_AGIL,this.lvl);
    statsFight.put(Constant.STATS_ADD_RP_NEU,(int)Math.floor(getLvl()/2));
    statsFight.put(Constant.STATS_ADD_RP_FEU,(int)Math.floor(getLvl()/2));
    statsFight.put(Constant.STATS_ADD_RP_EAU,(int)Math.floor(getLvl()/2));
    statsFight.put(Constant.STATS_ADD_RP_AIR,(int)Math.floor(getLvl()/2));
    statsFight.put(Constant.STATS_ADD_RP_TER,(int)Math.floor(getLvl()/2));
    statsFight.put(Constant.STATS_ADD_AFLEE,(int)Math.floor(getLvl()/2));
    statsFight.put(Constant.STATS_ADD_MFLEE,(int)Math.floor(getLvl()/2));
  }

  public GuildMember addMember(int id, int r, byte pXp, long x, int ri, String lastCo)
  {
    Player player=Main.world.getPlayer(id);
    if(player==null)
      return null;
    GuildMember guildMember=new GuildMember(player,this,r,x,pXp,ri,lastCo);
    this.members.put(id,guildMember);
    player.setGuildMember(guildMember);
    return guildMember;
  }

  public GuildMember addNewMember(Player player)
  {
    GuildMember guildMember=new GuildMember(player,this,0,0,(byte)0,0,player.getAccount().getLastConnectionDate());
    this.members.put(player.getId(),guildMember);
    player.setGuildMember(guildMember);
    return guildMember;
  }

  public int getId()
  {
    return this.id;
  }

  public int getNbrPerco()
  {
    return this.nbrPerco;
  }

  public void setNbrPerco(int nbr)
  {
    this.nbrPerco=nbr;
  }

  public int getCapital()
  {
    return this.capital;
  }

  public void setCapital(int nbr)
  {
    this.capital=nbr;
  }

  public Map<Integer, SortStats> getSpells()
  {
    return this.spells;
  }

  public Map<Integer, Integer> getStats()
  {
    return stats;
  }

  public long getDate()
  {
    return date;
  }

  public void boostSpell(int ID)
  {
    SortStats SS=this.spells.get(ID);
    if(SS!=null&&SS.getLevel()==5)
      return;
    this.spells.put(ID,((SS==null) ? Main.world.getSort(ID).getStatsByLevel(1) : Main.world.getSort(ID).getStatsByLevel(SS.getLevel()+1)));
  }

  public Stats getStatsFight()
  {
    return new Stats(this.statsFight);
  }

  public String getName()
  {
    return this.name;
  }

  public void setName(String name)
  {
    this.name=name;
  }

  public String getEmblem()
  {
    return this.emblem;
  }

  public long getXp()
  {
    return this.xp;
  }

  public int getLvl()
  {
    return this.lvl;
  }

  public boolean haveTenMembers()
  {
    return this.id==1||this.id==2||(this.members.size()>=10);
  }

  public int getSize()
  {
    return this.members.size();
  }

  public String parseMembersToGM()
  {
    StringBuilder str=new StringBuilder();
    for(GuildMember GM : this.members.values())
    {
      String online="0";
      if(GM.getPlayer()!=null)
        if(GM.getPlayer().isOnline())
          online="1";
      if(str.length()!=0)
        str.append("|");
      str.append(GM.getGuid()).append(";");
      str.append(GM.getName()).append(";");
      str.append(GM.getLvl()).append(";");
      str.append(GM.getGfx()).append(";");
      str.append(GM.getRank()).append(";");
      str.append(GM.getXpGave()).append(";");
      str.append(GM.getPXpGive()).append(";");
      str.append(GM.getRights()).append(";");
      str.append(online).append(";");
      str.append(GM.getAlign()).append(";");
      str.append(GM.getHoursFromLastCo());
    }
    return str.toString();
  }

  public List<Player> getMembers()
  {
    List<Player> players=this.members.values().stream().filter(guildMember -> guildMember.getPlayer()!=null).map(GuildMember::getPlayer).collect(Collectors.toList());
    return players;
  }

  public Collection<GuildMember> getGuildMembers()
  {
    return members.values();
  }

  public GuildMember getMember(int id)
  {
    GuildMember guildMember=this.members.get(id);
    if(guildMember==null)
     Database.getDynamics().getGuildMemberData().load(id);
    return this.members.get(id)==null ? this.members.get(id) : guildMember;
  }

  public void removeMember(Player player)
  {
    House house=House.getHouseByPerso(player);
    if(house!=null)
      if(House.houseOnGuild(this.id)>0)
       Database.getDynamics().getHouseData().updateGuild(house,0,0);

    this.members.remove(player.getId());
   Database.getDynamics().getGuildMemberData().delete(player.getId());
  }

  public void addXp(long xp)
  {
    this.xp+=xp;
    while(this.xp>=Main.world.getGuildXpMax(this.lvl)&&this.lvl<200)
      this.levelUp();
  }

  public void levelUp()
  {
    this.lvl++;
    this.capital+=5;
  }

  public void decompileSpell(String spells)
  {
    for(String split : spells.split("\\|"))
      this.spells.put(Integer.parseInt(split.split(";")[0]),Main.world.getSort(Integer.parseInt(split.split(";")[0])).getStatsByLevel(Integer.parseInt(split.split(";")[1])));
  }

  public void decompileStats(String statsStr)
  {
    for(String split : statsStr.split("\\|"))
      this.stats.put(Integer.parseInt(split.split(";")[0]),Integer.parseInt(split.split(";")[1]));
  }

  public String compileSpell()
  {
    if(this.spells.isEmpty())
      return "";

    StringBuilder toReturn=new StringBuilder();
    boolean isFirst=true;

    for(Entry<Integer, SortStats> curSpell : this.spells.entrySet())
    {
      if(!isFirst)
        toReturn.append("|");
      toReturn.append(curSpell.getKey()).append(";").append(((curSpell.getValue()==null) ? 0 : curSpell.getValue().getLevel()));
      isFirst=false;
    }

    return toReturn.toString();
  }

  public String compileStats()
  {
    if(this.stats.isEmpty())
      return "";

    StringBuilder toReturn=new StringBuilder();
    boolean isFirst=true;

    for(Entry<Integer, Integer> curStats : this.stats.entrySet())
    {
      if(!isFirst)
        toReturn.append("|");

      toReturn.append(curStats.getKey()).append(";").append(curStats.getValue());

      isFirst=false;
    }

    return toReturn.toString();
  }

  public void upgradeStats(int id, int add)
  {
    this.stats.put(id,(this.stats.get(id)+add));
  }

  public int getStats(int id)
  {
    return stats.get(id);
  }

  public String parseCollectorToGuild()
  {
    return String.valueOf(getNbrPerco())+"|"+Collector.countCollectorGuild(getId())+"|"+100*getLvl()+"|"+getLvl()+"|"+getStats(158)+"|"+getStats(176)+"|"+getStats(124)+"|"+getNbrPerco()+"|"+getCapital()+"|"+(1000+(10*getLvl()))+"|"+compileSpell();
  }

  public String parseQuestionTaxCollector()
  {
    return "1"+';'+getName()+','+getStats(Constant.STATS_ADD_PODS)+','+getStats(Constant.STATS_ADD_PROS)+','+getStats(Constant.STATS_ADD_SAGE)+','+getNbrPerco();
  }
}
