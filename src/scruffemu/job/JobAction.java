package scruffemu.job;

import scruffemu.area.map.GameCase;
import scruffemu.area.map.entity.InteractiveObject;
import scruffemu.client.Player;
import scruffemu.common.Formulas;
import scruffemu.common.PathFinding;
import scruffemu.common.SocketManager;
import scruffemu.entity.Monster;
import scruffemu.fight.spells.SpellEffect;
import scruffemu.game.World;
import scruffemu.utility.Pair;
import scruffemu.game.action.ExchangeAction;
import scruffemu.game.action.GameAction;
import scruffemu.job.magus.Potion;
import scruffemu.job.magus.Rune;
import scruffemu.main.Config;
import scruffemu.main.Constant;
import scruffemu.main.Logging;
import scruffemu.object.GameObject;
import scruffemu.object.ObjectTemplate;
import scruffemu.utility.TimerWaiterPlus;

import java.util.*;
import java.util.Map.Entry;

public class JobAction
{
  public Map<Integer, Integer> ingredients=new TreeMap<>(), lastCraft=new TreeMap<>();
  public Player player;
  public String data="";
  public boolean broken=false;
  public boolean isRepeat=false;
  public int id;
  public int min=1;
  public int max=1;
  public boolean isCraft;
  public int chan=100;
  public int time=0;
  public int xpWin=0;
  public JobStat SM;
  public JobCraft jobCraft;
  public JobCraft oldJobCraft;
  public int reConfigingRunes=-1;

  public JobAction(int sk, int min, int max, boolean craft, int arg, int xpWin)
  {
    this.id=sk;
    this.min=min;
    this.max=max;
    this.isCraft=craft;
    this.xpWin=xpWin;
    if(craft)
      this.chan=arg;
    else
      this.time=arg;
  }

  public int getId()
  {
    return this.id;
  }

  public int getMin()
  {
    return this.min;
  }

  public int getMax()
  {
    return this.max;
  }

  public boolean isCraft()
  {
    return this.isCraft;
  }

  public int getChance()
  {
    return this.chan;
  }

  public int getTime()
  {
    return this.time;
  }

  public int getXpWin()
  {
    return this.xpWin;
  }

  public JobStat getJobStat()
  {
    return this.SM;
  }

  public JobCraft getJobCraft()
  {
    return this.jobCraft;
  }

  public void setJobCraft(JobCraft jobCraft)
  {
    this.jobCraft=jobCraft;
  }

  public void startCraft(Player P)
  {
    this.jobCraft=new JobCraft(this,P);
  }

  public void startAction(Player P, InteractiveObject IO, GameAction GA, GameCase cell, JobStat SM)
  {
    this.SM=SM;
    this.player=P;

    if(P.getObjetByPos(Constant.ITEM_POS_ARME)!=null&&SM.getTemplate().getId()==36)
    {
      if(World.world.getMetier(36).isValidTool(P.getObjetByPos(Constant.ITEM_POS_ARME).getTemplate().getId()))
      {
        int dist=PathFinding.getDistanceBetween(P.getCurMap(),P.getCurCell().getId(),cell.getId());
        int distItem=JobConstant.getDistCanne(P.getObjetByPos(Constant.ITEM_POS_ARME).getTemplate().getId());
        if(distItem<dist)
        {
          SocketManager.GAME_SEND_MESSAGE(P,"You are too far away to catch a fish!");
          SocketManager.GAME_SEND_GA_PACKET(P.getGameClient(),"","0","","");
          P.setExchangeAction(null);
          P.setDoAction(false);
          return;
        }
      }
    }
    if(!this.isCraft)
    {
      P.getGameClient().action=System.currentTimeMillis();
      IO.setInteractive(false);
      IO.setState(JobConstant.IOBJECT_STATE_EMPTYING);
      SocketManager.GAME_SEND_GA_PACKET_TO_MAP(P.getCurMap(),""+GA.id,501,P.getId()+"",cell.getId()+","+this.time);
      SocketManager.GAME_SEND_GDF_PACKET_TO_MAP(P.getCurMap(),cell);
    }
    else
    {
      P.setAway(true);
      IO.setState(JobConstant.IOBJECT_STATE_EMPTYING);
      P.setExchangeAction(new ExchangeAction<>(ExchangeAction.CRAFTING,this));
      SocketManager.GAME_SEND_ECK_PACKET(P,3,this.min+";"+this.id);
      SocketManager.GAME_SEND_GDF_PACKET_TO_MAP(P.getCurMap(),cell);
    }
  }

  public void startAction(Player P, InteractiveObject IO, GameAction GA, GameCase cell)
  {
    this.player=P;
    P.setAway(true);
    IO.setState(JobConstant.IOBJECT_STATE_EMPTYING); //FIXME trouver la bonne valeur
    P.setExchangeAction(new ExchangeAction<>(ExchangeAction.CRAFTING,this));
    SocketManager.GAME_SEND_ECK_PACKET(P,3,this.min+";"+this.id); //this.min => Nbr de Case de l'interface
    SocketManager.GAME_SEND_GDF_PACKET_TO_MAP(P.getCurMap(),cell);
  }

  public void endAction(Player player, InteractiveObject IO, GameAction GA, GameCase cell)
  {
    if(!this.isCraft&&player.getGameClient().action!=0)
    {
      if(System.currentTimeMillis()-player.getGameClient().action<this.time-500)
      {
        player.getGameClient().disconnect();
        return;
      }
    }
    player.setDoAction(false);
    if(IO==null)
      return;
    if(!this.isCraft)
    {
      IO.setState(JobConstant.IOBJECT_STATE_EMPTY);
      IO.desactive();
      new TimerWaiterPlus(() -> IO.setState(JobConstant.IOBJECT_STATE_EMPTY2),1000);
      SocketManager.GAME_SEND_GDF_PACKET_TO_MAP(player.getCurMap(),cell);
      int qua=(this.max>this.min ? Formulas.getRandomValue(this.min,this.max) : this.min);

      if(SM.getTemplate().getId()==36)
      {
        if(qua>0)
          SM.addXp(player,(long)(this.getXpWin()*Config.getInstance().rateJob));
      }
      else
        SM.addXp(player,(long)(this.getXpWin()*Config.getInstance().rateJob));
      int tID=JobConstant.getObjectByJobSkill(this.id);

      if(SM.getTemplate().getId()==36&&qua>0)
      {
        if(Formulas.getRandomValue(1,1000)<=2)
        {
          int _tID=JobConstant.getPoissonRare(tID);
          if(_tID!=-1)
          {
            ObjectTemplate _T=World.world.getObjTemplate(_tID);
            if(_T!=null)
            {
              GameObject _O=_T.createNewItem(qua,true);
              if(player.addObjet(_O,true))
                World.addGameObject(_O,true);
            }
          }
        }
      }

      ObjectTemplate T=World.world.getObjTemplate(tID);
      if(T==null)
        return;
      GameObject O=T.createNewItem(qua,true);

      if(player.addObjet(O,true))
        World.addGameObject(O,true);
      SocketManager.GAME_SEND_IQ_PACKET(player,player.getId(),qua);
      SocketManager.GAME_SEND_Ow_PACKET(player);

      if(player.getMetierBySkill(this.id).get_lvl()>=30&&Formulas.getRandomValue(1,40)>39)
      {
        for(int[] protector : JobConstant.JOB_PROTECTORS)
        {
          if(tID==protector[1])
          {
            int monsterLvl=JobConstant.getProtectorLvl(player.getLevel());
            player.getCurMap().startFightVersusProtectors(player,new Monster.MobGroup(player.getCurMap().nextObjectId,cell.getId(),protector[0]+","+monsterLvl+","+monsterLvl));
            break;
          }
        }
      }
    }
    player.setAway(false);
  }

