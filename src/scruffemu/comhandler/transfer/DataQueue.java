package scruffemu.comhandler.transfer;

import java.util.*;

public class DataQueue
{

  private static long count=0;
  public final Map<Long, Queue<?>> queues=new HashMap<>();

  public synchronized long count()
  {
    return count++;
  }

  public class Queue<T>
  {

    private final byte type;
    private T value;

    public Queue(byte type)
    {
      this.type=type;
    }

    public byte getType()
    {
      return type;
    }

    public void setValue(T value)
    {
      synchronized(this)
      {
        this.value=value;
        this.notify();
      }
    }

    public T getValue()
    {
      return value;
    }
  }
}
