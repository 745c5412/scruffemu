package scruffemu.fight.ia.type;

import scruffemu.fight.Fight;
import scruffemu.fight.Fighter;
import scruffemu.fight.ia.AbstractIA;
import scruffemu.fight.ia.util.Function;

public class IA22 extends AbstractIA
{

  public IA22(Fight fight, Fighter fighter, byte count)
  {
    super(fight,fighter,count);
  }

  @Override
  public void apply()
  {
    if(!this.stop&&this.fighter.canPlay()&&this.count>0)
    {
      Fighter ennemy=Function.getInstance().getNearestEnnemy(this.fight,this.fighter);

      if(Function.getInstance().IfPossibleRasboulvulner(this.fight,this.fighter,this.fighter)==0)
        if(Function.getInstance().moveFarIfPossible(this.fight,this.fighter)==0)
          if(Function.getInstance().tpIfPossibleRasboul(this.fight,this.fighter,ennemy)==0)
            Function.getInstance().invocIfPossible(this.fight,this.fighter);

      addNext(this::decrementCount,1000);
    } else
    {
      this.stop=true;
    }
  }
}