/*
 Name : Sarah Barron
 Student Number: 20013679
 
 HDIP Computer Science - WIT - March 2019
 Programming assignment 2.
 
 This is a project based on the game Bejewled which is a game that 
 initially displays a grid full of jewels . The player is allowed to swap 
 any jewel with the jewel to the left, right, above or below it.
 If you get 3 or more jewels in a row or in a column a match is detected
 and the jewels  disappear  from the display. The player gains a score for 
 each jewl matched.
 The player gets to choose their username, the number of games they want
 to play and the difficulty level of the game.
 Once the tournament is over the players score statistics are displayed to 
 the player - highest score, lowest score, average score and scores for 
 every game played.
 */

// import JOption pane for message dialog boxes
import javax.swing.JOptionPane;
// x and y Coordinates
int xCoord;
int yCoord;
// index of the array that has been clicked on
int clickedIndex;
// width/height of the squares
int sqrDim;
// grid of jewels object
Grid jewelGrid;
// jewel object
Jewel selectedJewel;
// users choossen name
String username;
// player object
Player player;
// type of jewel
String selectedJewelType;
// color of jewel array
int[] selectedJewelColor;
// x & y coordinates of the selected jewel
int selectedXCoord;
int selectedYCoord;
// score at the end of a game
int score;
// number of games inputted by the user in the JOption Pane
String stringNumOfGames;
// default number of games set to 3
int numOfGames =3;
// time allowed for the game
float timeAllowed;
// timer object
Timer timer;
// difficulty level of the game, chosen  by the user in a JOption Pane
String difficultyLevel;
// array of difficulty levels
String[] level = {"EASY", "MEDIUM", "HARD"};
// boolean game over initially set to false
boolean gameOver = false;
// boolean areMoreMoves initially set to true
boolean areMoreMoves = true;
// boolean runAreMoreMovesOnce initially set to true
boolean runAreMoreMovesOnce = true;


// processing setup method for the initial settings
void setup() {
  // size of pane
  size(700, 700);
  // background color black
  background(0);
  // JOption Pane asking user to input a username
  username = JOptionPane.showInputDialog(null, 
    "Enter your username:");
  // JOption Pane asking user to input the number of games they would like to play
  stringNumOfGames = JOptionPane.showInputDialog(null, "How many games would you like to play?", numOfGames);
  // if the user entered a number convert the string to an integer
  if (stringNumOfGames != null)
  { 
    if (stringNumOfGames.compareTo("")!=0)
    {
      numOfGames = Integer.parseInt(stringNumOfGames);
    }
  }
  // if the user clicked the cancel button or left and empty input pane and clicked ok create a default player object
  if ((stringNumOfGames == null || stringNumOfGames.equals(""))&&(username==null || username.equals("")))
  {
    player = new Player();
  }
  /* otherwise if the user clicked cancel or left an empty input pane for number of game prompt
   create a player object using the username */
  else if (stringNumOfGames == null || stringNumOfGames.equals(""))
  {
    player = new Player(username);
  } 
  /* otherwise if the user clicked cancel or left an empty input pane for user name 
   create a player object using the number of games */
  else if (username == null || username.equals(""))
  {
    player = new Player(numOfGames);
  }
  /* otherwise the user has inputted a valid username and a valid number of games so use both
   to create a player object */
  else
  {  
    player = new Player(username, numOfGames);
  }

  // JOption Pane with dropdown list of 3 difficulty levels - the user can choose 1 
  difficultyLevel = (String)JOptionPane.showInputDialog(null, "Choose what level you want to play: ", 
    "WHAT LEVEL?", JOptionPane.QUESTION_MESSAGE, null, level, level[2]);
  // if the user clicks cancel the default grid object will be created
  if (difficultyLevel == null)
  {
    jewelGrid = new Grid();
    //number of seconds the game will last for
    timeAllowed = 50;
  } 
  /* if the user clicks easy a grid object will be 
   created large squares and a longer time to play the game */
  else if (difficultyLevel.equals("EASY"))
  {
    sqrDim = 100;
    timeAllowed = 60;
    jewelGrid = new Grid(sqrDim);
  } 
  /* if the user clicks medium a grid object will be created 
   with medium square size and a medium time to play the game */
  else if (difficultyLevel.equals("MEDIUM"))
  {
    sqrDim = 70;
    timeAllowed = 55;
    jewelGrid = new Grid(sqrDim);
  } 
  /* otherwise if the difficulty level is set to hard and grid object 
   will be created with the smaller square size and shortest amount of time 
   to play the game */
  else if (difficultyLevel.equals("HARD"))
  {
    sqrDim = 50;
    timeAllowed = 50;
    jewelGrid = new Grid(sqrDim);
  }
  /* number of games is the number of games set in the player object
   reduce this by 1 initially for the 1st game */
  numOfGames = player.getNumOfGames()-1;
  // the width/height of the squares on the grid as set in the grid object
  sqrDim = jewelGrid.getSquareDimension();
  /* set the timer to the time allowed depending on the difficulty level
   selected by the user */
  timer = new Timer(timeAllowed);
}


