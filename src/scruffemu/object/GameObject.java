package scruffemu.object;

import scruffemu.client.Player;
import scruffemu.client.other.Stats;
import scruffemu.common.Formulas;
import scruffemu.common.SocketManager;
import scruffemu.database.Database;
import scruffemu.entity.mount.Mount;
import scruffemu.entity.pet.PetEntry;
import scruffemu.fight.spells.SpellEffect;
import scruffemu.game.World;
import scruffemu.utility.Pair;
import scruffemu.main.Constant;
import scruffemu.main.Logging;
import scruffemu.object.entity.Fragment;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;

public class GameObject
{
  protected ObjectTemplate template;
  protected int quantity=1;
  protected int position=Constant.ITEM_POS_NO_EQUIPED;
  protected int guid;
  protected int obvijevanPos;
  protected int obvijevanLook;
  protected int puit;
  private Stats Stats=new Stats();
  private ArrayList<SpellEffect> Effects=new ArrayList<>();
  private ArrayList<String> SortStats=new ArrayList<>();
  private Map<Integer, String> txtStats=new HashMap<>();
  private Map<Integer, Integer> SoulStats=new HashMap<>();

  public byte modification=-1;

  public GameObject(int Guid, int template, int qua, int pos, String strStats, int puit)
  {
    this.guid=Guid;
    this.template=World.world.getObjTemplate(template);
    this.quantity=qua;
    this.position=pos;
    this.puit=puit;

    Stats=new Stats();
    this.parseStringToStats(strStats,false);
  }

  public GameObject(int Guid)
  {
    this.guid=Guid;
    this.template=World.world.getObjTemplate(8378);
    this.quantity=1;
    this.position=-1;
    this.puit=0;
  }

  public GameObject(int Guid, int template, int qua, int pos, Stats stats, ArrayList<SpellEffect> effects, Map<Integer, Integer> _SoulStat, Map<Integer, String> _txtStats, int puit)
  {
    this.guid=Guid;
    this.template=World.world.getObjTemplate(template);
    this.quantity=qua;
    this.position=pos;
    this.Stats=stats;
    this.Effects=effects;
    this.SoulStats=_SoulStat;
    this.txtStats=_txtStats;
    this.obvijevanPos=0;
    this.obvijevanLook=0;
    this.puit=puit;
  }

  public static GameObject getCloneObjet(GameObject obj, int qua)
  {
    Map<Integer, Integer> maps=new HashMap<>();
    maps.putAll(obj.getStats().getMap());
    Stats newStats=new Stats(maps);

    GameObject ob=new GameObject(Database.getStatics().getObjectData().getNextId(),obj.getTemplate().getId(),qua,Constant.ITEM_POS_NO_EQUIPED,newStats,obj.getEffects(),obj.getSoulStat(),obj.getTxtStat(),obj.getPuit());
    ob.modification=0;
    return ob;
  }

  public int setId()
  {
    this.guid=Database.getStatics().getObjectData().getNextId();
    return this.getGuid();
  }

  public int getPuit()
  {
    return this.puit;
  }

  public void setPuit(int puit)
  {
    this.puit=puit;
  }

  public int getObvijevanPos()
  {
    return obvijevanPos;
  }

  public void setObvijevanPos(int pos)
  {
    obvijevanPos=pos;
    this.setModification();
  }

  public int getObvijevanLook()
  {
    return obvijevanLook;
  }

  public void setObvijevanLook(int look)
  {
    obvijevanLook=look;
    this.setModification();
  }

  public void setModification()
  {
    if(this.modification==-1)
      this.modification=1;
  }

