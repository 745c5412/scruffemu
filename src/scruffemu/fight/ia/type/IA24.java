package scruffemu.fight.ia.type;

import scruffemu.fight.Fight;
import scruffemu.fight.Fighter;
import scruffemu.fight.ia.AbstractIA;
import scruffemu.fight.ia.util.Function;

public class IA24 extends AbstractIA
{

  public IA24(Fight fight, Fighter fighter, byte count)
  {
    super(fight,fighter,count);
  }

  @Override
  public void apply()
  {
    if(!this.stop&&this.fighter.canPlay()&&this.count>0)
    {
      Fighter friend=Function.getInstance().getNearestFriendNoInvok(this.fight,this.fighter);

      if(!Function.getInstance().moveNearIfPossible(this.fight,this.fighter,friend))
        if(!Function.getInstance().buffIfPossible(this.fight,this.fighter,friend))
          Function.getInstance().moveFarIfPossible(this.fight,this.fighter);

      addNext(this::decrementCount,800);
    } else
    {
      this.stop=true;
    }
  }
}