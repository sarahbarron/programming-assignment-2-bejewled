/*
 Name : Sarah Barron
 Student Number: 20013679
 
 HDIP Computer Science - WIT - March 2019
 Programming assignment 2.
 
 Player class - creates a player. the player object stores 
 the players username, the number of games they want to
 play and the players score statistics for each game and tournament*/

public class Player {
  // Players username
  private String userName;
  // Array to store the score from each game
  private int[] scoresArray;
  // Number of games in the tournament
  private int numOfGames;
  // index for the scoresArray 
  private int gameIndex;


  /* Default Constructor sets the default username, default number of games
   creates an array for the scores and sets the initial index to 0 */
  public Player()
  {
    setUserName();
    setNumOfGames();
    scoresArray = new int[numOfGames];
    gameIndex = 0;
  }


  /* Constructor if the player has only inputted a username into the JOption Panel 
   set the username to this username, set the default number of games, 
   create an array for the scores and set the initial index to 0 */
  public Player(String username)
  {
    username = username.trim();     
    if (username.length() > 10)
    {
      username = username.substring(0, 10);
    }
    setUserName(username);

    setNumOfGames();
    scoresArray = new int[numOfGames];
    gameIndex =0;
  }


  /* Constructor if the player has only inputted number of games into the JOption Panel 
   set the username to default username, set the number of games to the inputted
   number of games, create an array for the scores and set the initial index to 0 */
  public Player(int numOfGames)
  {
    setUserName();
    setNumOfGames(numOfGames);
    scoresArray = new int[numOfGames];
    gameIndex = 0;
  }


  /* Constructor if the player has inputted a username and number of games into the JOption Panel 
   set the username to the inputted username, set the number of games to the inputted
   number of games, create an array for the scores and set the initial index to 0 */
  public Player(String username, int numOfGames)
  {
    setNumOfGames(numOfGames);
    scoresArray = new int[numOfGames];
    gameIndex = 0;
    username = username.trim();     
    if (username.length() > 10)
    {
      username = username.substring(0, 10);
    }
    setUserName(username);
  }


  // Getter method to get the username
  public String getUserName()
  {
    return userName;
  }


  // Setter method to set the username if no username has been inputted into the JOption Panel
  public void setUserName()
  {
    this.userName = "USERNAME";
  }


  // Setter method to set the username if a username has been inputted into the JOption Panel
  public void setUserName(String username)
  {
    // String method trim() removes white space before and after the username
    this.userName = username.trim();
    /* if the length of the username is greater than 10 in length only 
     keep the first 10 characters using the String substring method*/
    if (userName.length()>10)
    {
      this.userName = userName.substring(0, 10);
    }
  }


  // Getter method to get the number of games in the tournament
  public int getNumOfGames()
  {
    return numOfGames;
  }


  /* Setter method sets the number of games to a default of 3 games if the 
   user doesn't input anything into the JOption Panel */
  public void setNumOfGames()
  {
    this.numOfGames = 3;
  }


  /* Setter method sets the number of games to whatever  the user has inputted 
   into the JOption Panel */
  public void setNumOfGames(int numOfGames)
  {
    this.numOfGames = numOfGames;
  }


  // Getter method to return an array of scores 
  public int[] getScores()
  {
    return scoresArray;
  }


  //Setter method to set the array of scores
  public void setScores(int[] scores)
  {
    this.scoresArray = scores;
  }


  // method to add a score to the scores array 
  public void addScore(int score)
  {
    /* if the score is greater than or equal to 0 add the score 
     to the score array and increment the arrays index */
    if (score >= 0)
    {
      scoresArray[gameIndex] = score;   
      gameIndex++;
    }
  }


  // method to return the highest score
  public int highestScore()
  {
    /* initially assign the best score as the score in the 
     1st index of the array */
    int bestScore = scoresArray[0];
    // for every index in the array 
    for (int index = 1; index<gameIndex; index++)
    {
      /* if the score at this index is greater than the 
       best score reassign the best score to this value */
      if (scoresArray[index] > bestScore)
      {
        bestScore = scoresArray[index];
      }
    }
    // return the best score
    return bestScore;
  }


  // method to return the lowest score
  public int lowestScore()
  {
    /* initially assign the worst score to the 
     score at the first index of the array */
    int worstScore = scoresArray[0];
    // for every index in the array 
    for (int i=1; i<gameIndex; i++)
    {
      /* check if the score at this index is less than the
       worst score if it is reassign the worst score to this value */
      if (scoresArray[i]<worstScore)
      {
        worstScore = scoresArray[i];
      }
    }
    // return the worst score
    return worstScore;
  }


  // method to return the average score
  public int averageScore()
  {
    // total initially set to 0 will eventually be the total of all games scores
    int total = 0;
    // for every index in the scores array add the score to the total
    for (int index=0; index<gameIndex; index++)
    {
      total = total+scoresArray[index];
    }
    /* return the average which is the total divided by the number of 
     games played which is equivalent to the gameIndex */
    return total/gameIndex;
  }


  // Player toString method which is used when the game is over
  public String toString()
  {
    String playerString = "Scores for "+ userName.toUpperCase() +"\n";
    playerString = playerString+"Highest Score: "+highestScore()+"\n";
    playerString = playerString+"Lowest Score: "+lowestScore()+"\n";
    playerString = playerString+"Average Score: "+averageScore()+"\n\n";
    for (int i=0; i< gameIndex; i++)
    {
      playerString = playerString+"Score for GAME "+(i+1)+" : "+scoresArray[i]+"\n";
    }
    return playerString;
  }
}
