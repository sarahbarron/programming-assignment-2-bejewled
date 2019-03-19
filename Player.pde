public class Player {
  private String userName;
  private int[] scoresArray;
  private int numOfGames;
//  private int defaultNumOfGames = 3;
  private String defaultUserName = "USERNAME";
  private int count;

  public Player()
  {
    setUserName();
    setNumOfGames();
    scoresArray = new int[numOfGames];
    count = 0;
    
  }
  public Player(String username)
  {
    username = username.trim();     
    if(username.length() > 10)
    {
      username = username.substring(0,10);
    }
    setUserName(username);
    
    setNumOfGames();
    scoresArray = new int[numOfGames];
    count =0;
  }
  public Player(int numOfGames)
  {
    setUserName();
    setNumOfGames(numOfGames);
    scoresArray = new int[numOfGames];
    count = 0;
  }
  
  public Player(String username, int numOfGames)
  {
    setNumOfGames(numOfGames);
    scoresArray = new int[numOfGames];
    count = 0;
    username = username.trim();     
    if(username.length() > 10)
    {
      username = username.substring(0,10);
    }
    setUserName(username);
  }
  
  public String getUserName()
  {
    return userName;
  }
  
  public void setUserName()
  {
    this.userName = "USERNAME";
  }
  
  public void setUserName(String username)
  {
    this.userName = username.trim();
    
    if (userName.length()>10)
    {
      this.userName = userName.substring(0,10);
    }
  }
  
  public int getNumOfGames()
  {
    return numOfGames;
  }
  
  public void setNumOfGames()
  {
    this.numOfGames = 3;
  }
  public void setNumOfGames(int numOfGames)
  {
    this.numOfGames = numOfGames;
  }
  
  public int[] getScores()
  {
    return scoresArray;
  }
  
   public void setScores(int[] scores)
  {
    this.scoresArray = scores;
  }
  
  public void addScore(int score)
  {
    
    
    if(score >= 0)
    {
      
      scoresArray[count] = score;
    
      count++;
      
    }
   
  }
  
 
  public int highestScore()
  {
    int bestScore = scoresArray[0];
    for(int i = 1; i<count; i++)
    {
      if(scoresArray[i] > bestScore)
      {
        bestScore = scoresArray[i];
      }
    }
    return bestScore;
  }
  
  public int lowestScore()
  {
    int worstScore = scoresArray[0];
    for (int i=1; i<count; i++)
    {
      if(scoresArray[i]<worstScore)
      {
        worstScore = scoresArray[i];
      }
    }
    return worstScore;
  }
  
  public int averageScore()
  {
    int total = 0;
    for (int i=0; i<count; i++)
    {
      total = total+scoresArray[i];
    }
    return total/count;
  }
  
  public String toString()
  {
    String playerString = "Scores for "+ userName.toUpperCase() +"\n";
    playerString = playerString+"Highest Score: "+highestScore()+"\n";
    playerString = playerString+"Lowest Score: "+lowestScore()+"\n";
    playerString = playerString+"Average Score: "+averageScore()+"\n\n";
    for(int i=0; i< count; i++)
    {
      playerString = playerString+"Score for GAME "+(i+1)+" : "+scoresArray[i]+"\n";
    }
    return playerString;
  }
 
  
    
}
