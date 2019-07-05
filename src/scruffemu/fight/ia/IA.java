package scruffemu.fight.ia;

import scruffemu.fight.Fight;
import scruffemu.fight.Fighter;

public interface IA
{
  Fight getFight();
  Fighter getFighter();
  boolean isStop();
  void setStop(boolean stop);
  void addNext(Runnable runnable, Integer time);

  void apply();
  void endTurn();
}
