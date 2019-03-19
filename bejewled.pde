import javax.swing.JOptionPane;

int xCoord;
int yCoord;
int clickedIndex;
int sqrDim;
Grid jewlGrid;
Jewl selectedJewl;
String username;
Player player;
String selectedJewlType;
int[] selectedJewlColor;
int selectedXCoord;
int selectedYCoord;
int score;
float timeAllowed;
Timer timer;
String difficultyLevel;
String[] level = {"EASY", "MEDIUM", "HARD"};
boolean gameOver = false;
void setup() {
  frameRate(10);
  size(700, 700);  
  background(0);
  username = JOptionPane.showInputDialog(null, 
    "Enter your username:");
  if (player == null)
  {
    player = new Player();
  } else
  {
    player = new Player(username);
  }

  difficultyLevel = (String)JOptionPane.showInputDialog(null, "Choose what level you want to play: ", 
    "WHAT LEVEL?", JOptionPane.QUESTION_MESSAGE, null, level, level[2]);

  if (difficultyLevel == null)
  {
    jewlGrid = new Grid();
    timeAllowed = 40;
  } else if (difficultyLevel.equals("EASY"))
  {
    sqrDim = 100;
    timeAllowed = 60;
    jewlGrid = new Grid(sqrDim);
  } else if (difficultyLevel.equals("MEDIUM"))
  {
    sqrDim = 70;
    timeAllowed = 50;
    jewlGrid = new Grid(sqrDim);
  } else if (difficultyLevel.equals("HARD"))
  {
    sqrDim = 50;
    timeAllowed = 40;
    jewlGrid = new Grid(sqrDim);
  }

  sqrDim = jewlGrid.getSquareDimension();
  timer = new Timer(timeAllowed);
}


void draw() {
  //this is a timer that counts down once the timer goes below 0 the game is over
  timer.countDownTimer();
 //this if statement is run once when the timer runs out to get the score one time
  if (timer.getTimer()<0 && !gameOver) 
  {
    gameOver = true;
    score = jewlGrid.getScore();
  }  
//this is run when the game is over
  if(gameOver)
  {
    background(0);
    textSize(50);
    textAlign(CENTER);
    text("GAME OVER "+score, width/2, height/2);
  }
}


void mousePressed() {

  if (!gameOver)
  {
    // calculate the index by working out the row that the mouse click was on 
    // multiply it by the number of squares on each row.
    // then add this to the number of squares on the last row up to the point of click
    clickedIndex=(((mouseY/sqrDim)*(width/sqrDim))+(mouseX/sqrDim));
    selectedJewl = jewlGrid.gridOfJewls[clickedIndex];
  }
}

void mouseDragged() {
  if (!gameOver)
  {
    background(0);
    jewlGrid.gridDisplay();
    fill(0);
    rect(selectedJewl.getXCoord(), selectedJewl.getYCoord(), sqrDim, sqrDim);
    if (selectedJewl !=null)
    {
      selectedJewlType = selectedJewl.getJewlType();
      selectedJewlColor = selectedJewl.getJewlColor();
      fill(selectedJewlColor[0], selectedJewlColor[1], selectedJewlColor[2]);

      if (selectedJewlType.equals("circle"))
      {     
        ellipse(mouseX, mouseY, sqrDim-10, sqrDim-10);
      } else if (selectedJewlType.equals("oval"))
      {
        ellipse(mouseX, mouseY, sqrDim-35, sqrDim-10);
      } else if (selectedJewlType.equals("triangle"))
      {

        triangle(mouseX-(sqrDim/2)+10, mouseY+(sqrDim/4), mouseX+(sqrDim/2)-10, mouseY+sqrDim/4, mouseX, mouseY-(sqrDim/2)+10);
      } else if (selectedJewlType.equals("square"))
      {
        rect(mouseX-(sqrDim/2)+10, mouseY-(sqrDim/2)+10, sqrDim-20, sqrDim-20);
      }
    }
  }
}


void mouseReleased() {
  if (!gameOver)
  {
    selectedXCoord = selectedJewl.getXCoord();
    selectedYCoord = selectedJewl.getYCoord();
    // if the jewl is moved into the next box to the right
    if (mouseX > (selectedXCoord+sqrDim) && mouseX < (selectedXCoord+(sqrDim*2)) && mouseX > 0 && mouseX < width 
      && mouseY > (selectedYCoord) && mouseY < (selectedYCoord+sqrDim) && mouseY > 0 && mouseY < height)
    {
      jewlGrid.updateGrid(selectedJewl, "RIGHT");
    }

    //if the jewl is moved into the next box to the left
    else if (mouseX > (selectedXCoord-sqrDim) && mouseX < (selectedXCoord) && mouseX > 0 && mouseX < width
      && mouseY > (selectedYCoord) && mouseY < (selectedYCoord+sqrDim)&& mouseY > 0 && mouseY < height)
    {
      jewlGrid.updateGrid(selectedJewl, "LEFT");
    }

    //if the jewl is moved to the box directly above
    else if (mouseX > selectedXCoord && mouseX < selectedXCoord+sqrDim && mouseX > 0 && mouseX < width
      && mouseY > selectedYCoord - sqrDim && mouseY < selectedYCoord && mouseY > 0 && mouseY < height)
    {
      jewlGrid.updateGrid(selectedJewl, "ABOVE");
    }

    //if the jewl is moved to the box directly below
    else if (mouseX > selectedXCoord && mouseX < selectedXCoord+sqrDim && mouseX > 0 && mouseX < width
      && mouseY > selectedYCoord + sqrDim && mouseY < selectedYCoord+(sqrDim*2) && mouseY > 0 && mouseY < height)
    {
      jewlGrid.updateGrid(selectedJewl, "BELOW");
    }
    // otherwise it is not a legal move so move the jewl back to its position by calling the gridDisplay method
    else {
      background(0);
      jewlGrid.gridDisplay();
    }
    jewlGrid.matchDetection();
  }  
}
