
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
String difficultyLevel;
String[] level = {"EASY", "MEDIUM", "HARD"};
void setup() {
  size(700, 700);  
  background(0);
  username = JOptionPane.showInputDialog(null, 
    "Enter your username:");
  if(player == null)
  {
    player = new Player();
  }
  else
  {
    player = new Player(username);
  }
  
  difficultyLevel = (String)JOptionPane.showInputDialog(null, "Choose what level you want to play: ", 
  "WHAT LEVEL?", JOptionPane.QUESTION_MESSAGE, null, level, level[2]);
  
  if(difficultyLevel == null)
  {
      jewlGrid = new Grid();
  }
  
  else if(difficultyLevel.equals("EASY"))
  {
    sqrDim = 100;
    jewlGrid = new Grid(sqrDim);
  }
   else if(difficultyLevel.equals("MEDIUM"))
  {
    sqrDim = 70;
    jewlGrid = new Grid(sqrDim);
  }
   else if(difficultyLevel.equals("HARD"))
  {
    sqrDim = 50;
    jewlGrid = new Grid(sqrDim);
  }
 
  sqrDim = jewlGrid.getSquareDimension();
}

void draw() {
}


void mousePressed() {
  // calculate the index by working out the row that the mouse click was on 
  // multiply it by the number of squares on each row.
  // then add this to the number of squares on the last row up to the point of click
  clickedIndex=(((mouseY/sqrDim)*(width/sqrDim))+(mouseX/sqrDim));
  selectedJewl = jewlGrid.gridOfJewls[clickedIndex];
  
//  jewlGrid.setInGrid(clickedIndex);
}

void mouseDragged() {
  background(0);
  jewlGrid.gridDisplay();
  fill(0);
  rect(selectedJewl.getXCoord(),selectedJewl.getYCoord(), sqrDim,sqrDim);
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


void mouseReleased(){
   
   selectedXCoord = selectedJewl.getXCoord();
   selectedYCoord = selectedJewl.getYCoord();
   // if the jewl is moved into the next box to the right
   if(mouseX > (selectedXCoord+sqrDim) && mouseX < (selectedXCoord+(sqrDim*2)) && mouseX > 0 && mouseX < width 
   && mouseY > (selectedYCoord) && mouseY < (selectedYCoord+sqrDim) && mouseY > 0 && mouseY < height)
   {
     jewlGrid.updateGrid(selectedJewl, "RIGHT");
   }
   
   //if the jewl is moved into the next box to the left
   if(mouseX > (selectedXCoord-sqrDim) && mouseX < (selectedXCoord) && mouseX > 0 && mouseX < width
   && mouseY > (selectedYCoord) && mouseY < (selectedYCoord+sqrDim)&& mouseY > 0 && mouseY < height)
   {
      jewlGrid.updateGrid(selectedJewl, "LEFT");
   }
   
   //if the jewl is moved to the box directly above
   if(mouseX > selectedXCoord && mouseX < selectedXCoord+sqrDim && mouseX > 0 && mouseX < width
   && mouseY > selectedYCoord - sqrDim && mouseY < selectedYCoord && mouseY > 0 && mouseY < height)
   {
      jewlGrid.updateGrid(selectedJewl, "ABOVE");
   }
   
   //if the jewl is moved to the box directly below
   if(mouseX > selectedXCoord && mouseX < selectedXCoord+sqrDim && mouseX > 0 && mouseX < width
   && mouseY > selectedYCoord + sqrDim && mouseY < selectedYCoord+(sqrDim*2) && mouseY > 0 && mouseY < height)
   {
     jewlGrid.updateGrid(selectedJewl, "BELOW");
   }
   
  
}