  public void parseStringToStats(String strStats, boolean save)
  {
    if(this.template!=null&this.template.getId()==7010)
      return;
    String dj1="";
    if(!strStats.equalsIgnoreCase(""))
    {
      final String[] split=strStats.split(",");
      String[] array;
      for(int length=(array=split).length,i=0;i<length;++i)
      {
        final String s=array[i];
        try
        {
          if(!s.equalsIgnoreCase(""))
          {
            if(s.substring(0,3).equalsIgnoreCase("325")&&(this.getTemplate().getId()==10207||this.getTemplate().getId()==10601))
            {
              this.txtStats.put(805,new StringBuilder(String.valueOf(s.substring(3))).toString());
            }
            else if(s.substring(0,3).equalsIgnoreCase("3dc"))
            {
              this.txtStats.put(988,s.split("#")[4]);
            }
            else if(s.substring(0,3).equalsIgnoreCase("3d9"))
            {
              this.txtStats.put(985,s.split("#")[4]);
            }
            else
            {
              final String spell=s;
              final String[] stats=s.split("#");
              final int id=Integer.parseInt(stats[0],16);
              if(id==808&&this.getTemplate().getType()==77)
              {
                this.txtStats.put(id,s.substring(3));
              }
              else if(id==985||id==989)
              {
                this.txtStats.put(id,stats[4]);
              }
              else if(id==717)
              {
                this.SoulStats.put(Integer.parseInt(stats[1],16),Integer.parseInt(stats[3],16));
              }
              else if(id==814)
              {
                dj1=String.valueOf(dj1)+(dj1.isEmpty() ? "" : ",")+stats[3];
                this.txtStats.put(814,dj1);
              }
              else if(id==997||id==996)
              {
                this.txtStats.put(id,stats[4]);
              }
              else if(this.template.getId()==77&&id==808)
              {
                this.txtStats.put(id,s.substring(3));
              }
              else if(id==805)
              {
                this.txtStats.put(id,stats[3]);
              }
              else if(id!=814&&id!=812&&!stats[3].equals("")&&(!stats[3].equals("0")||id==808||id==800||id==806||id==940||id==807)&&(this.getTemplate().getType()!=77||id!=808))
              {
                this.txtStats.put(id,stats[3]);
              }
              else if(id==812&&this.getTemplate().getType()==93)
              {
                this.txtStats.put(id,stats[4]);
              }
              else if(id==812)
              {
                this.txtStats.put(id,stats[4]);
              }
              else if(id>=281&&id<=294)
              {
                this.SortStats.add(spell);
              }
              else
              {
                boolean follow1=true;
                switch(id)
                {
                  case 110:
                  case 139:
                  case 605:
                  case 614:
                  {
                    final String min=stats[1];
                    final String max=stats[2];
                    final String jet=stats[4];
                    final String args=String.valueOf(min)+";"+max+";-1;-1;0;"+jet;
                    this.Effects.add(new SpellEffect(id,args,0,-1));
                    follow1=false;
                    break;
                  }
                }
                if(follow1)
                {
                  boolean follow2=true;
                  int[] armes_EFFECT_IDS;
                  for(int length2=(armes_EFFECT_IDS=Constant.ARMES_EFFECT_IDS).length,j=0;j<length2;++j)
                  {
                    final int a=armes_EFFECT_IDS[j];
                    if(a==id)
                    {
                      this.Effects.add(new SpellEffect(id,String.valueOf(stats[1])+";"+stats[2]+";-1;-1;0;"+stats[4],0,-1));
                      follow2=false;
                    }
                  }
                  if(follow2)
                  {
                    this.Stats.addOneStat(id,Integer.parseInt(stats[1],16));
                  }
                }
              }
            }
          }
        }
        catch(Exception e)
        {
          e.printStackTrace();
        }
      }
    }
    if(save)
      this.setModification();
  }

  public void addTxtStat(int i, String s)
  {
    txtStats.put(i,s);
    this.setModification();
  }

  public String getTraquedName()
  {
    for(Entry<Integer, String> entry : txtStats.entrySet())
    {
      if(Integer.toHexString(entry.getKey()).compareTo("3dd")==0)
      {
        return entry.getValue();
      }
    }
    return null;
  }

  public Stats getStats()
  {
    return Stats;
  }

  public void setStats(Stats SS)
  {
    Stats=SS;
    this.setModification();
  }

  public int getQuantity()
  {
    return quantity;
  }

  public void setQuantity(int quantity)
  {
    if(quantity<=0)
      quantity=0;
    else if(quantity>=100000)
      if(Logging.USE_LOG)
        Logging.getInstance().write("Object","Faille : Objet guid : "+guid+" a dépassé 100 000 qua ("+quantity+") avec comme template : "+template.getName()+" ("+template.getId()+")");

    this.quantity=quantity;
    this.setModification();
  }

  public int getPosition()
  {
    return position;
  }

  public void setPosition(int position)
  {
    this.setModification();
    this.position=position;
  }

  public ObjectTemplate getTemplate()
  {
    return template;
  }

  public void setTemplate(int Tid)
  {
    this.setModification();
    this.template=World.world.getObjTemplate(Tid);
  }

  public int getGuid()
  {
    return guid;
  }

  public Map<Integer, Integer> getSoulStat()
  {
    return SoulStats;
  }

  public Map<Integer, String> getTxtStat()
  {
    return txtStats;
  }

  public void setExchangeIn(Player player)
  {

    this.setModification();
  }

  public void setMountStats(Player player, Mount mount)
  {
    if(mount==null)
      mount=new Mount(Constant.getMountColorByParchoTemplate(this.getTemplate().getId()),player.getId(),false);
    this.clearStats();
    this.getStats().addOneStat(995,-(mount.getId()));
    this.getTxtStat().put(996,player.getName());
    this.getTxtStat().put(997,mount.getName());
    this.setModification();
  }

  public void attachToPlayer(Player player)
  {
    this.getTxtStat().put(Constant.STATS_OWNER_1,player.getName());
    SocketManager.GAME_SEND_UPDATE_OBJECT_DISPLAY_PACKET(player,this);
    this.setModification();
  }

  public boolean isAttach()
  {
    boolean ok=this.getTxtStat().containsKey(Constant.STATS_OWNER_1);

    if(ok)
    {
      Player player=World.world.getPlayerByName(this.getTxtStat().get(Constant.STATS_OWNER_1));
      if(player!=null)
        player.send("BN");
    }

    return ok;
  }

  public String parseItem()
  {
    String posi=position==Constant.ITEM_POS_NO_EQUIPED ? "" : Integer.toHexString(position);
    return Integer.toHexString(guid)+"~"+Integer.toHexString(template.getId())+"~"+Integer.toHexString(quantity)+"~"+posi+"~"+parseStatsString()+";";
  }