  private int addCraftObject(Player player, GameObject newObj)
  {
    for(Entry<Integer, GameObject> entry : player.getItems().entrySet())
    {
      GameObject obj=entry.getValue();
      if(obj.getTemplate().getId()==newObj.getTemplate().getId()&&obj.getTxtStat().equals(newObj.getTxtStat())&&obj.getStats().isSameStats(newObj.getStats())&&obj.getPosition()==Constant.ITEM_POS_NO_EQUIPED)
      {
        obj.setQuantity(obj.getQuantity()+newObj.getQuantity());//On ajoute QUA item a la quantit� de l'objet existant
        SocketManager.GAME_SEND_OBJECT_QUANTITY_PACKET(player,obj);
        return obj.getGuid();
      }
    }

    player.getItems().put(newObj.getGuid(),newObj);
    SocketManager.GAME_SEND_OAKO_PACKET(player,newObj);
    World.addGameObject(newObj,true);
    return -1;
  }

  public synchronized void craft(boolean repeat)
  {
    if(!this.isCraft)
      return;
    if(this.id==1||this.id==113||this.id==115||this.id==116||this.id==117||this.id==118||this.id==119||this.id==120||(this.id>=163&&this.id<=169))
    {
      return;
      /*doMage(repeat,null,null);
      return;*/
    }
    Map<Integer, Integer> items=new HashMap<>();
    for(final Map.Entry<Integer, Integer> e : this.ingredients.entrySet())
    {
      if(!this.player.hasItemGuid(e.getKey()))
      {
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
        return;
      }

      GameObject obj=World.getGameObject(e.getKey());

      if(obj==null)
      {
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
        return;
      }
      if(obj.getQuantity()<e.getValue())
      {
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
        return;
      }
      final int newQua=obj.getQuantity()-e.getValue();
      if(newQua<0)
        return;
      if(newQua==0)
      {
        this.player.removeItem(e.getKey());
        World.world.removeGameObject(e.getKey());
        SocketManager.GAME_SEND_REMOVE_ITEM_PACKET(this.player,e.getKey());
      }
      else
      {
        final int change=obj.getQuantity()-newQua;
        obj.setQuantity(newQua);
        //v2.8 - ingredient quantity updater
        SocketManager.GAME_SEND_Em_PACKET(this.player,"KO+"+e.getKey()+"|-"+change+"|"+obj.getTemplate().getId()+"|"+obj.parseStatsString().replace(";","#"));
        SocketManager.GAME_SEND_OBJECT_QUANTITY_PACKET(this.player,obj);
      }
      items.put(obj.getTemplate().getId(),e.getValue());
    }
    boolean signed=false;
    if(items.containsKey(7508))
    {
      signed=true;
      items.remove(7508);
    }
    SocketManager.GAME_SEND_Ow_PACKET(this.player);

    boolean isUnjobSkill=this.getJobStat()==null;

    if(!isUnjobSkill)
    {
      final JobStat SM=this.player.getMetierBySkill(this.id);
      final int tID=World.world.getObjectByIngredientForJob(SM.getTemplate().getListBySkill(this.id),items);
      if(tID==-1||!SM.getTemplate().canCraft(this.id,tID))
      {
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
        SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"-");
        this.ingredients.clear();
        return;
      }

      int chan=JobConstant.getChanceByNbrCaseByLvl(SM.get_lvl(),this.ingredients.size());
      boolean success=chan>=Formulas.getRandomValue(1,100);

      if(chan==99)
      {
        success=chan*2>=Formulas.getRandomValue(0,200);
      }

      switch(this.id)
      {
        case 109:
        {
          success=true;
          break;
        }
      }

      if(!success)
      {
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"EF");
        SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"-"+tID);
        SocketManager.GAME_SEND_Im_PACKET(this.player,"0118");
      }
      else
      {
        GameObject newObj=World.world.getObjTemplate(tID).createNewItemWithoutDuplication(this.player.getItems().values(),1,false);

        int guid=newObj.getGuid();
        if(guid==-1)
        { // Don't exist
          guid=newObj.setId();
          this.player.getItems().put(guid,newObj);
          SocketManager.GAME_SEND_OAKO_PACKET(this.player,newObj);
          World.addGameObject(newObj,true);
        }
        else
        {
          newObj.setQuantity(newObj.getQuantity()+1);
          SocketManager.GAME_SEND_OBJECT_QUANTITY_PACKET(this.player,newObj);
        }

        SocketManager.GAME_SEND_Ow_PACKET(this.player);
        if(signed)
          newObj.addTxtStat(988,this.player.getName());
        SocketManager.GAME_SEND_Em_PACKET(this.player,"KO+"+guid+"|1|"+tID+"|"+newObj.parseStatsString().replace(";","#"));
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"K;"+tID);
        SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"+"+tID);
      }
      int winXP=0;
      if(success)
      {
        winXP=Formulas.calculXpWinCraft(SM.get_lvl(),this.ingredients.size())*Config.getInstance().rateJob;
      }
      else if(!SM.getTemplate().isMaging())
      {
        winXP=Formulas.calculXpWinCraft(SM.get_lvl(),this.ingredients.size())*Config.getInstance().rateJob;
      }
      if(winXP>0)
      {
        SM.addXp(this.player,winXP);
        final ArrayList<JobStat> SMs=new ArrayList<JobStat>();
        SMs.add(SM);
        SocketManager.GAME_SEND_JX_PACKET(this.player,SMs);
      }
    }
    else
    {
      final int templateId=World.world.getObjectByIngredientForJob(World.world.getMetier(this.id).getListBySkill(this.id),items);
      if(templateId==-1||!World.world.getMetier(this.id).canCraft(this.id,templateId))
      {
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
        SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"-");
        this.ingredients.clear();
        return;
      }

      GameObject newObj=World.world.getObjTemplate(templateId).createNewItemWithoutDuplication(this.player.getItems().values(),1,false);

      int guid=newObj.getGuid();

      if(guid==-1)
      { // Don't exist
        guid=newObj.setId();
        this.player.getItems().put(guid,newObj);
        SocketManager.GAME_SEND_OAKO_PACKET(this.player,newObj);
        World.addGameObject(newObj,true);
      }
      else
      {
        newObj.setQuantity(newObj.getQuantity()+1);
        SocketManager.GAME_SEND_OBJECT_QUANTITY_PACKET(this.player,newObj);
      }

      if(signed)
        newObj.addTxtStat(988,this.player.getName());

      SocketManager.GAME_SEND_Ow_PACKET(this.player);
      SocketManager.GAME_SEND_Em_PACKET(this.player,"KO+"+guid+"|1|"+templateId+"|"+newObj.parseStatsString().replace(";","#"));
      SocketManager.GAME_SEND_Ec_PACKET(this.player,"K;"+templateId);
      SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"+"+templateId);
    }
    this.lastCraft.clear();
    this.lastCraft.putAll(this.ingredients);
    this.ingredients.clear();

    if(!repeat)
    {
      this.oldJobCraft=this.jobCraft;
      this.jobCraft=null;
    }
  }

  //v2.8 - no more max stats items
  public boolean craftPublicMode(Player crafter, Player receiver, Map<Player, ArrayList<Pair<Integer, Integer>>> list)
  {
    if(!this.isCraft)
      return false;

    this.player=crafter;
    JobStat SM=this.player.getMetierBySkill(this.id);
    boolean signed=false;

    if(this.id==1||this.id==113||this.id==115||this.id==116||this.id==117||this.id==118||this.id==119||this.id==120||(this.id>=163&&this.id<=169))
    {
      return false;
      /*this.SM=SM;
      doMage(isRepeat,receiver,list);*/
    }

    Map<Integer, Integer> items=new HashMap<>();

    for(Entry<Player, ArrayList<Pair<Integer, Integer>>> entry : list.entrySet())
    {
      Player player=entry.getKey();
      Map<Integer, Integer> playerItems=new HashMap<>();

      for(Pair<Integer, Integer> couple : entry.getValue())
        playerItems.put(couple.getLeft(),couple.getRight());

      for(Entry<Integer, Integer> e : playerItems.entrySet())
      {
        if(!player.hasItemGuid(e.getKey()))
        {
          SocketManager.GAME_SEND_Ec_PACKET(player,"EI");
          SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
          return false;
        }

        GameObject gameObject=World.getGameObject(e.getKey());
        if(gameObject==null)
        {
          SocketManager.GAME_SEND_Ec_PACKET(player,"EI");
          SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
          return false;
        }
        if(gameObject.getQuantity()<e.getValue())
        {
          SocketManager.GAME_SEND_Ec_PACKET(player,"EI");
          SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
          return false;
        }

        int newQua=gameObject.getQuantity()-e.getValue();

        if(newQua<0)
          return false;

        if(newQua==0)
        {
          player.removeItem(e.getKey());
          World.world.removeGameObject(e.getKey());
          SocketManager.GAME_SEND_REMOVE_ITEM_PACKET(player,e.getKey());
        }
        else
        {
          gameObject.setQuantity(newQua);
          SocketManager.GAME_SEND_OBJECT_QUANTITY_PACKET(player,gameObject);
        }

        items.put(gameObject.getTemplate().getId(),e.getValue());
      }
    }

    SocketManager.GAME_SEND_Ow_PACKET(this.player);

    //Rune de signature
    if(items.containsKey(7508))
      if(SM.get_lvl()==100)
        signed=true;
    items.remove(7508);

    int template=World.world.getObjectByIngredientForJob(SM.getTemplate().getListBySkill(this.id),items);

    if(template==-1||!SM.getTemplate().canCraft(this.id,template))
    {
      SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
      receiver.send("EcEI");
      SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"-");
      items.clear();
      return false;
    }

    boolean success=JobConstant.getChanceByNbrCaseByLvl(SM.get_lvl(),items.size())>=Formulas.getRandomValue(1,100);

    if(Logging.USE_LOG)
      Logging.getInstance().write("SecureCraft",this.player.getName()+" � crafter avec "+(success ? "SUCCES" : "ECHEC")+" l'item "+template+" ("+World.world.getObjTemplate(template).getName()+") pour "+receiver.getName());
    if(!success)
    {
      SocketManager.GAME_SEND_Ec_PACKET(this.player,"EF");
      SocketManager.GAME_SEND_Ec_PACKET(receiver,"EF");
      SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"-"+template);
      SocketManager.GAME_SEND_Im_PACKET(this.player,"0118");
    }
    else
    {
      GameObject newObj=World.world.getObjTemplate(template).createNewItem(1,false);
      if(signed)
        newObj.addTxtStat(988,this.player.getName());
      int guid=this.addCraftObject(receiver,newObj);
      if(guid==-1)
        guid=newObj.getGuid();
      String stats=newObj.parseStatsString();

      this.player.send("EcK;"+template+";T"+receiver.getName()+";"+stats);
      receiver.send("EcK;"+template+";B"+crafter.getName()+";"+stats);

      SocketManager.GAME_SEND_Ow_PACKET(this.player);
      SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"+"+template);
    }

    int winXP=Formulas.calculXpWinCraft(SM.get_lvl(),this.ingredients.size())*Config.getInstance().rateJob;
    if(SM.getTemplate().getId()==28&&winXP==1)
      winXP=10;
    if(success)
    {
      SM.addXp(this.player,winXP);
      ArrayList<JobStat> SMs=new ArrayList<>();
      SMs.add(SM);
      SocketManager.GAME_SEND_JX_PACKET(this.player,SMs);
    }

    this.ingredients.clear();
    return success;
  }

  public void addIngredient(Player player, int id, int quantity)
  {
    int oldQuantity=this.ingredients.get(id)==null ? 0 : this.ingredients.get(id);
    if(quantity<0)
      if(-quantity>oldQuantity)
        return;

    this.ingredients.remove(id);
    oldQuantity+=quantity;

    if(oldQuantity>0)
    {
      this.ingredients.put(id,oldQuantity);
      SocketManager.GAME_SEND_EXCHANGE_MOVE_OK(player,'O',"+",id+"|"+oldQuantity);
    }
    else
    {
      SocketManager.GAME_SEND_EXCHANGE_MOVE_OK(player,'O',"-",id+"");
    }
  }

  public byte sizeList(Map<Player, ArrayList<Pair<Integer, Integer>>> list)
  {
    byte size=0;

    for(ArrayList<Pair<Integer, Integer>> entry : list.values())
    {
      for(Pair<Integer, Integer> couple : entry)
      {
        GameObject object=World.getGameObject(couple.getLeft());
        if(object!=null)
        {
          ObjectTemplate objectTemplate=object.getTemplate();
          if(objectTemplate!=null&&objectTemplate.getId()!=7508)
            size++;
        }
      }
    }
    return size;
  }

  public void putLastCraftIngredients()
  {
    if(this.player==null||this.lastCraft==null||!this.ingredients.isEmpty())
      return;

    this.ingredients.clear();
    this.ingredients.putAll(this.lastCraft);
    this.ingredients.entrySet().stream().filter(e -> World.getGameObject(e.getKey())!=null).filter(e -> !(World.getGameObject(e.getKey()).getQuantity()<e.getValue())).forEach(e -> SocketManager.GAME_SEND_EXCHANGE_MOVE_OK(this.player,'O',"+",e.getKey()+"|"+e.getValue()));
  }

  public void resetCraft()
  {
    this.ingredients.clear();
    this.lastCraft.clear();
    this.oldJobCraft=null;
    this.jobCraft=null;
  }

  //v2.0 - Sinks, exomaging redone
  public boolean doMage(boolean repeat, Player receiver, Map<Player, ArrayList<Pair<Integer, Integer>>> items)
  {
    boolean isSigningRune=false;
    GameObject objectFm=null,signingRune=null,runeObject=null,potionObject=null;
    Rune rune=null;
    Potion potion=null;
    int deleteID=-1;

    final boolean secure=items!=null&&receiver!=null;
    final Map<Integer, Integer> ingredients=items==null ? this.ingredients : new HashMap<>();

    if(items!=null)
      for(Entry<Player, ArrayList<Pair<Integer, Integer>>> entry : items.entrySet())
        for(Pair<Integer, Integer> couple : entry.getValue())
          ingredients.put(couple.getLeft(),couple.getRight());

    for(int idIngredient : ingredients.keySet())
    {
      final GameObject item=World.getGameObject(idIngredient);

      if(item==null)
        if(!this.player.hasItemGuid(idIngredient)||(secure&&!this.player.hasItemGuid(idIngredient)&&!receiver.hasItemGuid(idIngredient)))
        {
          SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
          SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"-");
          ingredients.clear();
          return false;
        }

      int templateId=item.getTemplate().getId();

      if(Rune.getRuneById(templateId)!=null)
      {
        runeObject=item;
        rune=Rune.getRuneById(templateId);
      }
      else if(Potion.getPotionById(templateId)!=null)
      {
        potionObject=item;
        potion=Potion.getPotionById(templateId);
      }
      else if(templateId==7508)
      {
        isSigningRune=true;
        signingRune=item;
      }
      else
      {
        int type=item.getTemplate().getType();
        if((type>=1&&type<=11)||(type>=16&&type<=22)||type==81||type==102||type==114||item.getTemplate().getPACost()>0)
        {
          final Player player=this.player.hasItemGuid(item.getGuid()) ? this.player : receiver;
          objectFm=item;
          SocketManager.GAME_SEND_EXCHANGE_OTHER_MOVE_OK_FM(player.getGameClient(),'O',"+",String.valueOf(objectFm.getGuid())+"|"+1);
          deleteID=idIngredient;
          GameObject newObj=GameObject.getCloneObjet(objectFm,1);

          if(objectFm.getQuantity()>1)
          {
            int newQuant=objectFm.getQuantity()-1;
            objectFm.setQuantity(newQuant);
            SocketManager.GAME_SEND_OBJECT_QUANTITY_PACKET(player,objectFm);
          }
          else
          {
            World.world.removeGameObject(idIngredient);
            player.removeItem(idIngredient);
            SocketManager.GAME_SEND_DELETE_STATS_ITEM_FM(player,idIngredient);
          }
          objectFm=newObj;
          break;
        }
      }
    }

    //Invalid Input
    if(SM==null||objectFm==null||(rune==null&&potion==null))
    {
      if(objectFm!=null)
      {
        World.addGameObject(objectFm,true);
        this.player.addObjet(objectFm);
      }
      if(receiver!=null)
        SocketManager.GAME_SEND_Ec_PACKET(receiver,"EI");
      SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
      SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"-");
      ingredients.clear();
      return false;
    }

    if(deleteID!=-1)
      ingredients.remove(deleteID);

    int itemType=objectFm.getTemplate().getType();

    //Hunting rune check
    if(rune!=null)
      if(rune.getTemplateId()==10057)
        if(itemType==1||itemType==9||itemType==10||itemType==11||itemType==16||itemType==17||itemType==81)
        {
          SocketManager.GAME_SEND_MESSAGE(this.player,"You can only use this rune on weapons.");
          clearItem(objectFm);
          ingredients.clear();
          return false;
        }

    final ObjectTemplate objTemplate=objectFm.getTemplate();
    ArrayList<Integer> chances=new ArrayList<Integer>();
    String statStringObj=objectFm.parseStatsString();
    int chance=0,lvlJob=SM.get_lvl(),currentTotalPower=1,lostPower=0,oldSink=objectFm.getPuit();
    int objTemplateID=objTemplate.getId();

    //v2.8 - only allow maging of items <= twice your job level
    if(lvlJob<(int)Math.floor(objTemplate.getLevel()/2))
    {
      SocketManager.GAME_SEND_MESSAGE(this.player,"You can only mage items up to twice your job's level.");
      clearItem(objectFm);
      ingredients.clear();
      return false;
    }

    //ALL CHECKS ARE DONE FROM THIS POINT

    //calculate potion chance
    if(potion!=null)
    {
      chance=Formulas.calculChanceByElement(lvlJob,objTemplate.getLevel(),potion.getLevel());
      if(chance>100-lvlJob/20)
        chance=100-lvlJob/20;
      if(chance<lvlJob/20)
        chance=lvlJob/20;
      chances.add(0,chance);
      chances.add(1,0);
      chances.add(2,100-chance);
    }
    //calculate rune chance
    else
    {
      boolean canFM=true;
      final int statMax=getStatBaseMaxs(objectFm.getTemplate(),rune.getStatId());
      final int currentStat=Job.getActualJet(objectFm,rune.getStatId());

      int maxOvermage=getMaxStat(rune.getPower(),rune.getStatsAdd());
      if(statMax>maxOvermage) //basestat higher than theoretical max
        maxOvermage=statMax;

      //v2.8 - smarter max stat calculation
      if(currentStat+rune.getStatsAdd()>maxOvermage)
      {
        SocketManager.GAME_SEND_MESSAGE(this.player,"This mage would exceed the maximum allowed stat limit.");
        clearItem(objectFm);
        ingredients.clear();
        return false;
      }

      if(canFM)
      {
        float currentStatPower=1;
        final int statMin=getStatBaseMins(objectFm.getTemplate(),rune.getStatId());
        float maxTotalPower=maxTotalPower(objTemplateID);
        float minTotalPower=minTotalPower(objTemplateID);
        float coef=1f;
        if(minTotalPower<0&&currentStatPower<0) //Maging negative stat
        {
          if(currentStat+rune.getnPower()>minTotalPower) //Overmaging negative stat
            coef=0.6f;
        }
        else if(statMax==0&&getStatBaseMins(objectFm.getTemplate(),rune.getStatId())==0) //Exomaging, researched
          coef=0.5f;
        else if(currentStat+rune.getPower()>statMax) //Overmaging positive stat
          coef=0.8f;

        if(!objectFm.parseStatsString().isEmpty())
        {
          currentTotalPower=currentTotalPower(statStringObj,objectFm);
          currentStatPower=currentStatPower(objectFm,rune);
        }
        if(maxTotalPower<0)
          maxTotalPower=0;
        if(minTotalPower<0)
          minTotalPower=0;
        if(currentStatPower<0)
          currentStatPower=0;
        if(currentTotalPower<1)
          currentTotalPower=1;
        if(minTotalPower<0&&currentStatPower<0) //negative stats
          chances=Formulas.chanceFM(maxTotalPower,minTotalPower,currentTotalPower,currentStatPower,rune.getnPower(),statMax,statMin,rune.getStatsAdd(),coef);
        else //standard
          chances=Formulas.chanceFM(maxTotalPower,minTotalPower,currentTotalPower,currentStatPower,rune.getPower(),statMax,statMin,rune.getStatsAdd(),coef);
      }
      else
      {
        chances.add(0,0);
        chances.add(1,0);
      }
    }

    final int aleatoryChance=Formulas.getRandomValue(1,100);
    final int SC=chances.get(0);
    final int SN=chances.get(1);
    final boolean successC=aleatoryChance<=SC;
    final boolean successN=aleatoryChance<=SC+SN;

    if(successC||successN)
    {
      final int winXP=Formulas.calculXpWinFm(objectFm.getTemplate().getLevel(),rune.getPower())*Config.getInstance().rateJob;
      if(winXP>0)
      {
        SM.addXp(this.player,winXP);
        final ArrayList<JobStat> SMs=new ArrayList<JobStat>();
        SMs.add(SM);
        SocketManager.GAME_SEND_JX_PACKET(this.player,SMs);
      }
    }

    if(successC)
    {
      if(isSigningRune)
        objectFm.addTxtStat(985,this.player.getName());
      if(potion!=null)
        doCritPotionMage(potion,objectFm);
      else
        doCritRuneMage(rune,objectFm,statStringObj);

      String data=objectFm.getGuid()+"|1|"+objectFm.getTemplate().getId()+"|"+objectFm.parseStatsString();

      if(!repeat)
        this.reConfigingRunes=-1;
      if(this.reConfigingRunes!=0||this.broken)
        if(receiver==null)
          SocketManager.GAME_SEND_EXCHANGE_MOVE_OK_FM(this.player,'O',"+",data);

      this.data=data;
      SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"+"+objTemplateID);
      if(!secure)
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"K;"+objTemplateID);
    }
    else if(successN) //nSuccess item stat maging
    {
      if(isSigningRune)
        objectFm.addTxtStat(985,this.player.getName());
      lostPower=doNormalRuneMage(rune,objectFm,statStringObj,oldSink);

      String data=objectFm.getGuid()+"|1|"+objectFm.getTemplate().getId()+"|"+objectFm.parseStatsString();
      if(!repeat)
        this.reConfigingRunes=-1;
      if(this.reConfigingRunes!=0||this.broken)
        if(receiver==null)
          SocketManager.GAME_SEND_EXCHANGE_MOVE_OK_FM(this.player,'O',"+",data);

      this.data=data;
      SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"+"+objTemplateID);

      if(lostPower>0)
      {
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"EF");
        SocketManager.GAME_SEND_Im_PACKET(this.player,"0194");
      }
      else
      {
        SocketManager.GAME_SEND_Ec_PACKET(this.player,"EF;"+objTemplateID);
      }
    }
    else //Fail item stat maging
    {
      lostPower=doFailRuneMage(rune,objectFm,statStringObj,oldSink);

      String data=objectFm.getGuid()+"|1|"+objectFm.getTemplate().getId()+"|"+objectFm.parseStatsString();
      if(!repeat)
        this.reConfigingRunes=-1;
      if(this.reConfigingRunes!=0||this.broken)
        if(receiver==null)
          SocketManager.GAME_SEND_EXCHANGE_MOVE_OK_FM(this.player,'O',"+",data);

      this.data=data;
      SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"-"+objTemplateID);
      SocketManager.GAME_SEND_Ec_PACKET(this.player,"EF");

      if(lostPower>0)
        SocketManager.GAME_SEND_Im_PACKET(this.player,"0117");
      else
        SocketManager.GAME_SEND_Im_PACKET(this.player,"0183");
    }

    int newQuantity=0;
    if(potion!=null)
      newQuantity=ingredients.get(potionObject.getGuid())==null ? 0 : ingredients.get(potionObject.getGuid())-1;
    else
      newQuantity=ingredients.get(runeObject.getGuid())==null ? 0 : ingredients.get(runeObject.getGuid())-1;

    if(objectFm!=null)
    {
      World.addGameObject(objectFm,true);
      if(receiver==null)
        this.player.addObjet(objectFm);
      else
        receiver.addObjet(objectFm);
    }

    if(receiver==null)
    {
      if(signingRune!=null)
        decrementObjectQuantity(this.player,signingRune);
      if(potion!=null)
        decrementObjectQuantity(this.player,potionObject);
      else if(rune!=null)
        decrementObjectQuantity(this.player,runeObject);

      this.player.send("EmKO-"+objectFm.getGuid()+"|1|");
      this.ingredients.clear();
      this.player.send("EMKO+"+objectFm.getGuid()+"|1");
      this.ingredients.put(objectFm.getGuid(),1);

      if(newQuantity>=1)
      {
        if(potion!=null)
        {
          this.player.send("EMKO+"+potionObject.getGuid()+"|"+newQuantity);
          this.ingredients.put(potionObject.getGuid(),newQuantity);
        }
        else
        {
          this.player.send("EMKO+"+runeObject.getGuid()+"|"+newQuantity);
          this.ingredients.put(runeObject.getGuid(),newQuantity);
        }
      }
      else if(potion!=null)
        this.player.send("EMKO-"+potionObject.getGuid());
      else
        this.player.send("EMKO-"+runeObject.getGuid());
    }
    else
    {
      if(items!=null)
      {
        for(Entry<Player, ArrayList<Pair<Integer, Integer>>> entry : items.entrySet())
        {
          final Player player=entry.getKey();
          for(Pair<Integer, Integer> couple : entry.getValue())
          {
            if(signingRune!=null&&signingRune.getGuid()==couple.getLeft())
              decrementObjectQuantity(player,signingRune);
            if(potion!=null)
            {
              if(potionObject.getGuid()==couple.getLeft())
                decrementObjectQuantity(player,potionObject);
            }
            else
            {
              if(runeObject.getGuid()==couple.getLeft())
                decrementObjectQuantity(player,runeObject);
            }
          }
        }
      }

      String stats=objectFm.parseStatsString();
      this.player.send("ErKO+"+objectFm.getGuid()+"|1|"+objTemplate+"|"+stats);
      receiver.send("ErKO+"+objectFm.getGuid()+"|1|"+objTemplate+"|"+stats);
      this.player.send("EcK;"+objTemplate+";T"+receiver.getName()+";"+stats);
      receiver.send("EcK;"+objTemplate+";B"+this.player.getName()+";"+stats);

      if(!successC)
      {
        receiver.send("EcEF");
      }
    }

    this.lastCraft.clear();
    this.lastCraft.putAll(this.ingredients);

    SocketManager.GAME_SEND_Ow_PACKET(this.player);
    if(!repeat)
      this.setJobCraft(null);
    return true;
  }

  public void clearItem(GameObject item)
  {
    World.addGameObject(item,true);
    this.player.addObjet(item);
    SocketManager.GAME_SEND_Ec_PACKET(this.player,"EI");
    SocketManager.GAME_SEND_IO_PACKET_TO_MAP(this.player.getCurMap(),this.player.getId(),"-");
  }

  public void doCritPotionMage(Potion potion, GameObject objectFm)
  {
    for(final SpellEffect effect : objectFm.getEffects())
    {
      if(effect.getEffectID()!=100)
        continue;
      final String[] infos=effect.getArgs().split(";");
      try
      {
        final int min=Integer.parseInt(infos[0],16);
        final int max=Integer.parseInt(infos[1],16);
        int newMin=min*potion.getStrength()/100;
        final int newMax=max*potion.getStrength()/100;
        if(newMin==0)
          newMin=1;
        final String newRange="1d"+(newMax-newMin+1)+"+"+(newMin-1);
        final String newArgs=String.valueOf(Integer.toHexString(newMin))+";"+Integer.toHexString(newMax)+";-1;-1;0;"+newRange;
        effect.setArgs(newArgs);
        effect.setEffectID(potion.getStatId());
      }
      catch(Exception e)
      {
        e.printStackTrace();
      }
    }
  }

  public void doCritRuneMage(Rune rune, GameObject objectFm, String statStringObj)
  {
    String runeStat=rune.getStatId();
    boolean negative=false;
    final int currentStats2=Job.viewActualStatsItem(objectFm,runeStat);
    if(currentStats2==2) //change id if negative stat
    {
      runeStat=getNegativeStatByRuneStat(runeStat);
      if(runeStat!=rune.getStatId())
        negative=true;
    }
    if(currentStats2==1||currentStats2==2)
    {
      if(statStringObj.isEmpty())
      {
        final String statsStr=String.valueOf(runeStat)+"#"+Integer.toHexString(rune.getStatsAdd())+"#0#0#0d0+"+rune.getStatsAdd();
        objectFm.clearStats();
        objectFm.parseStringToStats(statsStr,true);
      }
      else
      {
        final String statsStr=objectFm.parseFMStatsString(runeStat,objectFm,rune.getStatsAdd(),negative);
        objectFm.clearStats();
        objectFm.parseStringToStats(statsStr,true);
      }
    }
    else if(objectFm.parseStatsString().isEmpty())
    {
      final String statsStr=String.valueOf(runeStat)+"#"+Integer.toHexString(rune.getStatsAdd())+"#0#0#0d0+"+rune.getStatsAdd();
      objectFm.clearStats();
      objectFm.parseStringToStats(statsStr,true);
    }
    else
    {
      final String statsStr=String.valueOf(objectFm.parseFMStatsString(runeStat,objectFm,rune.getStatsAdd(),negative))+","+runeStat+"#"+Integer.toHexString(rune.getStatsAdd())+"#0#0#0d0+"+rune.getStatsAdd();
      objectFm.clearStats();
      objectFm.parseStringToStats(statsStr,true);
    }
  }

  public int doNormalRuneMage(Rune rune, GameObject objectFm, String statStringObj, int oldSink)
  {
    String runeStat=rune.getStatId();
    boolean negative=false;
    int lostPower=0;
    int currentTotalPower=0;
    float runePower=rune.getPower();
    final int currentStats3=Job.viewActualStatsItem(objectFm,rune.getStatId());
    if(currentStats3==2) //change id if negative stat
    {
      runeStat=getNegativeStatByRuneStat(runeStat);
      if(runeStat!=rune.getStatId())
      {
        runePower=rune.getnPower();
        negative=true;
      }
    }
    if(currentStats3==1||currentStats3==2) //nSuccess targeting normal stats
    {
      if(statStringObj.isEmpty()) //item does not have stats
      {
        final String statsStr2=String.valueOf(runeStat)+"#"+Integer.toHexString(rune.getStatsAdd())+"#0#0#0d0+"+rune.getStatsAdd();
        objectFm.clearStats();
        objectFm.parseStringToStats(statsStr2,true);
      }
      else
      {
        String exoStatStr=objectFm.findOverExo(objectFm,Integer.parseInt(runeStat,16));
        String statsStr2="";
        int exoPower=0;
        if(exoStatStr!="") //if the item has one or more exomages
        {
          String[] exoSplit=exoStatStr.split(";");
          for(int i=0;i<exoSplit.length;i++)
          {
            String[] exoSplit2=exoSplit[i].split(",");
            float statPwr=World.getPwrPerEffet(Integer.valueOf(exoSplit2[0]));
            int entryPower=(int)(statPwr*(Integer.valueOf(exoSplit2[1])-getStatBaseMaxs(objectFm.getTemplate(),Integer.toString(Integer.valueOf(exoSplit2[0]),16))));
            exoPower=exoPower+entryPower;
          }
          if(runePower<=exoPower) //reduce all from exo stats, do not give sink, do not consume sink
          {
            statsStr2=objectFm.parseStringStatsEC_FM(objectFm,runePower,Integer.parseInt(runeStat,16));
            objectFm.clearStats();
            objectFm.parseStringToStats(statsStr2,true);
            objectFm.setPuit(oldSink);
          }
          else if(runePower>exoPower)
          {
            if(oldSink<=0) //reduce from exo and do not give sink, then from stats and give sink
            {
              statsStr2=objectFm.parseStringStatsEC_FM(objectFm,exoPower,Integer.parseInt(runeStat,16));
              objectFm.clearStats();
              objectFm.parseStringToStats(statsStr2,true);
              currentTotalPower=currentTotalPower(statStringObj,objectFm);
              String statsStr3=objectFm.parseStringStatsEC_FM(objectFm,(runePower-exoPower),Integer.parseInt(runeStat,16));
              objectFm.clearStats();
              objectFm.parseStringToStats(statsStr3,true);
              lostPower=currentTotalPower-currentTotalPower(statsStr3,objectFm);
            }
            else if(oldSink>(runePower-exoPower)) //if sink is bigger than restPower, reduce from exo then from sink
            {
              statsStr2=objectFm.parseStringStatsEC_FM(objectFm,exoPower,Integer.parseInt(runeStat,16));
              objectFm.clearStats();
              objectFm.parseStringToStats(statsStr2,true);
              int restSink=(int)Math.floor(oldSink-(runePower-exoPower));
              objectFm.setPuit(restSink);
            }
            else if(oldSink<(runePower-exoPower)) //if sink is smaller than restPower, reduce from exo then from sink then from remaining stats
            {
              statsStr2=objectFm.parseStringStatsEC_FM(objectFm,exoPower,Integer.parseInt(runeStat,16));
              objectFm.clearStats();
              objectFm.parseStringToStats(statsStr2,true);
              currentTotalPower=currentTotalPower(statStringObj,objectFm);
              float restPower=(runePower-exoPower)-oldSink;
              String statsStr3=objectFm.parseStringStatsEC_FM(objectFm,restPower,Integer.parseInt(runeStat,16));
              lostPower=currentTotalPower-currentTotalPower(statsStr3,objectFm);
              objectFm.setPuit(0);
            }
          }
        }
        else if(oldSink<=0) //no sink, reduce stats
        {
          statsStr2=objectFm.parseStringStatsEC_FM(objectFm,runePower,Integer.parseInt(runeStat,16));
          objectFm.clearStats();
          objectFm.parseStringToStats(statsStr2,true);
          lostPower=currentTotalPower-currentTotalPower(statsStr2,objectFm);
        }
        else if(oldSink<runePower) //reduce sink to 0, lose stats
        {
          float restPower=runePower-oldSink;
          statsStr2=objectFm.parseStringStatsEC_FM(objectFm,restPower,Integer.parseInt(runeStat,16));
          objectFm.clearStats();
          objectFm.parseStringToStats(statsStr2,true);
          lostPower=currentTotalPower-currentTotalPower(statsStr2,objectFm);
          objectFm.setPuit(0);
        }
        else if(oldSink>=runePower) //use sink for stats
        {
          int restSink=(int)Math.floor(oldSink-runePower);
          objectFm.setPuit(restSink);
        }
        statsStr2=objectFm.parseFMStatsString(runeStat,objectFm,rune.getStatsAdd(),negative);
        objectFm.clearStats();
        objectFm.parseStringToStats(statsStr2,true);
      }
    }
    else if(statStringObj.isEmpty()) //nSuccess targeting normal success exomage
    {
      final String statsStr2=String.valueOf(runeStat)+"#"+Integer.toHexString(rune.getStatsAdd())+"#0#0#0d0+"+rune.getStatsAdd();
      objectFm.clearStats();
      objectFm.parseStringToStats(statsStr2,true);
    }
    else //nSuccess
    {
      String statsStr2="";
      if(oldSink<=0)
      {
        statsStr2=objectFm.parseStringStatsEC_FM(objectFm,runePower,Integer.parseInt(runeStat,16));
        objectFm.clearStats();
        objectFm.parseStringToStats(statsStr2,true);
        lostPower=currentTotalPower-currentTotalPower(statsStr2,objectFm);
      }
      else if(oldSink<runePower) //reduce sink to 0, lose stats
      {
        float restPower=runePower-oldSink;
        statsStr2=objectFm.parseStringStatsEC_FM(objectFm,restPower,Integer.parseInt(runeStat,16));
        objectFm.clearStats();
        objectFm.parseStringToStats(statsStr2,true);
        lostPower=currentTotalPower-currentTotalPower(statsStr2,objectFm);
        objectFm.setPuit(0);
      }
      else if(oldSink>=runePower) //use sink for stats
      {
        int restSink=(int)Math.floor(oldSink-runePower);
        objectFm.setPuit(restSink);
      }
      statsStr2=String.valueOf(objectFm.parseFMStatsString(runeStat,objectFm,rune.getStatsAdd(),negative))+","+runeStat+"#"+Integer.toHexString(rune.getStatsAdd())+"#0#0#0d0+"+rune.getStatsAdd();
      objectFm.clearStats();
      objectFm.parseStringToStats(statsStr2,true);
    }
    return lostPower;
  }

  public int doFailRuneMage(Rune rune, GameObject objectFm, String statStringObj, int oldSink)
  {
    String runeStat=rune.getStatId();
    int lostPower=0;
    int currentTotalPower=0;
    float runePower=rune.getPower();
    final int currentStats=Job.viewActualStatsItem(objectFm,rune.getStatId());
    String statsStr3="";
    if(currentStats==2) //change id if negative stat
    {
      runeStat=getNegativeStatByRuneStat(runeStat);
      if(runeStat!=rune.getStatId())
        runePower=rune.getnPower();
    }
    if(!statStringObj.isEmpty())
    {
      String exoStatStr=objectFm.findOverExo(objectFm,Integer.parseInt(rune.getStatId(),16));
      String statsStr2="";
      int exoPower=0;
      if(exoStatStr!="") //if the item has one or more exomages
      {
        String[] exoSplit=exoStatStr.split(";");
        for(int i=0;i<exoSplit.length;i++)
        {
          String[] exoSplit2=exoSplit[i].split(",");
          float statPwr=World.getPwrPerEffet(Integer.valueOf(exoSplit2[0]));
          int entryPower=(int)(statPwr*(Integer.valueOf(exoSplit2[1])-getStatBaseMaxs(objectFm.getTemplate(),Integer.toString(Integer.valueOf(exoSplit2[0]),16))));
          exoPower=exoPower+entryPower;
        }
        if(runePower<=exoPower) //reduce all from exo stats, give sink
        {
          currentTotalPower=currentTotalPower(statStringObj,objectFm);
          statsStr2=objectFm.parseStringStatsEC_FM(objectFm,runePower,-1);
          objectFm.clearStats();
          objectFm.parseStringToStats(statsStr2,true);
          lostPower=currentTotalPower-currentTotalPower(statsStr2,objectFm);
        }
        else if(runePower>exoPower)
        {
          if(oldSink<=0) //reduce from exo and do not give sink, then from stats and give sink
          {
            statsStr2=objectFm.parseStringStatsEC_FM(objectFm,exoPower,-1);
            objectFm.clearStats();
            objectFm.parseStringToStats(statsStr2,true);
            currentTotalPower=currentTotalPower(statStringObj,objectFm);
            statsStr3=objectFm.parseStringStatsEC_FM(objectFm,(runePower-exoPower),-1);
            objectFm.clearStats();
            objectFm.parseStringToStats(statsStr3,true);
            lostPower=currentTotalPower-currentTotalPower(statsStr3,objectFm);
          }
          else if(oldSink>(runePower-exoPower)) //if sink is bigger than restPower, reduce from exo then from sink
          {
            statsStr2=objectFm.parseStringStatsEC_FM(objectFm,exoPower,-1);
            objectFm.clearStats();
            objectFm.parseStringToStats(statsStr2,true);
            int restSink=(int)Math.floor(oldSink-(runePower-exoPower));
            objectFm.setPuit(restSink);
          }
          else if(oldSink<(runePower-exoPower)) //if sink is smaller than restPower, reduce from exo then from sink then from remaining stats
          {
            statsStr2=objectFm.parseStringStatsEC_FM(objectFm,exoPower,-1);
            objectFm.clearStats();
            objectFm.parseStringToStats(statsStr2,true);
            currentTotalPower=currentTotalPower(statStringObj,objectFm);
            float restPower=(runePower-exoPower)-oldSink;
            statsStr3=objectFm.parseStringStatsEC_FM(objectFm,restPower,-1);
            lostPower=currentTotalPower-currentTotalPower(statsStr3,objectFm);
            objectFm.setPuit(0);
          }
        }
      }
      else
      {
        if(oldSink<=0)
        {
          statsStr3=objectFm.parseStringStatsEC_FM(objectFm,runePower,-1);
          objectFm.clearStats();
          objectFm.parseStringToStats(statsStr3,true);
          lostPower=currentTotalPower-currentTotalPower(statsStr3,objectFm);
        }
        else if(oldSink<runePower)
        {
          float restPower=runePower-oldSink;
          statsStr3=objectFm.parseStringStatsEC_FM(objectFm,restPower,-1);
          objectFm.clearStats();
          objectFm.parseStringToStats(statsStr3,true);
          lostPower=currentTotalPower-currentTotalPower(statsStr3,objectFm);
          objectFm.setPuit(0);
        }
        else if(oldSink>=runePower)
        {
          int restSink=(int)Math.floor(oldSink-runePower);
          objectFm.setPuit(restSink);
        }
      }
    }
    return lostPower;
  }

  private void decrementObjectQuantity(Player player, GameObject object)
  {
    if(object!=null)
    {
      int newQua=object.getQuantity()-1;
      if(newQua<=0)
      {
        player.removeItem(object.getGuid(),object.getQuantity(),true,true);
        SocketManager.GAME_SEND_REMOVE_ITEM_PACKET(player,object.getGuid());
      }
      else
      {
        object.setQuantity(newQua);
        SocketManager.GAME_SEND_OBJECT_QUANTITY_PACKET(player,object);
      }
    }
  }

  public static int currentTotalPower(final String statsModelo, final GameObject obj)
  {
    if(statsModelo.equalsIgnoreCase(""))
      return 0;
    int Weigth=1;
    int Alto=0;
    final String[] split=statsModelo.split(",");
    String[] array;
    for(int length=(array=split).length,i=0;i<length;++i)
    {
      final String s=array[i];
      final String[] stats=s.split("#");
      final int statID=Integer.parseInt(stats[0],16);
      if(statID!=985)
        if(statID!=988)
        {
          boolean xy=false;
          int[] armes_EFFECT_IDS;
          for(int length2=(armes_EFFECT_IDS=Constant.ARMES_EFFECT_IDS).length,j=0;j<length2;++j)
          {
            final int a=armes_EFFECT_IDS[j];
            if(a==statID)
              xy=true;
          }
          if(!xy)
          {
            String jet="";
            int qua=1;
            try
            {
              jet=stats[4];
              qua=Formulas.getRandomJet(jet);
              try
              {
                final int min=Integer.parseInt(stats[1],16);
                final int max=Integer.parseInt(stats[2],16);
                qua=min;
                if(max!=0)
                  qua=max;
              }
              catch(Exception e)
              {
                e.printStackTrace();
                qua=Formulas.getRandomJet(jet);
              }
            }
            catch(Exception ex)
            {
            }
            Weigth=(int)Math.floor(qua*getPowerByStatId(statID,false));
            Alto+=Weigth;
          }
        }
    }
    return Alto;
  }

  public static int getStatBaseMaxs(final ObjectTemplate objMod, final String statsModif)
  {
    final String[] split=objMod.getStrTemplate().split(",");
    String[] array;
    for(int length=(array=split).length,i=0;i<length;++i)
    {
      final String s=array[i];
      final String[] stats=s.split("#");
      if(stats[0].toLowerCase().compareTo(statsModif.toLowerCase())<=0)
        if(stats[0].toLowerCase().compareTo(statsModif.toLowerCase())==0)
        {
          int max=Integer.parseInt(stats[2],16);
          if(max==0)
            max=Integer.parseInt(stats[1],16);
          return max;
        }
    }
    return 0;
  }

  public static int getStatBaseMins(final ObjectTemplate objMod, final String statsModif)
  {
    final String[] split=objMod.getStrTemplate().split(",");
    String[] array;
    for(int length=(array=split).length,i=0;i<length;++i)
    {
      final String s=array[i];
      final String[] stats=s.split("#");
      if(stats[0].toLowerCase().compareTo(statsModif.toLowerCase())<=0)
        if(stats[0].toLowerCase().compareTo(statsModif.toLowerCase())==0)
          return Integer.parseInt(stats[1],16);
    }
    return 0;
  }

  public static float currentStatPower(final GameObject obj, Rune rune)
  {
    for(final Map.Entry<Integer, Integer> entry : obj.getStats().getMap().entrySet())
    {
      final int statID=entry.getKey();
      if(Integer.toHexString(statID).toLowerCase().compareTo(rune.getStatId().toLowerCase())>0)
        continue;
      if(Integer.toHexString(statID).toLowerCase().compareTo(rune.getStatId().toLowerCase())==0)
      {
        float finalWeight=0; //v2.0 - Divide by 0 handler
        final float Weight=entry.getValue()*(rune.getPower()/rune.getStatsAdd());
        if(Weight==0)
          finalWeight=1;
        else
          finalWeight=Weight;
        return finalWeight;
      }
    }
    return 0;
  }

  public static float minTotalPower(final int objTemplateID)
  {
    float weight=0;
    float alt=0;
    String statsTemplate="";
    statsTemplate=World.world.getObjTemplate(objTemplateID).getStrTemplate();
    if(statsTemplate==null||statsTemplate.isEmpty())
      return 0;
    final String[] split=statsTemplate.split(",");
    String[] array;
    for(int length=(array=split).length,i=0;i<length;++i)
    {
      final String s=array[i];
      final String[] stats=s.split("#");
      final int statID=Integer.parseInt(stats[0],16);
      boolean sig=true;
      int[] armes_EFFECT_IDS;
      for(int length2=(armes_EFFECT_IDS=Constant.ARMES_EFFECT_IDS).length,j=0;j<length2;++j)
      {
        final int a=armes_EFFECT_IDS[j];
        if(a==statID)
          sig=false;
      }
      if(sig)
      {
        String jet="";
        int value=1;
        try
        {
          jet=stats[4];
          value=Formulas.getRandomJet(jet);
          try
          {
            final int min=Integer.parseInt(stats[1],16);
            value=min;
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
        weight=value*getPowerByStatId(statID,false);
        if(weight==0) //v2.0 - divide by 0 handler
          weight=1;
        alt+=weight;
      }
    }
    return alt;
  }

  public static float maxTotalPower(final int objTemplateID)
  {
    float weight=0;
    float alt=0;
    String statsTemplate="";
    statsTemplate=World.world.getObjTemplate(objTemplateID).getStrTemplate();
    if(statsTemplate==null||statsTemplate.isEmpty())
      return 0;
    final String[] split=statsTemplate.split(",");
    String[] array;
    for(int length=(array=split).length,i=0;i<length;++i)
    {
      final String s=array[i];
      final String[] stats=s.split("#");
      final int statID=Integer.parseInt(stats[0],16);
      boolean sig=true;
      int[] armes_EFFECT_IDS;
      for(int length2=(armes_EFFECT_IDS=Constant.ARMES_EFFECT_IDS).length,j=0;j<length2;++j)
      {
        final int a=armes_EFFECT_IDS[j];
        if(a==statID)
          sig=false;
      }
      if(sig)
      {
        String jet="";
        int value=1;
        try
        {
          jet=stats[4];
          value=Formulas.getRandomJet(jet);
          try
          {
            final int min=Integer.parseInt(stats[1],16);
            final int max=Integer.parseInt(stats[2],16);
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
        weight=value*getPowerByStatId(statID,false);
        if(weight==0) //v2.0 - divide by 0 handler
          weight=1;
        alt+=weight;
      }
    }
    return alt;
  }

  public static int getMaxStat(float runePower, byte runeStat)
  {
    float basePower=runePower/runeStat; //power per 1 stat
    return (int)Math.floor(101/basePower);
  }

  public static String getNegativeStatByRuneStat(String runeStat)
  {
    if(runeStat.compareTo("7b")==0)
      runeStat="98";
    else if(runeStat.compareTo("77")==0)
      runeStat="9a";
    else if(runeStat.compareTo("7e")==0)
      runeStat="9b";
    else if(runeStat.compareTo("76")==0)
      runeStat="9d";
    else if(runeStat.compareTo("7c")==0)
      runeStat="9c";
    else if(runeStat.compareTo("7d")==0)
      runeStat="99";
    return runeStat;
  }

  public static float getPowerByStatId(int statId, boolean zero)
  {
    float statX=1f;
    if(zero)
      statX=0f;
    if(statId==174) //initiative
    {
      statX=0.1f;
    }
    else if(statId==125) //vitality
    {
      statX=0.2f;
    }
    else if(statId==158) //pods
    {
      statX=0.25f;
    }
    else if(statId==118||statId==126||statId==119||statId==123) //elemental stats
    {
      statX=1f;
    }
    else if(statId==138||statId==226||statId==244||statId==240||statId==243||statId==241||statId==242) //%dmg, %trapdmg, neutral res, earth res, fire res, water res, air res
    {
      statX=2f;
    }
    else if(statId==124||statId==176) //wisdom, PP
    {
      statX=3f;
    }
    else if(statId==225||statId==666) //trap damage, hunting
    {
      statX=5f;
    }
    else if(statId==210||statId==211||statId==212||statId==213||statId==214) //%resist
    {
      statX=6f;
    }
    else if(statId==178||statId==115||statId==220) //heal, crit, reflect
    {
      statX=10f;
    }
    else if(statId==112) //damage
    {
      statX=20f;
    }
    else if(statId==182) //summon
    {
      statX=30;
    }
    else if(statId==117) //range
    {
      statX=51;
    }
    else if(statId==128) //mp
    {
      statX=90;
    }
    else if(statId==111) //ap
    {
      statX=100;
    }
    return statX;
  }
}