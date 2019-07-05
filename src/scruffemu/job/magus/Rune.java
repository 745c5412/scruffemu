package scruffemu.job.magus;

import java.util.*;

public class Rune
{
  public final static List<Rune> runes=new ArrayList<>();
  
  private int templateId;
  private String statId;    //hex string of stat
  private byte statsAdd;   //flat stat added
  private float power;      //flat power when negative
  private float nPower;     //flat power when negative
  
  public Rune(int templateId, String statId, byte statsAdd, float power, float nPower)
  {
    this.setTemplateId(templateId);
    this.setStatId(statId);
    this.setStatsAdd(statsAdd);
    this.setPower(power);
    this.setnPower(nPower);
    Rune.runes.add(this);
  }

  public static Rune getRuneById(int id)
  {
    for(Rune rune : runes)
      if(rune.getTemplateId()==id)
        return rune;
    return null;
  }

  public float getnPower()
  {
    return nPower;
  }

  public void setnPower(float nPower)
  {
    this.nPower = nPower;
  }

  public float getPower()
  {
    return power;
  }

  public void setPower(float power)
  {
    this.power = power;
  }

  public byte getStatsAdd()
  {
    return statsAdd;
  }

  public void setStatsAdd(byte statsAdd)
  {
    this.statsAdd = statsAdd;
  }

  public String getStatId()
  {
    return statId;
  }

  public void setStatId(String statId)
  {
    this.statId = statId;
  }
  
  public int getTemplateId()
  {
    return templateId;
  }

  public void setTemplateId(int templateId)
  {
    this.templateId = templateId;
  }
  
  public static void addRunes()
  {
    new Rune(1523, "7d", (byte)5, 1f, 0.5f); //Vi
    new Rune(1548, "7d", (byte)15, 3f, 1.5f); //Pa Vi
    new Rune(1554, "7d", (byte)50, 10f, 5f); //Ra Vi
    new Rune(1521, "7c", (byte)1, 3f, 2f); //Sa
    new Rune(1546, "7c", (byte)3, 9f, 6f); //Pa Sa
    new Rune(1552, "7c", (byte)10, 30f, 20f); //Ra Sa
    new Rune(1519, "76", (byte)1, 1f, 1f); //Fo
    new Rune(1545, "76", (byte)3, 3f, 3f); //Pa Fo
    new Rune(1551, "76", (byte)10, 10f, 10f); //Ra Fo
    new Rune(1522, "7e", (byte)1, 1f, 1f); //Ine
    new Rune(1547, "7e", (byte)3, 3f, 3f); //Pa Ine
    new Rune(1553, "7e", (byte)10, 10f, 10f); //Ra Ine
    new Rune(1525, "7b", (byte)1, 1f, 1f); //Cha
    new Rune(1550, "7b", (byte)3, 3f, 3f); //Pa Cha
    new Rune(1556, "7b", (byte)10, 10f, 10f); //Ra Cha
    new Rune(1524, "77", (byte)1, 1f, 1f); //Age
    new Rune(1549, "77", (byte)3, 3f, 3f); //Pa Age
    new Rune(1555, "77", (byte)10, 10f, 10f); //Ra Age

    new Rune(1557, "6f", (byte)1, 100f, 50f); //Ga Pa
    new Rune(1558, "80", (byte)1, 90f, 45f); //Ga Pme
    new Rune(7438, "75", (byte)1, 51f, 25f); //Po
    new Rune(7442, "b6", (byte)1, 30f, 15f); //Sum
    new Rune(7433, "73", (byte)1, 10f, 5f); //Cri
    new Rune(7434, "b2", (byte)1, 10f, 5f); //So
    
    new Rune(7460, "d6", (byte)1, 6f, 3f); //Neutral Re Per
    new Rune(7459, "d2", (byte)1, 6f, 3f); //Earth Re Per
    new Rune(7457, "d5", (byte)1, 6f, 3f); //Fire Re Per
    new Rune(7560, "d3", (byte)1, 6f, 3f); //Water Re Per
    new Rune(7458, "d4", (byte)1, 6f, 3f); //Air Re Per
    new Rune(7456, "f4", (byte)1, 2f, 1f); //Neutral Re
    new Rune(7455, "f0", (byte)1, 2f, 1f); //Earth Re
    new Rune(7452, "f3", (byte)1, 2f, 1f); //Fire Re
    new Rune(7454, "f1", (byte)1, 2f, 1f); //Water Re
    new Rune(7453, "f2", (byte)1, 2f, 1f); //Air Re
    
    new Rune(7435, "70", (byte)1, 20f, 10f); //Do
    new Rune(7436, "8a", (byte)1, 2f, 1f); //Do Per
    new Rune(10618, "8a", (byte)3, 6f, 3f); //Pa Do Per
    new Rune(10619, "8a", (byte)10, 20f, 10f); //Ra Do Per
    new Rune(7437, "dc", (byte)1, 10f, 5f); //Do Ren
    new Rune(7446, "e1", (byte)1, 5f, 2.5f); //Pi
    new Rune(10613, "e1", (byte)3, 15f, 7.5f);  //Pa Pi
    new Rune(7447, "e2", (byte)1, 2f, 1f); //Pi Per
    new Rune(10615, "e2", (byte)3, 6f, 3f); //Pa Pi Per
    new Rune(10616, "e2", (byte)10, 20f, 10f); //Ra Pi Per
    
    new Rune(7443, "9e", (byte)10, 2.5f, 2.5f); //Pod
    new Rune(7444, "9e", (byte)30, 7.5f, 7.5f); //Pa Pod
    new Rune(7445, "9e", (byte)100, 25f, 25f); //Ra Pod
    new Rune(7448, "ae", (byte)10, 1f, 0.5f); //Ini
    new Rune(7449, "ae", (byte)30, 3f, 1.5f); //Pa Ini
    new Rune(7450, "ae", (byte)100, 10f, 5f); //Ra Ini
    new Rune(7451, "b0", (byte)1, 3f, 2f); //Prospe
    new Rune(10662, "b0", (byte)3, 9f, 6f); //Pa Prospe
    new Rune(10057, "31b", (byte)1, 5f, 2.5f); //Hunting
  }
}