/* draw method to check for mouse movement, to check if there are more moves 
 available to check if the timer has run out and to check if the game is over*/
void draw() {
  //timer counts down once the timer goes below 0 the game is over
  timer.countDownTimer();
  /* check if there are more valid moves on the grid if there are less than 2
   of each object type on the grid there is no more valid moves so the game can end */
  areMoreMoves = jewelGrid.areMoreMoves();
  // if there are no more valid moves
  if (!areMoreMoves && runAreMoreMovesOnce)
  { 
    //show a message JOption pane telling the user there are no more moves and game is over 
    JOptionPane.showMessageDialog(null, "GAME OVER NO MORE MOVES");
    //change runAreMoreMovesOnce to false so this if statement doesn't become infinite.
    runAreMoreMovesOnce = false;
    // set the timer to 0 in order end the game 
    timer.setTimer(0);
  }

  //if the timer goes below 0
  if (timer.getTimer()<0 ) 
  { 
    // get the score from the grid
    score = jewelGrid.getScore();
    // add the score to the players scores
    player.addScore(score);
    // if the number of games left to play is greater than 0
    if (numOfGames>0)
    { 
      // ask the user do they want to play again
      int playAgain = JOptionPane.showConfirmDialog(null, 
        "TIME UP! "+username+"\nYou scored " + score + ".\nYou have "+numOfGames+" games left to play. Would you like to continue?", 
        "Play next game?", 
        JOptionPane.YES_NO_OPTION);
      // if the user chooses yes
      if (playAgain==JOptionPane.YES_OPTION)
      {
        // call the rest the game method 
        resetGame();
        // display the new grid
        jewelGrid.gridDisplay();
      } 
      //otherwise
      else
      {
        // game over is set to true
        gameOver=true;
      }
      // reduce the number of games by 1
      numOfGames--;
    }
    // otherwise if there are no more games left to be played
    else
    {
      // set game over to true
      gameOver = true;
    }
  }
  //if game over is true
  if (gameOver)
  {
    // call the game over method
    gameOver();
  }
}


// if the mouse is pressed
void mousePressed() {
  // only allow mouse press action if the game is not over
  if (!gameOver)
  {
    // calculate the index by working out the row that the mouse click was on 
    // multiply it by the number of squares on each row.
    // then add this to the number of squares on the last row up to the point of click
    clickedIndex=(((mouseY/sqrDim)*(width/sqrDim))+(mouseX/sqrDim));
    // set the selected jewel to the jewel that is stored in the grid at the clicked index
    selectedJewel = jewelGrid.gridOfJewels[clickedIndex];
  }
}


// if the mouse is dragged
void mouseDragged() {
  // only allow action for mouse drag if the game is not over
  if (!gameOver)
  {
    // set the background to black
    background(0);
    // display the grid
    jewelGrid.gridDisplay();
    // set the fill to black
    fill(0);
    /* in the square that the selected jewel was positioned in draw a black 
     square in that space until the mouse is released */
    rect(selectedJewel.getXCoord(), selectedJewel.getYCoord(), sqrDim, sqrDim);
    // if the selectedJewel is not null
    if (selectedJewel !=null)
    {
      // get the type of jewel
      selectedJewelType = selectedJewel.getJewelType();
      // get the array of colors of the jewel
      selectedJewelColor = selectedJewel.getJewelColor();
      // set the jewel color
      fill(selectedJewelColor[0], selectedJewelColor[1], selectedJewelColor[2]);
      // if the jewel type is a circle draw a circle at the mouse x and mouse y coordinates
      if (selectedJewelType.equals("circle"))
      { 
        ellipse(mouseX, mouseY, sqrDim-10, sqrDim-10);
      } 
      // otherwise if the jewel type is oval draw an oval at the mouse x and mouse y coordinates
      else if (selectedJewelType.equals("oval"))
      {
        ellipse(mouseX, mouseY, sqrDim-35, sqrDim-10);
      } 
      /* otherwise if the jewel type is triangle draw a triangle with the mouse pointer in the 
       middle of the triangle */
      else if (selectedJewelType.equals("triangle"))
      {
        triangle(mouseX-(sqrDim/2)+10, mouseY+(sqrDim/4), mouseX+(sqrDim/2)-10, mouseY+sqrDim/4, mouseX, mouseY-(sqrDim/2)+10);
      } 
      /* otherwise if the jewel type is square draw a square with the mouse pointer in the middle
       of the square */
      else if (selectedJewelType.equals("square"))
      {
        rect(mouseX-(sqrDim/2)+10, mouseY-(sqrDim/2)+10, sqrDim-20, sqrDim-20);
      }
    }
  }
}


