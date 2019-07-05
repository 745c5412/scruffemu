package scruffemu.fight.ia.type;

import scruffemu.fight.Fight;
import scruffemu.fight.Fighter;
import scruffemu.fight.ia.AbstractIA;
import scruffemu.fight.ia.util.Function;

public class IA21 extends AbstractIA
{

  public IA21(Fight fight, Fighter fighter, byte count)
  {
    super(fight,fighter,count);
  }

  @Override
  public void apply()
  {
    if(!this.stop&&this.fighter.canPlay()&&this.count>0)
    {
      Function.getInstance().buffIfPossibleKrala(this.fight,this.fighter,this.fighter);
      Function.getInstance().invoctantaIfPossible(this.fight,this.fighter);
      addNext(this::decrementCount,1000);
    } else
    {
      this.stop=true;
    }
  }
}