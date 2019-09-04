package scruffemu.command;

import scruffemu.client.Player;
import scruffemu.client.other.Party;
import scruffemu.common.SocketManager;
import scruffemu.main.Config;
import scruffemu.main.Main;

import java.util.List;

public class CommandPlayer
{

  public static boolean analyse(final Player perso, final String msg)
  {
    boolean done=false;

    if(msg.charAt(0)!='.'||msg.charAt(1)=='.')
    {
      return false;
    }
    String[] msgSplit=msg.split(" ");
    String command="";
    if(msgSplit.length==1)
    {
      if(msgSplit[0].length()>=3)
        command=msgSplit[0].substring(1,msgSplit[0].length()-1); //removes ; after command if there's no whitespace in the command
    }
    else
      command=msgSplit[0].substring(1,msgSplit[0].length());

    switch(command.toUpperCase())
    {
      case "RESTAT":
        if(msgSplit.length==1)
          done=doRestat(perso);
        break;
      case "RESPELL":
        if(msgSplit.length==1)
          done=doRespell(perso);
        break;
      case "VOTEPOINTS":
        if(Config.getInstance().VOTESHOP==true)
          if(msgSplit.length==1)
            done=doVotepoints(perso);
        break;
      case "VOTESHOP":
        if(Config.getInstance().VOTESHOP==true)
          if(msgSplit.length==1)
            done=doVoteshop(perso);
        break;
      case "TOKENS":
        if(msgSplit.length==1)
          done=doTokens(perso);
        break;
      case "STAFF":
        if(msgSplit.length==1)
          done=doStaff(perso);
        break;
      case "ASTRUB":
        if(!Config.getInstance().HEROIC)
          if(msgSplit.length==1)
            done=doAstrub(perso);
        break;
      case "GETTITLES":
        if(msgSplit.length==1)
          done=doGetTitles(perso);
        break;
      case "SETTITLE":
        if(msgSplit.length==2)
          done=doSetTitle(perso,msg);
        break;
      case "LEADER":
        if(msgSplit.length==1||msgSplit.length==2)
          done=doLeader(perso,msg);
        break;
      case "INFO":
        if(msgSplit.length==1)
          done=doInfo(perso);
        break;
      case "ALIGNMENT":
        if(!Config.getInstance().HEROIC&&!Config.getInstance().ALIGNCOMM)
          if(msgSplit.length==2)
            done=doAlignment(perso,msg);
        break;
      case "COMMANDS":
        if(msgSplit.length==1)
          done=doCommands(perso);
        break;
      case "IPDROP":
        if(msgSplit.length==1)
          done=doIpDrop(perso);
        break;
      case "NODROP":
        if(msgSplit.length==1)
          done=doNoDrop(perso);
        break;
      case "AUTOSKIP":
        if(msgSplit.length==1)
          done=doAutoSkip(perso);
        break;
    }
    return done;
  }

