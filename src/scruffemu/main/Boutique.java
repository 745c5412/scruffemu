package scruffemu.main;

import java.util.ArrayList;
import java.util.List;

import scruffemu.client.Player;
import scruffemu.client.other.Stats;
import scruffemu.common.SocketManager;
import scruffemu.object.ObjectTemplate;

public class Boutique
{
  public static final List<ObjectTemplate> items=new ArrayList<>();
  private static String packet;

  public static void initPacket()
  {
    packet=getObjectList();
  }

  public static void open(Player player)
  {
    if(player.getFight()==null)
    {
      player.boutique=true;
      SocketManager.send(player,"ECK0|1");
      SocketManager.send(player,"EL"+packet);
    } else
    {
      SocketManager.GAME_SEND_MESSAGE(player,"You can not open the voteshop while in combat.");
    }
  }

  private static String getObjectList()
  {
    StringBuilder items=new StringBuilder();
    for(ObjectTemplate obj : Boutique.items)
    {
      Stats stats=obj.generateNewStatsFromTemplate(obj.getStrTemplate(),true);
      items.append(obj.getId()+";"+stats.parseToItemSetStats()).append("|");

    }
    return items.toString();
  }
}
