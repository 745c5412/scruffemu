package scruffemu.fight.ia.type;

import scruffemu.fight.Fight;
import scruffemu.fight.Fighter;
import scruffemu.fight.ia.AbstractIA;
import scruffemu.fight.ia.util.Function;

public class IA2 extends AbstractIA
{

  public IA2(Fight fight, Fighter fighter, byte count)
  {
    super(fight,fighter,count);
  }

  @Override
  public void apply()
  {
    if(!this.stop&&this.fighter.canPlay()&&this.count>0)
    {
      Fighter target=Function.getInstance().getNearestEnnemy(this.fight,this.fighter);

      if(target==null)
        return;
      if(!Function.getInstance().moveNearIfPossible(this.fight,this.fighter,target))
        this.stop=true;

      addNext(this::decrementCount,1000);
    } else
    {
      this.stop=true;
    }
  }
}