  private static boolean doRestat(Player perso)
  {
    if(perso.getFight()!=null)
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"You can not use this command while in a fight.");
      return true;
    }
    int cost=50000;
    long playerKamas=perso.getKamas();
    long kamasRemaining=playerKamas-cost;
    if(kamasRemaining>=0)
    {
      perso.setKamas(kamasRemaining);
      perso.getStats().addOneStat(125,-(perso.getStats().getEffect(125)-perso.getStatsParcho().getEffect(125)));
      perso.getStats().addOneStat(124,-(perso.getStats().getEffect(124)-perso.getStatsParcho().getEffect(124)));
      perso.getStats().addOneStat(118,-(perso.getStats().getEffect(118)-perso.getStatsParcho().getEffect(118)));
      perso.getStats().addOneStat(123,-(perso.getStats().getEffect(123)-perso.getStatsParcho().getEffect(123)));
      perso.getStats().addOneStat(119,-(perso.getStats().getEffect(119)-perso.getStatsParcho().getEffect(119)));
      perso.getStats().addOneStat(126,-(perso.getStats().getEffect(126)-perso.getStatsParcho().getEffect(126)));
      perso.setCapital((perso.getLevel()*5)-5);
      SocketManager.GAME_SEND_STATS_PACKET(perso);
    }
    else
    {
      perso.sendMessage("You need <b>50000</b> kamas to be able to restat.");
    }
    return true;
  }

  private static boolean doRespell(Player perso)
  {
    if(perso.getFight()!=null)
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"You can not use this command while in a fight.");
      return true;
    }
    int cost=25000;
    long playerKamas=perso.getKamas();
    long kamasRemaining=playerKamas-cost;
    if(kamasRemaining>=0)
    {
      perso.setKamas(kamasRemaining);
      SocketManager.GAME_SEND_STATS_PACKET(perso);
      perso.setisForgetingSpell(true);
      SocketManager.GAME_SEND_FORGETSPELL_INTERFACE('+',perso);
    }
    else
    {
      perso.sendMessage("You need <b>25000</b> kamas to be able to respell.");
    }
    return true;
  }

  private static boolean doVotepoints(Player perso)
  {
    perso.sendMessage("You currently have <b>"+perso.getAccount().getPoints()+"</b> votepoints.");
    return true;
  }

  private static boolean doVoteshop(Player perso)
  {
    scruffemu.main.Boutique.open(perso);
    return true;
  }

  private static boolean doTokens(Player perso)
  {
    perso.sendMessage("You currently have <b>"+perso.getTokens()+"</b> tokens.");
    return true;
  }

  private static boolean doStaff(Player perso)
  {
    String message="List of connected staff members:";
    boolean vide=true;
    for(Player player : Main.world.getOnlinePlayers())
    {
      if(player==null)
      {
        continue;
      }
      if(player.getGroupe()==null)
      {
        continue;
      }
      if(player.isInvisible())
      {
        continue;
      }
      message=String.valueOf(message)+"\n- <b><a href='asfunction:onHref,ShowPlayerPopupMenu,"+player.getName()+"'>["+player.getGroupe().getName()+"] "+player.getName()+"</a></b>";
      vide=false;
    }
    if(vide)
    {
      message="There are no staff members online.\nIf you want to contact a staff member send them a message on <b>Discord</b>.";
    }
    SocketManager.GAME_SEND_MESSAGE(perso,message);
    return true;
  }

  private static boolean doAstrub(Player perso)
  {
    if(perso.isInPrison())
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"You can not use this command while in jail.");
      return true;
    }
    if(perso.cantTP())
    {
      return true;
    }
    if(perso.getFight()!=null)
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"You can not use this command while in a fight.");
      return true;
    }
    int cost=2000;
    long playerKamas=perso.getKamas();
    long kamasRemaining=playerKamas-cost;
    if(kamasRemaining>=0)
    {
      perso.setKamas(kamasRemaining);
      SocketManager.GAME_SEND_STATS_PACKET(perso);
      perso.teleport((short)7411,311);
    }
    else
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"You need <b>2000</b> kamas to teleport to astrub.");
    }
    return true;
  }

  private static boolean doGetTitles(Player perso)
  {
    String titleString=perso.getAllTitle();
    if(titleString!="")
    {
      String[] titles=titleString.split("\\,");
      String printTitle="";
      String finalTitle="";
      for(int i=0;i<titles.length;i++)
      {
        int title=Integer.parseInt(titles[i]);
        if(title!=0)
        {
          switch(title)
          {
            case 1:
              printTitle="Someone's ghoul";
              break;
            case 2:
              printTitle="Vampyre";
              break;
            case 3:
              printTitle="Bloody Vampyre";
              break;
            case 4:
              printTitle="Cursyd Vampyre";
              break;
            case 5:
              printTitle="Ultymite Vampyre";
              break;
            case 6:
              printTitle="Demonyc Vampyre";
              break;
            case 7:
              printTitle="Runyc Vampyre";
              break;
            case 8:
              printTitle="Bworker Slayer";
              break;
            case 9:
              printTitle="Sphincter Cell Slayer";
              break;
            case 10:
              printTitle="Koolich Slayer";
              break;
            case 11:
              printTitle="Wa Wabbit Slayer";
              break;
            case 12:
              printTitle="Kimbo Slayer";
              break;
            case 13:
              printTitle="Minotoror Slayer";
              break;
            case 14:
              printTitle="Dragon Pig Slayer";
              break;
            case 15:
              printTitle="Soft Oak Slayer";
              break;
            case 16:
              printTitle="Moon Slayer";
              break;
            case 17:
              printTitle="Dark Vlad Slayer";
              break;
            case 18:
              printTitle="Bicentenary Hero";
              break;
            case 19:
              printTitle="Hispanic Knight";
              break;
            case 20:
              printTitle="Terror of the Peninsula";
              break;
            case 21:
              printTitle="Sauroshell Smasher";
              break;
            case 22:
              printTitle="Master Lumberjack";
              break;
            case 23:
              printTitle="Master Sword Smith";
              break;
            case 24:
              printTitle="Master Bow Carver";
              break;
            case 25:
              printTitle="Master Hammer Smith";
              break;
            case 26:
              printTitle="Master Shoemaker";
              break;
            case 27:
              printTitle="Master Jeweller";
              break;
            case 28:
              printTitle="Master Dagger Smith";
              break;
            case 29:
              printTitle="Master Staff Carver";
              break;
            case 30:
              printTitle="Master Wand Carver";
              break;
            case 31:
              printTitle="Master Shovel Smith";
              break;
            case 32:
              printTitle="Master Miner";
              break;
            case 33:
              printTitle="Master Baker";
              break;
            case 34:
              printTitle="Master Alchemist";
              break;
            case 35:
              printTitle="Master Tailor";
              break;
            case 36:
              printTitle="Master Farmer";
              break;
            case 37:
              printTitle="Master Axe Smith";
              break;
            case 38:
              printTitle="Master Fisherman";
              break;
            case 39:
              printTitle="Master Hunter";
              break;
            case 40:
              printTitle="Master Dagger Smithmagus";
              break;
            case 41:
              printTitle="Master Sword Smithmagus";
              break;
            case 42:
              printTitle="Master Hammer Smithmagus";
              break;
            case 43:
              printTitle="Master Shovel Smithmagus";
              break;
            case 44:
              printTitle="Master Axe Smithmagus";
              break;
            case 45:
              printTitle="Master Bow Carvmagus";
              break;
            case 46:
              printTitle="Master Wand Carvmagus";
              break;
            case 47:
              printTitle="Master Staff Carvmagus";
              break;
            case 48:
              printTitle="Master Butcher";
              break;
            case 49:
              printTitle="Master Fishmonger";
              break;
            case 50:
              printTitle="Master Shield Smith";
              break;
            case 51:
              printTitle="Master Shoemagus";
              break;
            case 52:
              printTitle="Master Jewelmagus";
              break;
            case 53:
              printTitle="Master Costumagus";
              break;
            case 54:
              printTitle="Master Handyman";
              break;
            case 55:
              printTitle="Slayer of the Snowdrifts";
              break;
            case 56:
              printTitle="Clearer of Dungeons";
              break;
          }
          finalTitle=String.valueOf(finalTitle)+"ID: "+title+", Title: "+printTitle+"\n";
        }
      }
      SocketManager.GAME_SEND_MESSAGE(perso,finalTitle);
      return true;
    }
    else
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"You do not have any titles.");
      return true;
    }
  }

  private static boolean doSetTitle(Player perso, String msg)
  {
    if(perso.getFight()!=null)
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"You can not use this command while in a fight.");
      return true;
    }
    boolean found=false;
    String titleString=perso.getAllTitle();
    String[] titles=titleString.split("\\,");
    try
    {
      int enteredTitle=Integer.parseInt(msg.substring(10,msg.length()-1));
      for(int i=0;i<titles.length;i++)
      {
        int title=Integer.parseInt(titles[i]);
        if(enteredTitle==title)
        {
          found=true;
        }
      }
      if(found)
      {
        perso.set_title(enteredTitle);
        SocketManager.GAME_SEND_STATS_PACKET(perso);
        scruffemu.database.Database.getStatics().getPlayerData().update(perso);
        if(perso.getFight()==null)
        {
          SocketManager.GAME_SEND_ALTER_GM_PACKET(perso.getCurMap(),perso);
        }
        SocketManager.GAME_SEND_MESSAGE(perso,"Your title has been updated.");
      }
      else
      {
        SocketManager.GAME_SEND_MESSAGE(perso,"You do not have this title.");
      }
      return true;
    }
    catch(Exception e)
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"Error: Invalid input.");
      return true;
    }
  }

  private static boolean doLeader(Player perso, String msg)
  {
    if(perso.cantTP())
      return true;

    final Party party=perso.getParty();

    if(party==null)
    {
      perso.sendMessage("You have to be in a group to use this command.");
      return true;
    }

    final List<Player> players=perso.getParty().getPlayers();

    if(party.getMaster()!=null)
    {
      if(!party.getChief().getName().equals(perso.getName())&&!party.getMaster().getName().equals(perso.getName()))
      {
        perso.sendMessage("You aren't the leader of your group.");
        return true;
      }
    }
    else if(!party.getChief().getName().equals(perso.getName()))
    {
      perso.sendMessage("You aren't the leader of your group.");
      return true;
    }

    if(msg.length()<=8&&party.getMaster()!=null)
    {
      perso.sendMessage("You are no longer the leader of your group.");
      players.stream().filter(follower -> follower!=party.getMaster()).forEach(follower -> SocketManager.GAME_SEND_MESSAGE(follower,"You are no longer following "+party.getMaster().getName()+"."));
      party.setMaster(null);
      return true;
    }

    Player target=perso;

    if(msg.length()>8)
    {
      String name=msg.substring(8,msg.length()-1);
      target=Main.world.getPlayerByName(name);
    }

    if(target==null)
    {
      perso.sendMessage("This player could not be found.");
      return true;
    }
    if(target.getParty()==null||!target.getParty().getPlayers().contains(perso))
    {
      perso.sendMessage("You are not in the same group as this player.");
      return true;
    }

    party.setMaster(target);

    final String message="You are now following "+target.getName()+".";
    for(Player follower : players)
      if(follower!=target)
        SocketManager.GAME_SEND_MESSAGE(follower,message);

    party.moveAllPlayersToMaster(null);
    SocketManager.GAME_SEND_MESSAGE(target,"You are now the leader of your group.");
    return true;
  }

  private static boolean doInfo(Player perso)
  {
    long uptime=System.currentTimeMillis()-Config.getInstance().startTime;
    final int jour=(int)(uptime/86400000L);
    uptime%=86400000L;
    final int hour=(int)(uptime/3600000L);
    uptime%=3600000L;
    final int min=(int)(uptime/60000L);
    uptime%=60000L;
    int sec=(int)(uptime/1000L);
    int nbPlayer=Main.world.getOnlinePlayers().size();
    int nbPlayerIp=Main.gameServer.getPlayersNumberByIp();
    String mess="The server has been online for: "+jour+" days, "+hour+" hours, "+min+" minutes and "+sec+" seconds.";
    if(nbPlayer>0)
    {
      mess=String.valueOf(mess)+"\nPlayers online: "+nbPlayer;
    }
    if(nbPlayerIp>0)
    {
      mess=String.valueOf(mess)+"\nUnique players online: "+nbPlayerIp;
    }
    SocketManager.GAME_SEND_MESSAGE(perso,"The server is currently running on "+Config.getInstance().version);
    SocketManager.GAME_SEND_MESSAGE(perso,"The rates are: "+Config.getInstance().rateXp+"x XP, "+Config.getInstance().rateKamas+"x Kamas, "+Config.getInstance().rateJob+"x Job XP and "+Config.getInstance().rateDrop+"x Drop Chance.");
    SocketManager.GAME_SEND_MESSAGE(perso,mess);
    return true;
  }

  private static boolean doAlignment(Player perso, String msg)
  {
    int cost=25000;
    long playerKamas=perso.getKamas();
    long kamasRemaining=playerKamas-cost;
    if(kamasRemaining<0)
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"You need to have 25000 kamas in order to change your alignment.");
      return true;
    }
    if(perso.getDeshonor()>0)
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"You can not change your alignment if you have dishonor.");
      return true;
    }
    try
    {
      int enteredTitle=Integer.parseInt(msg.substring(11,msg.length()-1));
      if(enteredTitle==1)
      {
        perso.modifAlignement(1);
        SocketManager.GAME_SEND_MESSAGE(perso,"You are now Bontarian!");
        perso.setKamas(kamasRemaining);
        SocketManager.GAME_SEND_STATS_PACKET(perso);
        return true;
      }
      else if(enteredTitle==2)
      {
        perso.modifAlignement(2);
        SocketManager.GAME_SEND_MESSAGE(perso,"You are now Brakmarian!");
        perso.setKamas(kamasRemaining);
        SocketManager.GAME_SEND_STATS_PACKET(perso);
        return true;
      }
      else
        SocketManager.GAME_SEND_MESSAGE(perso,"The input you provided is incorrect, use either <b>.alignment 1 (bonta)</b> or <b>.alignment 2 (brakmar)</b>.");
      return true;
    }
    catch(Exception e)
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"The input you provided is incorrect, use either <b>.alignment 1 (bonta)</b> or <b>.alignment 2 (brakmar)</b>.");
      return true;
    }
  }

  private static boolean doCommands(Player perso)
  {
    if(Config.getInstance().HEROIC)
    {
      SocketManager.GAME_SEND_MESSAGE(perso,"\nThe available commands are: \n<b>.info</b> - Gives you info about the server.\n<b>.staff</b> - Lists all the connected staff members.\n<b>.votepoints</b> - Shows how many votepoints you have.\n<b>.voteshop</b> - Opens the voteshop.\n<b>.tokens</b> - Shows how many tokens you have.\n<b>.restat</b> - Resets your unscrolled stats for 50000 kamas. (Does not reset scrolled stats)\n<b>.respell</b> - Allows you to reset a single spell and recieve back the spellpoints you've invested in it for 25000 kamas.\n<b>.gettitles</b> - Shows you a list of all the titles that you have.\n<b>.settitle (ID)</b> - Sets your title to the title with the provided ID. You can find this ID by using .gettitles.\n<b>.leader (name)</b> - Allows other players in your group to follow you (if no name is entered) or the person whose name has been entered, enter again to stop players from following the leader.\n<b>.ipdrop</b> - Makes all drops from monster fights from characters logged in on the same IP as you go to you.\n<b>.nodrop</b> - Stops you from getting drops from monsters, type again to re-enable drops from monsters.\n<b>.autoskip</b> - Makes you automatically skip your turn in combat.\n");
      return true;
    }
    else
    {
      if(Config.getInstance().VOTESHOP==true&&Config.getInstance().ALIGNCOMM==true)
      {
        SocketManager.GAME_SEND_MESSAGE(perso,"\nThe available commands are: \n<b>.info</b> - Gives you info about the server.\n<b>.staff</b> - Lists all the connected staff members.\n<b>.astrub</b> - Teleports you to astrub zaap for 2000 kamas.\n<b>.votepoints</b> - Shows how many votepoints you have.\n<b>.voteshop</b> - Opens the voteshop.\n<b>.tokens</b> - Shows how many tokens you have.\n<b>.restat</b> - Resets your unscrolled stats for 50000 kamas.\n<b>.respell</b> - Allows you to reset a single spell and recieve back the spellpoints you've invested in it for 25000 kamas.\n<b>.gettitles</b> - Shows you a list of all the titles that you have.\n<b>.settitle (ID)</b> - Sets your title to the title with the provided ID. You can find this ID by using .gettitles.\n<b>.alignment (ID)</b> - Gives you the bontarian alignment (ID=1) or the brakmarian alignment (ID=2).\n<b>.leader</b> - Allows other players in your group to follow you (if no name is entered) or the person whose name has been entered, enter again to stop players from following the leader.\n<b>.ipdrop</b> - Makes all drops from monster fights from characters logged in on the same IP as you go to you.\n<b>.nodrop</b> - Stops you from getting drops from monsters, type again to re-enable drops from monsters.\n<b>.autoskip</b> - Makes you automatically skip your turn in combat.\n");
        return true;
      }
      else if(Config.getInstance().VOTESHOP==true&&Config.getInstance().ALIGNCOMM==false)
      {
        SocketManager.GAME_SEND_MESSAGE(perso,"\nThe available commands are: \n<b>.info</b> - Gives you info about the server.\n<b>.staff</b> - Lists all the connected staff members.\n<b>.astrub</b> - Teleports you to astrub zaap for 2000 kamas.\n<b>.votepoints</b> - Shows how many votepoints you have.\n<b>.voteshop</b> - Opens the voteshop.\n<b>.tokens</b> - Shows how many tokens you have.\n<b>.restat</b> - Resets your unscrolled stats for 50000 kamas.\n<b>.respell</b> - Allows you to reset a single spell and recieve back the spellpoints you've invested in it for 25000 kamas.\n<b>.gettitles</b> - Shows you a list of all the titles that you have.\n<b>.settitle (ID)</b> - Sets your title to the title with the provided ID. You can find this ID by using .gettitles.\n<b>.leader</b> - Allows other players in your group to follow you (if no name is entered) or the person whose name has been entered, enter again to stop players from following the leader.\n<b>.ipdrop</b> - Makes all drops from monster fights from characters logged in on the same IP as you go to you.\n<b>.nodrop</b> - Stops you from getting drops from monsters, type again to re-enable drops from monsters.\n<b>.autoskip</b> - Makes you automatically skip your turn in combat.\n");
        return true;
      }
      else if(Config.getInstance().VOTESHOP==false&&Config.getInstance().ALIGNCOMM==true)
      {
        SocketManager.GAME_SEND_MESSAGE(perso,"\nThe available commands are: \n<b>.info</b> - Gives you info about the server.\n<b>.staff</b> - Lists all the connected staff members.\n<b>.astrub</b> - Teleports you to astrub zaap for 2000 kamas.\n<b>.tokens</b> - Shows how many tokens you have.\n<b>.restat</b> - Resets your unscrolled stats for 50000 kamas.\n<b>.respell</b> - Allows you to reset a single spell and recieve back the spellpoints you've invested in it for 25000 kamas.\n<b>.gettitles</b> - Shows you a list of all the titles that you have.\n<b>.settitle (ID)</b> - Sets your title to the title with the provided ID. You can find this ID by using .gettitles.\n<b>.alignment (ID)</b> - Gives you the bontarian alignment (ID=1) or the brakmarian alignment (ID=2).\n<b>.leader</b> - Allows other players in your group to follow you (if no name is entered) or the person whose name has been entered, enter again to stop players from following the leader.\n<b>.ipdrop</b> - Makes all drops from monster fights from characters logged in on the same IP as you go to you.\n<b>.nodrop</b> - Stops you from getting drops from monsters, type again to re-enable drops from monsters.\n<b>.autoskip</b> - Makes you automatically skip your turn in combat.\n");
        return true;
      }
      else
      {
        SocketManager.GAME_SEND_MESSAGE(perso,"\nThe available commands are: \n<b>.info</b> - Gives you info about the server.\n<b>.staff</b> - Lists all the connected staff members.\n<b>.astrub</b> - Teleports you to astrub zaap for 2000 kamas.\n<b>.tokens</b> - Shows how many tokens you have.\n<b>.restat</b> - Resets your unscrolled stats for 50000 kamas.\n<b>.respell</b> - Allows you to reset a single spell and recieve back the spellpoints you've invested in it for 25000 kamas.\n<b>.gettitles</b> - Shows you a list of all the titles that you have.\n<b>.settitle (ID)</b> - Sets your title to the title with the provided ID. You can find this ID by using .gettitles.\n<b>.leader</b> - Allows other players in your group to follow you (if no name is entered) or the person whose name has been entered, enter again to stop players from following the leader.\n<b>.ipdrop</b> - Makes all drops from monster fights from characters logged in on the same IP as you go to you.\n<b>.nodrop</b> - Stops you from getting drops from monsters, type again to re-enable drops from monsters.\n<b>.autoskip</b> - Makes you automatically skip your turn in combat.\n");
        return true;
      }
    }
  }

  private static boolean doIpDrop(Player perso)
  {
    if(perso.ipDrop)
    {
      perso.ipDrop=false;
      SocketManager.GAME_SEND_MESSAGE(perso,"You will no longer gain all the drops from this IP.");
    }
    else
    {
      perso.ipDrop=true;
      SocketManager.GAME_SEND_MESSAGE(perso,"You will now gain all the drops from this IP.");
    }
    return true;
  }

  private static boolean doNoDrop(Player perso)
  {
    if(perso.getCanDrop())
    {
      perso.setCanDrop(false);
      SocketManager.GAME_SEND_MESSAGE(perso,"You will no longer gain drops from monsters.");
    }
    else
    {
      perso.setCanDrop(true);
      SocketManager.GAME_SEND_MESSAGE(perso,"You will now gain drops from monsters again.");
    }
    return true;
  }

  private static boolean doAutoSkip(Player perso)
  {
    if(perso.getAutoSkip()==false)
    {
      perso.setAutoSkip(true);
      SocketManager.GAME_SEND_MESSAGE(perso,"You will now automatically skip your turn in combat.");
    }
    else
    {
      perso.setAutoSkip(false);
      SocketManager.GAME_SEND_MESSAGE(perso,"You will no longer automatically skip your turn in combat.");
    }
    return true;
  }
}