// when the mouse is released
void mouseReleased() {
  // only action if the game is not over
  if (!gameOver)
  {
    // get the x and y coordinates of the selected jewel
    selectedXCoord = selectedJewel.getXCoord();
    selectedYCoord = selectedJewel.getYCoord();
    // if the jewel is moved into the next box to the right
    if (mouseX > (selectedXCoord+sqrDim) && mouseX < (selectedXCoord+(sqrDim*2)) && mouseX > 0 && mouseX < width 
      && mouseY > (selectedYCoord) && mouseY < (selectedYCoord+sqrDim) && mouseY > 0 && mouseY < height)
    {
      // call the updateGrid method in the Jewel class using the selected jewel and the direction right
      jewelGrid.updateGrid(selectedJewel, "RIGHT");
    }

    //if the jewel is moved into the next box to the left
    else if (mouseX > (selectedXCoord-sqrDim) && mouseX < (selectedXCoord) && mouseX > 0 && mouseX < width
      && mouseY > (selectedYCoord) && mouseY < (selectedYCoord+sqrDim)&& mouseY > 0 && mouseY < height)
    {
      // call the updateGrid method in the Jewel class using the selected jewel and the direction left
      jewelGrid.updateGrid(selectedJewel, "LEFT");
    }

    //if the jewel is moved to the box directly above
    else if (mouseX > selectedXCoord && mouseX < selectedXCoord+sqrDim && mouseX > 0 && mouseX < width
      && mouseY > selectedYCoord - sqrDim && mouseY < selectedYCoord && mouseY > 0 && mouseY < height)
    {
      // call the updateGrid method in the Jewel class using the selected jewel and the direction above
      jewelGrid.updateGrid(selectedJewel, "ABOVE");
    }

    //if the jewel is moved to the box directly below
    else if (mouseX > selectedXCoord && mouseX < selectedXCoord+sqrDim && mouseX > 0 && mouseX < width
      && mouseY > selectedYCoord + sqrDim && mouseY < selectedYCoord+(sqrDim*2) && mouseY > 0 && mouseY < height)
    {
      // call the updateGrid method in the Jewel class using the selected jewel and the direction below
      jewelGrid.updateGrid(selectedJewel, "BELOW");
    }
    // otherwise it is not a legal move so move the jewel back to its position by calling the gridDisplay method
    else {
      background(0);
      jewelGrid.gridDisplay();
    }
    /* call the matchDetection metod to detect a meeting of 3 or more jewels of the same type
     either in a row or in a column */
    jewelGrid.matchDetection();
  }
}


// reset game method is run when a player chooses to play again 
void resetGame() {
  // if the difficulty level was null call the default grid constructor
  if (difficultyLevel == null)
  {
    jewelGrid = new Grid();
  }
  /* otherwise create a grid using the width/height dimensions of the square
   which is set by the difficulty level chosen  by the user initially*/
  else
  {
    jewelGrid = new Grid(sqrDim);
  }
  // reset the timer
  timer = new Timer(timeAllowed);
  // set runAreMorveMovesOnce back to true
  runAreMoreMovesOnce = true;
}


/* game over method is called when the player has finished the number
 of games they selected to play or when they choose no when asked if they 
 want to play another game */
void gameOver()
{
  /* prints a messsage JOption pane showing a game over message and the players
   game statistics */
  JOptionPane.showMessageDialog(null, "GAME OVER \n"+player.toString());
  // exit the program once the user clicks ok or cancel on the JOption pane
  exit();
}
