package scruffemu.fight.ia.type;

import java.util.ArrayList;

import scruffemu.fight.Fight;
import scruffemu.fight.Fighter;
import scruffemu.fight.ia.AbstractNeedSpell;
import scruffemu.fight.ia.util.Function;
import scruffemu.fight.spells.Spell;
import scruffemu.fight.spells.SpellEffect;

public class IA2 extends AbstractNeedSpell
{
  private byte attack=0;
  private ArrayList<Fighter> attacked=new ArrayList<Fighter>();
  Spell.SortStats dragofire=this.fighter.getMob().getSpells().get(477);

  public IA2(Fight fight, Fighter fighter, byte count)
  {
    super(fight,fighter,count);
  }

  @Override
  public void apply()
  {
    if(!this.stop&&this.fighter.canPlay()&&this.count>0)
    {
      int time=100,maxPo=1;
      boolean action=false;
      Fighter enemy=Function.getInstance().getNearestEnnemyNotListedLos(this.fight,this.fighter,this.attacked);
      Fighter enemy2=Function.getInstance().getNearestEnnemyNotListed(this.fight,this.fighter,this.attacked);

      if(enemy!=null)
        System.out.println("enemy: "+enemy.getMob().getTemplate().getId());
      else
        System.out.println("no enemy");

      for(Spell.SortStats spellStats : this.highests)
        if(spellStats.getMaxPO()>maxPo)
          maxPo=spellStats.getMaxPO();

      Fighter A=Function.getInstance().getSummoner(fight,this.fighter,63);

      int enemyBuffInfluence=0;
      if(enemy!=null)
      {
        ArrayList<SpellEffect> buffs=new ArrayList<SpellEffect>();
        buffs.addAll(enemy.getFightBuff());
        for(SpellEffect SE : buffs)
          enemyBuffInfluence+=Function.getInstance().calculInfluence(SE,this.fighter,enemy);
      }

      int summonerBuffInfluence=0;
      if(A!=null)
      {
        ArrayList<SpellEffect> buffs=new ArrayList<SpellEffect>();
        buffs.addAll(A.getFightBuff());
        for(SpellEffect SE : buffs)
          summonerBuffInfluence+=Function.getInstance().calculInfluence(SE,this.fighter,A);
      }

      if(enemy!=null)
        if(enemy.isHide())
          enemy=null;

      if(summonerBuffInfluence<=-200)
      {
        if(this.fighter.getCurPm(this.fight)>0) //move to summoner
        {
          int value=Function.getInstance().moveautourIfPossible(this.fight,this.fighter,A);
          if(value!=0)
          {
            System.out.println("reached");
            time=value;
            action=true;
          }
        }
        if(this.fighter.getCurPa(this.fight)>0&&!action) //dispell summoner
        {
          if(Function.getInstance().buffIfPossible(this.fight,this.fighter,A,this.buffs))
          {
            System.out.println("reached2");
            this.attack++;
            time=1000;
            action=true;
          }
        }
      }
      else if(enemyBuffInfluence<=-200)
      {
        if(this.fighter.getCurPa(this.fight)>0&&!action&&enemy!=null) //dispell enemy
        {
          if(Function.getInstance().buffIfPossible(this.fight,this.fighter,enemy,this.buffs))
          {
            System.out.println("reached3");
            this.attack++;
            time=1000;
            action=true;
          }
        }
      }

      if(this.fighter.getCurPa(this.fight)>0&&!action&&enemy!=null&&this.fighter.getCurPa(this.fight)>=dragofire.getPACost()) //dragofire if possible
      {
        if(fight.canCastSpell2(fighter,dragofire,fighter.getCell(),enemy.getCell()))
        {
          this.fight.tryCastSpell(this.fighter,dragofire,enemy.getCell().getId());
          System.out.println("reached4");
          this.attacked.add(enemy);
          this.attack++;
          time=dragofire.getSpell().getDuration();
          action=true;
        }
      }

      if(this.fighter.getCurPm(this.fight)>0&&enemy!=null&&this.fighter.getCurPa(this.fight)>=dragofire.getPACost()&&!action) //move into line
      {
        int value=Function.getInstance().moveenfaceIfPossible(this.fight,this.fighter,enemy,maxPo+1);
        if(value!=0)
        {
          System.out.println("reached5");
          time=value+600;
          action=true;
        }
      }

      if(this.fighter.getCurPm(this.fight)>0&&enemy2!=null&&this.fighter.getCurPa(this.fight)>=dragofire.getPACost()&&!action) //move close if blocked
      {
        if(Function.getInstance().moveNearIfPossible(this.fight,this.fighter,enemy2))
        {
          System.out.println("reached6");
          time=1500;
          action=true;
        }
      }

      if(this.fighter.getCurPm(this.fight)>0&&this.attack>0&&!action)
      {
        int value=Function.getInstance().moveFarIfPossible(this.fight,this.fighter);
        if(value!=0)
        {
          time=value;
          System.out.println("reached7");
        }
      }

      if(this.fighter.getCurPa(this.fight)==0&&this.fighter.getCurPm(this.fight)==0)
        this.stop=true;
      addNext(this::decrementCount,time);
    }
    else
    {
      this.stop=true;
    }
  }
}