  public String parseStatsString()
  {
    if(getTemplate().getType()==83) //Si c'est une pierre d'�me vide
      return getTemplate().getStrTemplate();
    StringBuilder stats=new StringBuilder();
    boolean isFirst=true;

    if((getTemplate().getPanoId()>=81&&getTemplate().getPanoId()<=92)||(getTemplate().getPanoId()>=201&&getTemplate().getPanoId()<=212))
    {
      for(String spell : SortStats)
      {
        if(!isFirst)
        {
          stats.append(",");
        }
        String[] sort=spell.split("#");
        int spellid=Integer.parseInt(sort[1],16);
        stats.append(sort[0]).append("#").append(sort[1]).append("#0#").append(sort[3]).append("#").append(World.world.getSort(spellid));
        isFirst=false;
      }
    }

    for(SpellEffect SE : Effects)
    {
      if(!isFirst)
        stats.append(",");
      String[] infos=SE.getArgs().split(";");

      try
      {
        switch(SE.getEffectID())
        {
          case 614:
            stats.append(Integer.toHexString(SE.getEffectID())).append("#0#0#").append(infos[0]).append("#").append(infos[5]);
            break;

          default:
            stats.append(Integer.toHexString(SE.getEffectID())).append("#").append(infos[0]).append("#").append(infos[1]).append("#").append(infos[1]).append("#").append(infos[5]);
            break;
        }
      }
      catch(Exception e)
      {
        e.printStackTrace();
        continue;
      }
      isFirst=false;
    }

    for(Entry<Integer, String> entry : txtStats.entrySet())
    {
      if(!isFirst)
        stats.append(",");
      if(template.getType()==77||template.getType()==90)
      {
        if(entry.getKey()==Constant.STATS_PETS_PDV)
          stats.append(Integer.toHexString(entry.getKey())).append("#").append(entry.getValue()).append("#0#").append(entry.getValue());
        if(entry.getKey()==Constant.STATS_PETS_EPO)
          stats.append(Integer.toHexString(entry.getKey())).append("#").append(entry.getValue()).append("#0#").append(entry.getValue());
        if(entry.getKey()==Constant.STATS_PETS_REPAS)
          stats.append(Integer.toHexString(entry.getKey())).append("#").append(entry.getValue()).append("#0#").append(entry.getValue());
        if(entry.getKey()==Constant.STATS_PETS_POIDS)
        {
          int corpu=0;
          int corpulence=0;
          String c=entry.getValue();
          if(c!=null&&!c.equalsIgnoreCase(""))
          {
            try
            {
              corpulence=Integer.parseInt(c);
            }
            catch(Exception e)
            {
              e.printStackTrace();
            }
          }
          if(corpulence>0||corpulence<0)
            corpu=7;
          stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toHexString(corpu)).append("#").append(corpulence>0 ? corpu : 0).append("#").append(Integer.toHexString(corpu));
        }
        if(entry.getKey()==Constant.STATS_PETS_DATE&&template.getType()==77)
        {
          if(entry.getValue().contains("#"))
            stats.append(Integer.toHexString(entry.getKey())).append(entry.getValue());
          else
            stats.append(Integer.toHexString(entry.getKey())).append(Formulas.convertToDate(Long.parseLong(entry.getValue())));
        }
      }
      else if(entry.getKey()==Constant.STATS_CHANGE_BY||entry.getKey()==Constant.STATS_NAME_TRAQUE||entry.getKey()==Constant.STATS_OWNER_1)
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#0#0#0#").append(entry.getValue());
      }
      else if(entry.getKey()==Constant.STATS_GRADE_TRAQUE||entry.getKey()==Constant.STATS_ALIGNEMENT_TRAQUE||entry.getKey()==Constant.STATS_NIVEAU_TRAQUE)
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#0#0#").append(entry.getValue()).append("#0");
      }
      else if(entry.getKey()==Constant.STATS_NAME_DJ)
      {
        if(entry.getValue().equals("0d0+0"))
          continue;
        for(String i : entry.getValue().split(","))
        {
          stats.append(",").append(Integer.toHexString(entry.getKey())).append("#0#0#").append(i);
        }
        continue;
      }
      else if(entry.getKey()==Constant.STATS_DATE)
      {
        String item=entry.getValue();
        if(item.contains("#"))
        {
          String date=item.split("#")[3];
          if(date!=null&&!date.equalsIgnoreCase(""))
            stats.append(Integer.toHexString(entry.getKey())).append(Formulas.convertToDate(Long.parseLong(date)));
        }
        else
          stats.append(Integer.toHexString(entry.getKey())).append(Formulas.convertToDate(Long.parseLong(item)));
      }
      else if(entry.getKey()==Constant.CAPTURE_MONSTRE)
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#0#0#").append(entry.getValue());
      }
      else if(entry.getKey()==Constant.STATS_PETS_PDV||entry.getKey()==Constant.STATS_PETS_POIDS||entry.getKey()==Constant.STATS_PETS_DATE||entry.getKey()==Constant.STATS_PETS_REPAS)
      {
        PetEntry p=World.world.getPetsEntry(this.getGuid());
        if(p==null)
        {
          if(entry.getKey()==Constant.STATS_PETS_PDV)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append("a").append("#0#a");
          if(entry.getKey()==Constant.STATS_PETS_POIDS)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append("0").append("#0#0");
          if(entry.getKey()==Constant.STATS_PETS_DATE)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append("0").append("#0#0");
          if(entry.getKey()==Constant.STATS_PETS_REPAS)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append("0").append("#0#0");
        }
        else
        {
          if(entry.getKey()==Constant.STATS_PETS_PDV)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toHexString(p.getPdv())).append("#0#").append(Integer.toHexString(p.getPdv()));
          if(entry.getKey()==Constant.STATS_PETS_POIDS)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toString(p.parseCorpulence())).append("#").append(p.getCorpulence()>0 ? p.parseCorpulence() : 0).append("#").append(Integer.toString(p.parseCorpulence()));
          if(entry.getKey()==Constant.STATS_PETS_DATE)
            stats.append(Integer.toHexString(entry.getKey())).append(p.parseLastEatDate());
          if(entry.getKey()==Constant.STATS_PETS_REPAS)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append(entry.getValue()).append("#0#").append(entry.getValue());
          if(p.getIsEupeoh()&&entry.getKey()==Constant.STATS_PETS_EPO)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toHexString(p.getIsEupeoh() ? 1 : 0)).append("#0#").append(Integer.toHexString(p.getIsEupeoh() ? 1 : 0));
        }
      }
      else if(entry.getKey()==Constant.STATS_RESIST&&getTemplate().getType()==93)
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toHexString(getResistanceMax(getTemplate().getStrTemplate()))).append("#").append(entry.getValue()).append("#").append(Integer.toHexString(getResistanceMax(getTemplate().getStrTemplate())));
      }
      else if(entry.getKey()==Constant.STATS_RESIST)
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toHexString(getResistanceMax(getTemplate().getStrTemplate()))).append("#").append(entry.getValue()).append("#").append(Integer.toHexString(getResistanceMax(getTemplate().getStrTemplate())));
      }
      else
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#0#0#0#").append(entry.getValue());
      }
      isFirst=false;
    }

    for(Entry<Integer, Integer> entry : SoulStats.entrySet())
    {
      if(!isFirst)
        stats.append(",");

      if(this.getTemplate().getType()==18)
        stats.append(Integer.toHexString(Constant.STATS_PETS_SOUL)).append("#").append(Integer.toHexString(entry.getKey())).append("#").append("0").append("#").append(Integer.toHexString(entry.getValue()));
      if(entry.getKey()==Constant.STATS_NIVEAU)
        stats.append(Integer.toHexString(Constant.STATS_NIVEAU)).append("#").append(Integer.toHexString(entry.getKey())).append("#").append("0").append("#").append(Integer.toHexString(entry.getValue()));
      isFirst=false;
    }

    for(Entry<Integer, Integer> entry : Stats.getMap().entrySet())
    {

      int statID=entry.getKey();
      if((getTemplate().getPanoId()>=81&&getTemplate().getPanoId()<=92)||(getTemplate().getPanoId()>=201&&getTemplate().getPanoId()<=212))
      {
        String[] modificable=template.getStrTemplate().split(",");
        int cantMod=modificable.length;
        for(int j=0;j<cantMod;j++)
        {
          String[] mod=modificable[j].split("#");
          if(Integer.parseInt(mod[0],16)==statID)
          {
            String jet="0d0+"+Integer.parseInt(mod[1],16);
            if(!isFirst)
              stats.append(",");
            stats.append(mod[0]).append("#").append(mod[1]).append("#0#").append(mod[3]).append("#").append(jet);
            isFirst=false;
          }
        }
        continue;
      }

      if(!isFirst)
        stats.append(",");
      if(statID==615)
      {
        stats.append(Integer.toHexString(statID)).append("#0#0#").append(Integer.toHexString(entry.getValue()));
      }
      else if((statID==970)||(statID==971)||(statID==972)||(statID==973)||(statID==974))
      {
        int jet=entry.getValue().intValue();
        if((statID==974)||(statID==972)||(statID==970))
          stats.append(Integer.toHexString(statID)).append("#0#0#").append(Integer.toHexString(jet));
        else
          stats.append(Integer.toHexString(statID)).append("#0#0#").append(jet);
        if(statID==973)
          setObvijevanPos(jet);
        if(statID==972)
          setObvijevanLook(jet);
      }
      else if(statID==Constant.STATS_TURN)
      {
        String jet="0d0+"+entry.getValue();
        stats.append(Integer.toHexString(statID)).append("#");
        stats.append("0#0#").append(Integer.toHexString(entry.getValue())).append("#").append(jet);
      }
      else
      {
        String jet="0d0+"+entry.getValue();
        stats.append(Integer.toHexString(statID)).append("#");
        stats.append(Integer.toHexString(entry.getValue().intValue())).append("#0#0#").append(jet);
      }
      isFirst=false;
    }
    return stats.toString();
  }

  public String parseStatsStringSansUserObvi()
  {
    if(getTemplate().getType()==83) //Si c'est une pierre d'�me vide
      return getTemplate().getStrTemplate();

    StringBuilder stats=new StringBuilder();
    boolean isFirst=true;

    if(this instanceof Fragment)
    {
      Fragment fragment=(Fragment)this;
      for(Pair<Integer, Integer> couple : fragment.getRunes())
      {
        stats.append((stats.toString().isEmpty() ? couple.getLeft() : ";"+couple.getLeft())).append(":").append(couple.getRight());
      }
      return stats.toString();
    }
    for(Entry<Integer, String> entry : txtStats.entrySet())
    {
      if(!isFirst)
        stats.append(",");
      if(template.getType()==77)
      {
        if(entry.getKey()==Constant.STATS_PETS_PDV)
          stats.append(Integer.toHexString(entry.getKey())).append("#").append(entry.getValue()).append("#0#").append(entry.getValue());
        if(entry.getKey()==Constant.STATS_PETS_POIDS)
          stats.append(Integer.toHexString(entry.getKey())).append("#").append(entry.getValue()).append("#").append(entry.getValue()).append("#").append(entry.getValue());
        if(entry.getKey()==Constant.STATS_PETS_DATE)
        {
          if(entry.getValue().contains("#"))
            stats.append(Integer.toHexString(entry.getKey())).append(entry.getValue());
          else
            stats.append(Integer.toHexString(entry.getKey())).append(Formulas.convertToDate(Long.parseLong(entry.getValue())));
        }
        //stats.append(Integer.toHexString(entry.getKey())).append(Formulas.convertToDate(Long.parseLong(entry.getValue())));
      }
      else if(entry.getKey()==Constant.STATS_DATE)
      {
        if(entry.getValue().contains("#"))
          stats.append(Integer.toHexString(entry.getKey())).append(entry.getValue());
        else
          stats.append(Integer.toHexString(entry.getKey())).append("#0#0#").append(Long.parseLong(entry.getValue()));
      }
      else if(entry.getKey()==Constant.STATS_CHANGE_BY||entry.getKey()==Constant.STATS_NAME_TRAQUE||entry.getKey()==Constant.STATS_OWNER_1)
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#0#0#0#").append(entry.getValue());
      }
      else if(entry.getKey()==Constant.STATS_GRADE_TRAQUE||entry.getKey()==Constant.STATS_ALIGNEMENT_TRAQUE||entry.getKey()==Constant.STATS_NIVEAU_TRAQUE)
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#0#0#").append(entry.getValue()).append("#0");
      }
      else if(entry.getKey()==Constant.STATS_NAME_DJ)
      {
        for(String i : entry.getValue().split(","))
          stats.append(",").append(Integer.toHexString(entry.getKey())).append("#0#0#").append(i);
      }
      else if(entry.getKey()==Constant.CAPTURE_MONSTRE)
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#0#0#").append(entry.getValue());
      }
      else if(entry.getKey()==Constant.STATS_PETS_PDV||entry.getKey()==Constant.STATS_PETS_POIDS||entry.getKey()==Constant.STATS_PETS_DATE)
      {
        PetEntry p=World.world.getPetsEntry(this.getGuid());
        if(p==null)
        {
          if(entry.getKey()==Constant.STATS_PETS_PDV)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append("a").append("#0#a");
          if(entry.getKey()==Constant.STATS_PETS_POIDS)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append("0").append("#0#0");
          if(entry.getKey()==Constant.STATS_PETS_DATE)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append("0").append("#0#0");
        }
        else
        {
          if(entry.getKey()==Constant.STATS_PETS_PDV)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toHexString(p.getPdv())).append("#0#").append(Integer.toHexString(p.getPdv()));
          if(entry.getKey()==Constant.STATS_PETS_POIDS)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toString(p.parseCorpulence())).append("#").append(p.getCorpulence()>0 ? p.parseCorpulence() : 0).append("#").append(Integer.toString(p.parseCorpulence()));
          if(entry.getKey()==Constant.STATS_PETS_DATE)
            stats.append(Integer.toHexString(entry.getKey())).append(p.parseLastEatDate());
          if(p.getIsEupeoh()&&entry.getKey()==Constant.STATS_PETS_EPO)
            stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toHexString(p.getIsEupeoh() ? 1 : 0)).append("#0#").append(Integer.toHexString(p.getIsEupeoh() ? 1 : 0));
        }
      }
      else
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#0#0#0#").append(entry.getValue());
      }
      isFirst=false;
    }
    /*
     * if(isCertif && !db) return stats.toString();
     */

    for(SpellEffect SE : Effects)
    {
      if(!isFirst)
        stats.append(",");

      String[] infos=SE.getArgs().split(";");
      try
      {
        stats.append(Integer.toHexString(SE.getEffectID())).append("#").append(infos[0]).append("#").append(infos[1]).append("#0#").append(infos[5]);
      }
      catch(Exception e)
      {
        e.printStackTrace();
        continue;
      }
      isFirst=false;
    }
    for(Entry<Integer, Integer> entry : SoulStats.entrySet())
    {
      if(!isFirst)
        stats.append(",");
      stats.append(Integer.toHexString(Constant.STATS_PETS_SOUL)).append("#").append(Integer.toHexString(entry.getKey())).append("#").append("0").append("#").append(Integer.toHexString(entry.getValue()));
      isFirst=false;
    }
    for(Entry<Integer, Integer> entry : Stats.getMap().entrySet())
    {
      if(!isFirst)
        stats.append(",");

      if(entry.getKey()==615)
      {
        stats.append(Integer.toHexString(entry.getKey())).append("#0#0#").append(Integer.toHexString(entry.getValue()));
      }
      else
      {
        String jet="0d0+"+entry.getValue();
        stats.append(Integer.toHexString(entry.getKey())).append("#").append(Integer.toHexString(entry.getValue()));
        stats.append("#0#0#").append(jet);
      }
      isFirst=false;
    }
    return stats.toString();
  }

  public String parseToSave()
  {
    return parseStatsStringSansUserObvi();
  }

  public String obvijevanOCO_Packet(int pos)
  {
    String strPos=String.valueOf(pos);
    if(pos==-1)
      strPos="";
    String upPacket="OCO";
    upPacket=upPacket+Integer.toHexString(getGuid())+"~";
    upPacket=upPacket+Integer.toHexString(getTemplate().getId())+"~";
    upPacket=upPacket+Integer.toHexString(getQuantity())+"~";
    upPacket=upPacket+strPos+"~";
    upPacket=upPacket+parseStatsString();
    this.setModification();
    return upPacket;
  }

  public void obvijevanNourir(GameObject obj)
  {
    if(obj==null)
      return;
    for(Entry<Integer, Integer> entry : Stats.getMap().entrySet())
    {
      if(entry.getKey().intValue()!=974) // on ne boost que la stat de l'exp�rience de l'obvi
        continue;
      if(entry.getValue().intValue()>500) // si le boost a une valeur sup�rieure � 500 (irr�aliste)
        return;
      entry.setValue(Integer.valueOf(entry.getValue().intValue()+obj.getTemplate().getLevel()/3));
    }
    this.setModification();
  }

  public void obvijevanChangeStat(int statID, int val)
  {
    for(Entry<Integer, Integer> entry : Stats.getMap().entrySet())
    {
      if(entry.getKey().intValue()!=statID)
        continue;
      entry.setValue(Integer.valueOf(val));
    }
    this.setModification();
  }

  public void removeAllObvijevanStats()
  {
    setObvijevanPos(0);
    scruffemu.client.other.Stats StatsSansObvi=new Stats();
    for(Entry<Integer, Integer> entry : Stats.getMap().entrySet())
    {
      int statID=entry.getKey().intValue();
      if((statID==970)||(statID==971)||(statID==972)||(statID==973)||(statID==974))
        continue;
      StatsSansObvi.addOneStat(statID,entry.getValue().intValue());
    }
    Stats=StatsSansObvi;
    this.setModification();
  }

  public void removeAll_ExepteObvijevanStats()
  {
    setObvijevanPos(0);
    scruffemu.client.other.Stats StatsSansObvi=new Stats();
    for(Entry<Integer, Integer> entry : Stats.getMap().entrySet())
    {
      int statID=entry.getKey().intValue();
      if((statID!=971)&&(statID!=972)&&(statID!=973)&&(statID!=974))
        continue;
      StatsSansObvi.addOneStat(statID,entry.getValue().intValue());
    }
    Stats=StatsSansObvi;
    this.setModification();
  }

  public String getObvijevanStatsOnly()
  {
    GameObject obj=getCloneObjet(this,1);
    obj.removeAll_ExepteObvijevanStats();
    this.setModification();
    return obj.parseStatsStringSansUserObvi();
  }

  /* *********FM SYSTEM********* */

  public Stats generateNewStatsFromTemplate(String statsTemplate, boolean useMax)
  {
    Stats itemStats=new Stats(false,null);
    //Si stats Vides
    if(statsTemplate.equals("")||statsTemplate==null)
      return itemStats;

    String[] splitted=statsTemplate.split(",");
    for(String s : splitted)
    {
      String[] stats=s.split("#");
      int statID=Integer.parseInt(stats[0],16);
      boolean follow=true;

      for(int a : Constant.ARMES_EFFECT_IDS)
        //Si c'est un Effet Actif
        if(a==statID)
          follow=false;
      if(!follow)
        continue;//Si c'�tait un effet Actif d'arme

      String jet="";
      int value=1;
      try
      {
        jet=stats[4];
        value=Formulas.getRandomJet(jet);
        if(useMax)
        {
          try
          {
            //on prend le jet max
            int min=Integer.parseInt(stats[1],16);
            int max=Integer.parseInt(stats[2],16);
            value=min;
            if(max!=0)
              value=max;
          }
          catch(Exception e)
          {
            e.printStackTrace();
            value=Formulas.getRandomJet(jet);
          }
        }
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
      itemStats.addOneStat(statID,value);
    }
    return itemStats;
  }

  public ArrayList<SpellEffect> getEffects()
  {
    return Effects;
  }

  public ArrayList<SpellEffect> getCritEffects()
  {
    ArrayList<SpellEffect> effets=new ArrayList<SpellEffect>();
    for(SpellEffect SE : Effects)
    {
      try
      {
        boolean boost=true;
        for(int i : Constant.NO_BOOST_CC_IDS)
          if(i==SE.getEffectID())
            boost=false;
        String[] infos=SE.getArgs().split(";");
        if(!boost)
        {
          effets.add(SE);
          continue;
        }
        int min=Integer.parseInt(infos[0],16)+(boost ? template.getBonusCC() : 0);
        int max=Integer.parseInt(infos[1],16)+(boost ? template.getBonusCC() : 0);
        String jet="1d"+(max-min+1)+"+"+(min-1);
        //exCode: String newArgs = Integer.toHexString(min)+";"+Integer.toHexString(max)+";-1;-1;0;"+jet;
        //osef du minMax, vu qu'on se sert du jet pour calculer les d�gats
        String newArgs="0;0;0;-1;0;"+jet;
        effets.add(new SpellEffect(SE.getEffectID(),newArgs,0,-1));
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
    }
    return effets;
  }

  public void clearStats()
  {
    //On vide l'item de tous ces effets
    Stats=new Stats();
    Effects.clear();
    txtStats.clear();
    SortStats.clear();
    SoulStats.clear();
    this.setModification();
  }

  public void refreshStatsObjet(String newsStats)
  {
    parseStringToStats(newsStats,true);
    this.setModification();
  }

  public int getResistance(String statsTemplate)
  {
    int Resistance=0;

    String[] splitted=statsTemplate.split(",");
    for(String s : splitted)
    {
      String[] stats=s.split("#");
      if(Integer.parseInt(stats[0],16)==Constant.STATS_RESIST)
      {
        Resistance=Integer.parseInt(stats[2],16);
      }
    }
    return Resistance;
  }

  public int getResistanceMax(String statsTemplate)
  {
    int ResistanceMax=0;

    String[] splitted=statsTemplate.split(",");
    for(String s : splitted)
    {
      String[] stats=s.split("#");
      if(Integer.parseInt(stats[0],16)==Constant.STATS_RESIST)
      {
        ResistanceMax=Integer.parseInt(stats[1],16);
      }
    }
    return ResistanceMax;
  }

  public int getRandomValue(String statsTemplate, int statsId)
  {
    if(statsTemplate.equals(""))
      return 0;

    String[] splitted=statsTemplate.split(",");
    int value=0;
    for(String s : splitted)
    {
      String[] stats=s.split("#");
      int statID=Integer.parseInt(stats[0],16);
      if(statID!=statsId)
        continue;
      String jet;
      try
      {
        jet=stats[4];
        value=Formulas.getRandomJet(jet);
      }
      catch(Exception e)
      {
        e.printStackTrace();
        return 0;
      }
    }
    return value;
  }

  //v2.7 - Replaced String += with StringBuilder
  public String parseFMStatsString(String statsstr, GameObject obj, int add, boolean negatif)
  {
    StringBuilder stats=new StringBuilder();
    boolean isFirst=true;
    for(SpellEffect SE : obj.Effects)
    {
      if(!isFirst)
        stats.append(",");

      String[] infos=SE.getArgs().split(";");
      try
      {
        stats.append(Integer.toHexString(SE.getEffectID())+"#"+infos[0]+"#"+infos[1]+"#0#"+infos[5]);
      }
      catch(Exception e)
      {
        e.printStackTrace();
        continue;
      }
      isFirst=false;
    }

    for(Entry<Integer, Integer> entry : obj.Stats.getMap().entrySet())
    {
      if(!isFirst)
        stats.append(",");
      if(Integer.toHexString(entry.getKey()).compareTo(statsstr)==0)
      {
        int newstats=0;
        if(negatif)
        {
          newstats=entry.getValue()-add;
          if(newstats<1)
            continue;
        }
        else
        {
          newstats=entry.getValue()+add;
        }
        String jet="0d0+"+newstats;
        stats.append(Integer.toHexString(entry.getKey())+"#"+Integer.toHexString(entry.getValue()+add)+"#0#0#"+jet);
      }
      else
      {
        String jet="0d0+"+entry.getValue();
        stats.append(Integer.toHexString(entry.getKey())+"#"+Integer.toHexString(entry.getValue())+"#0#0#"+jet);
      }
      isFirst=false;
    }

    for(Entry<Integer, String> entry : obj.txtStats.entrySet())
    {
      if(!isFirst)
        stats.append(",");
      stats.append(Integer.toHexString(entry.getKey())+"#0#0#0#"+entry.getValue());
      isFirst=false;
    }

    return stats.toString();
  }

  //v2.0 - Redid magus fail stat choice
  //v2.7 - Replaced String += with StringBuilder
  public String parseStringStatsEC_FM(GameObject obj, double poid, int carac)
  {
    StringBuilder stats=new StringBuilder();
    boolean first=false;
    double perte=0.0;
    for(SpellEffect EH : obj.Effects)
    {
      if(first)
        stats.append(",");
      String[] infos=EH.getArgs().split(";");
      try
      {
        stats.append(Integer.toHexString(EH.getEffectID())+"#"+infos[0]+"#"+infos[1]+"#0#"+infos[5]);
      }
      catch(Exception e)
      {
        e.printStackTrace();
        continue;
      }
      first=true;
    }
    java.util.Map<Integer, Integer> statsObj=new java.util.HashMap<Integer, Integer>(obj.Stats.getMap());
    java.util.ArrayList<Integer> keys=new ArrayList<Integer>(obj.Stats.getMap().keySet());
    Collections.shuffle(keys);
    int p=0;
    int key=0;
    if(keys.size()>1)
    {
      for(Integer i : keys) // On cherche un OverFM
      {
        int value=statsObj.get(i);
        if(this.isOverFm(i,value))
        {
          key=i;
          break;
        }
        p++;
      }
      if(key>0) // On place l'OverFm en t�te de liste pour �tre niqu�
      {
        keys.remove(p);
        keys.add(p,keys.get(0));
        keys.remove(0);
        keys.add(0,key);
      }
    }
    for(Integer i : keys)
    {
      int newstats=0;
      int statID=i;
      int value=statsObj.get(i);
      if(perte>poid||statID==carac)
      {
        newstats=value;
      }
      else if((statID==152)||(statID==154)||(statID==155)||(statID==157)||(statID==116)||(statID==153)) //negative cha,agi,int,str,ra and vit
      {
        float a=(float)(value*poid/100.0D);
        if(a<1.0F)
          a=1.0F;
        float chute=value+a;
        newstats=(int)Math.floor(chute);
      }
      else
      {
        if((statID==127)||(statID==101))
          continue;
        float chute;
        if(this.isOverFm(statID,value)) // Gros kick dans la gueulle de l'over FM
          chute=(float)(value-value*(poid-(int)Math.floor(perte))*2/100.0D);
        else
          chute=(float)(value-value*(poid-(int)Math.floor(perte))/100.0D);
        if((chute/(float)value)<0.75)
          chute=((float)value)*0.75F; // On ne peut pas perdre plus de 25% d'une stat d'un coup
        double chutePwr=(value-chute)*World.getPwrPerEffet(statID);
        perte+=chutePwr;
        newstats=(int)Math.floor(chute);
      }
      if(newstats<1)
        continue;
      String jet="0d0+"+newstats;
      if(first)
        stats.append(",");
      stats.append(Integer.toHexString(statID)+"#"+Integer.toHexString(newstats)+"#0#0#"+jet);
      first=true;
    }
    for(Entry<Integer, String> entry : obj.txtStats.entrySet())
    {
      if(first)
        stats.append(",");
      stats.append(Integer.toHexString((entry.getKey()))+"#0#0#0#"+entry.getValue());
      first=true;
    }
    return stats.toString();
  }

  public boolean isOverFm(int stat, int val)
  {
    boolean trouve=false;
    String statsTemplate="";
    statsTemplate=this.template.getStrTemplate();
    if(statsTemplate==null||statsTemplate.isEmpty())
      return false;
    String[] split=statsTemplate.split(",");
    for(String s : split)
    {
      String[] stats=s.split("#");
      int statID=Integer.parseInt(stats[0],16);
      if(statID!=stat)
        continue;

      trouve=true;
      boolean sig=true;
      for(int a : Constant.ARMES_EFFECT_IDS)
        if(a==statID)
          sig=false;
      if(!sig)
        continue;
      String jet="";
      int value=1;
      try
      {
        jet=stats[4];
        value=Formulas.getRandomJet(jet);
        try
        {
          int min=Integer.parseInt(stats[1],16);
          int max=Integer.parseInt(stats[2],16);
          value=min;
          if(max!=0)
            value=max;
        }
        catch(Exception e)
        {
          e.printStackTrace();
          value=Formulas.getRandomJet(jet);
        }
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
      if(val>value)
        return true;
    }
    return !trouve;
  }

  //v2.6 - Soulstone fix
  public String findOverExo(final GameObject obj, int currentStat)
  {
    String stats="";
    final Map<Integer, Integer> statsObj=new HashMap<Integer, Integer>(obj.Stats.getMap());
    final ArrayList<Integer> keys=new ArrayList<Integer>(obj.Stats.getMap().keySet());
    Collections.shuffle(keys);
    final ArrayList<Integer> key=new ArrayList<Integer>();
    if(keys.size()>0)
    {
      Iterator<Integer> iter=keys.iterator();
      while(iter.hasNext())
      {
        int i=iter.next();
        final int value=statsObj.get(i);
        if(obj.getTemplate().getType()!=83)
          if(this.isOverFm(i,value)&&i!=currentStat)
          {
            key.add(i);
          }
      }
    }
    for(Integer i : key)
    {
      final int statID=i;
      final int value=statsObj.get(i);
      stats=String.valueOf(stats)+statID+","+String.valueOf(value)+";";
    }
    return stats;
  }

  public boolean isOverFm2(int stat, int val)
  {
    boolean trouve=false;
    String statsTemplate="";
    statsTemplate=this.template.getStrTemplate();
    if(statsTemplate==null||statsTemplate.isEmpty())
      return false;
    String[] split=statsTemplate.split(",");
    for(String s : split)
    {
      String[] stats=s.split("#");
      int statID=Integer.parseInt(stats[0],16);
      if(statID!=stat)
        continue;

      trouve=true;
      boolean sig=true;
      for(int a : Constant.ARMES_EFFECT_IDS)
        if(a==statID)
          sig=false;
      if(!sig)
        continue;
      String jet="";
      int value=1;
      try
      {
        jet=stats[4];
        value=Formulas.getRandomJet(jet);
        try
        {
          int min=Integer.parseInt(stats[1],16);
          int max=Integer.parseInt(stats[2],16);
          value=min;
          if(max!=0)
            value=max;
        }
        catch(Exception e)
        {
          e.printStackTrace();
          value=Formulas.getRandomJet(jet);
        }
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
      if(val==value)
        return true;
    }
    if(!trouve)
      return true;
    return false;
  }

  //v2.8 - Better healing weapon code
  public boolean isHealWeapon()
  {
    for(SpellEffect effect : this.getEffects())
      if(effect.getEffectID()==108)
        return true;
    return false;
  }
}
