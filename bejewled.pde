// import JOption pane for message dialog boxes
import javax.swing.JOptionPane;
// x and y Coordinates
int xCoord;
int yCoord;
// index of the array that has been clicked on
int clickedIndex;
// width/height of the squares
int sqrDim;
// grid of jewls object
Grid jewlGrid;
// jewl object
Jewl selectedJewl;
// users choossen name
String username;
// player object
Player player;
// type of jewl
String selectedJewlType;
// color of jewl array
int[] selectedJewlColor;
// x & y coordinates of the selected jewl
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
// difficulty level of the game, choosen by the user in a JOption Pane
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
  stringNumOfGames = JOptionPane.showInputDialog(null, "How many games would you like to play?",numOfGames);
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

  // JOption Pane with dropdown list of 3 difficutly levels - the user can choose 1 
  difficultyLevel = (String)JOptionPane.showInputDialog(null, "Choose what level you want to play: ", 
    "WHAT LEVEL?", JOptionPane.QUESTION_MESSAGE, null, level, level[2]);
  // if the user clicks cancel the default grid object will be created
  if (difficultyLevel == null)
  {
    jewlGrid = new Grid();
    //number of seconds the game will last for
    timeAllowed = 50;
  } 
  /* if the user clicks easy a grid object will be 
  created large squares and a longer time to play the game */
  else if (difficultyLevel.equals("EASY"))
  {
    sqrDim = 100;
    timeAllowed = 60;
    jewlGrid = new Grid(sqrDim);
  } 
  /* if the user clicks medium a grid object will be created 
  with medium square size and a medium time to play the game */
  else if (difficultyLevel.equals("MEDIUM"))
  {
    sqrDim = 70;
    timeAllowed = 55;
    jewlGrid = new Grid(sqrDim);
  } 
  /* otherwise if the difficulty level is set to hard and grid object 
  will be created with the smalles square size and shortest amount of time 
  to play the game */
  else if (difficultyLevel.equals("HARD"))
  {
    sqrDim = 50;
    timeAllowed = 50;
    jewlGrid = new Grid(sqrDim);
  }
  /* number of games is the number of games set in the player object
  reduce this by 1 initially for the 1st game */
  numOfGames = player.getNumOfGames()-1;
  // the width/height of the squares on the grid as set in the grid object
  sqrDim = jewlGrid.getSquareDimension();
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
    areMoreMoves = jewlGrid.areMoreMoves();
    // if there are no more valid moves
    if(!areMoreMoves && runAreMoreMovesOnce)
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
    score = jewlGrid.getScore();
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
        jewlGrid.gridDisplay();
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
  //it game over is true
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
    // set the selected jewl to the jewl that is stored in the grid at the clicked index
    selectedJewl = jewlGrid.gridOfJewls[clickedIndex];
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
    jewlGrid.gridDisplay();
    // set the fill to black
    fill(0);
    /* in the square that the selected jewl was positioned in draw a black 
    square in that space until the mouse is released */ 
    rect(selectedJewl.getXCoord(), selectedJewl.getYCoord(), sqrDim, sqrDim);
    // if the selectedJewl is not null
    if (selectedJewl !=null)
    {
      // get the type of jewl
      selectedJewlType = selectedJewl.getJewlType();
      // get the array of colors of the jewl
      selectedJewlColor = selectedJewl.getJewlColor();
      // set the jewl color
      fill(selectedJewlColor[0], selectedJewlColor[1], selectedJewlColor[2]);
      // if the jewl type is a circle draw a circle at the mouse x and mouse y coordinates
      if (selectedJewlType.equals("circle"))
      { 
        ellipse(mouseX, mouseY, sqrDim-10, sqrDim-10);
      } 
      // otherwise if the jewl type is oval draw an oval at the mouse x and mouse y coordinates
      else if (selectedJewlType.equals("oval"))
      {
        ellipse(mouseX, mouseY, sqrDim-35, sqrDim-10);
      } 
      /* otherwise if the jewl type is triangle draw a triangle with the mouse pointer in the 
      middle of the triangle */
      else if (selectedJewlType.equals("triangle"))
      {
        triangle(mouseX-(sqrDim/2)+10, mouseY+(sqrDim/4), mouseX+(sqrDim/2)-10, mouseY+sqrDim/4, mouseX, mouseY-(sqrDim/2)+10);
      } 
      /* otherwise if the jewl type is square draw a square with the mouse pointer in the middle
      of the square */
      else if (selectedJewlType.equals("square"))
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
    // get the x and y coordinates of the selected jewl
    selectedXCoord = selectedJewl.getXCoord();
    selectedYCoord = selectedJewl.getYCoord();
    // if the jewl is moved into the next box to the right
    if (mouseX > (selectedXCoord+sqrDim) && mouseX < (selectedXCoord+(sqrDim*2)) && mouseX > 0 && mouseX < width 
      && mouseY > (selectedYCoord) && mouseY < (selectedYCoord+sqrDim) && mouseY > 0 && mouseY < height)
    {
      // call the updateGrid method in the Jewl class using the slected jewl and the direction right
      jewlGrid.updateGrid(selectedJewl, "RIGHT");
    }

    //if the jewl is moved into the next box to the left
    else if (mouseX > (selectedXCoord-sqrDim) && mouseX < (selectedXCoord) && mouseX > 0 && mouseX < width
      && mouseY > (selectedYCoord) && mouseY < (selectedYCoord+sqrDim)&& mouseY > 0 && mouseY < height)
    {
// call the updateGrid method in the Jewl class using the slected jewl and the direction left
      jewlGrid.updateGrid(selectedJewl, "LEFT");
    }

    //if the jewl is moved to the box directly above
    else if (mouseX > selectedXCoord && mouseX < selectedXCoord+sqrDim && mouseX > 0 && mouseX < width
      && mouseY > selectedYCoord - sqrDim && mouseY < selectedYCoord && mouseY > 0 && mouseY < height)
    {
      // call the updateGrid method in the Jewl class using the slected jewl and the direction above
      jewlGrid.updateGrid(selectedJewl, "ABOVE");
    }

    //if the jewl is moved to the box directly below
    else if (mouseX > selectedXCoord && mouseX < selectedXCoord+sqrDim && mouseX > 0 && mouseX < width
      && mouseY > selectedYCoord + sqrDim && mouseY < selectedYCoord+(sqrDim*2) && mouseY > 0 && mouseY < height)
    {
      // call the updateGrid method in the Jewl class using the slected jewl and the direction below
      jewlGrid.updateGrid(selectedJewl, "BELOW");
    }
    // otherwise it is not a legal move so move the jewl back to its position by calling the gridDisplay method
    else {
      background(0);
      jewlGrid.gridDisplay();
    }
    /* call the matchDetection metod to detect a meeting of 3 or more jewls of the same type
    either in a row or in a column */
    jewlGrid.matchDetection();
  }
}

// reset game method is run when a player chooses to play again 
void resetGame(){
  // if the difficulty level was null call the default grid constructor
  if(difficultyLevel == null)
  {
    jewlGrid = new Grid();
  }
  /* otherwise create a grid using the width/height dimensions of the square
  which is set by the difficulty level choosen by the user initially*/
  else
  {
    jewlGrid = new Grid(sqrDim);
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
