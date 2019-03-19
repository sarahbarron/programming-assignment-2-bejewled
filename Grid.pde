public class Grid {

  private Jewl[] gridOfJewls;
  //no getter or setter is created for the arrayIndex as it is an internal field that repesents the index in the arrayOfJewls array
  private int arrayIndex;
  private int arraySize;

  private int xCoord;
  private int yCoord;
  private int squareDimension;
  private int findXCoord;
  private int findYCoord;


  //if the user presses the cancel button on the difficulty level jOption pane use default settings
  public Grid() {  
    setSquareDimension();
    setArraySize();
    setGridOfJewls();
    gridDisplay();
  }
  // if the user selects a difficulty level 
  public Grid(int level)
  {
    setSquareDimension(level);
    setArraySize(level);
    setGridOfJewls();
    gridDisplay();
  }

  public int getSquareDimension() {
    return squareDimension;
  }
  //default dimensions
  public void setSquareDimension()
  {
    this.squareDimension = 50;
  }
  //user input dimensions set depending on difficulty level
  public void setSquareDimension(int sqrDim) {
    this.squareDimension = sqrDim;
  }

  public int getArraySize() {
    return arraySize;
  }
  // default array size
  public void setArraySize() {
    this.arraySize = (width/getSquareDimension())*(height/getSquareDimension());
  }
  // array size set depending on the difficulty level inputted by user 
  public void setArraySize(int squareDimension) {
    this.arraySize = (width/squareDimension) * (height/squareDimension);
  }

  // returns the object array which holds the jewl objects
  public Jewl[] getGridOfJewls() {
    return gridOfJewls;
  }

  /* inintial setup of the array of jewls. a jewl is created for every array index and added
   to the array */
  public void setGridOfJewls() {

    this.gridOfJewls = new Jewl[arraySize];   
    for (arrayIndex = 0; arrayIndex < arraySize; arrayIndex++)
    {
      Jewl singleJewl = new Jewl();

      // the 1st 2 jewls can be the same after that no 3 jewls of the same type can be beside each other in a row or a column
      if (arrayIndex>=2)
      {
        //this jewl should not be the same as the two jewls to the left of this jewl 
        // if they are the same create a new jewl
        while (gridOfJewls[arrayIndex-1].getJewlType().equals(singleJewl.getJewlType()) 
          && gridOfJewls[arrayIndex-2].getJewlType().equals(singleJewl.getJewlType()))
        {
          singleJewl=new Jewl();
        }
        // if the array index is greater than the 1st jewl on the second row (this will prevent an out of bounds error when doing checks in the while loop)
        if (arrayIndex >= (width/squareDimension)*2)
        {
          //this jewl should not be the same as the previous 2 jewls to the two 2 jewls above
          // if they are the same create a new jewl
          while (gridOfJewls[arrayIndex-((width/squareDimension)*2)].getJewlType().equals(singleJewl.getJewlType()) 
            && gridOfJewls[arrayIndex-(width/squareDimension)].getJewlType().equals(singleJewl.getJewlType()))
          {
            singleJewl = new Jewl();
          }
        }
      }
      this.gridOfJewls[arrayIndex] = singleJewl;
      singleJewl.setJewlIndex(arrayIndex);
    }
  }

  // if a jewl is swapped with another jewl the grid must be updated
  public void updateGrid(Jewl jewl, String direction)
  { 
    int index = jewl.getJewlIndex();

    background(0);
    if (direction.equals("RIGHT"))
    {      
      gridOfJewls[index+1].setJewlIndex(index);
      gridOfJewls[index] = gridOfJewls[index+1];
      jewl.setJewlIndex(index+1);
      gridOfJewls[index+1] = jewl;
    } else if (direction.equals("LEFT"))
    {
      gridOfJewls[index-1].setJewlIndex(index);
      gridOfJewls[index] = gridOfJewls[index-1];
      jewl.setJewlIndex(index-1);
      gridOfJewls[index-1] = jewl;
    } else if (direction.equals("ABOVE"))
    {
      gridOfJewls[index-(height/sqrDim)].setJewlIndex(index);
      gridOfJewls[index] = gridOfJewls[index-(height/sqrDim)];
      jewl.setJewlIndex(index-(height/sqrDim));
      gridOfJewls[index-(height/sqrDim)] = jewl;
    } else if (direction.equals("BELOW"))
    {
      gridOfJewls[index+(height/sqrDim)].setJewlIndex(index);
      gridOfJewls[index] = gridOfJewls[index+(height/sqrDim)];
      jewl.setJewlIndex(index+(height/sqrDim));
      gridOfJewls[index+(height/sqrDim)] = jewl;
    }

    gridDisplay();
  }

  // displays the grid, drawing the lines and a shape for each jewl in the array
  public void gridDisplay() {

    //for loop to display the lines on the grid creating a square effect    
    for (int xCoord = squareDimension; xCoord < width; xCoord += squareDimension) {
      stroke(100);
      for (int yCoord = squareDimension; yCoord < height; yCoord += squareDimension) {

        line(0, yCoord, width, yCoord);
      }
      line(xCoord, 0, xCoord, height);
    }

    int arrayInd = 0;

    //for loop to display the objects on the grid
    for (int yCoord = 0; yCoord < width; yCoord+=squareDimension) {

      for (int xCoord = 0; xCoord < height; xCoord+=squareDimension) {

        Jewl printJewl = gridOfJewls[arrayInd];

        if (printJewl !=null)
        {
          String thisJewl = printJewl.getJewlType();
          printJewl.setXCoord(xCoord);
          printJewl.setYCoord(yCoord);
          int[] jewlColor = printJewl.getJewlColor();
          fill(jewlColor[0], jewlColor[1], jewlColor[2]);
          if (thisJewl.equals("circle") && !(printJewl.getBlank()))
          {
            ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-10, squareDimension-10);
          } else if (thisJewl.equals("oval") && !(printJewl.getBlank()))
          {
            ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-35, squareDimension-10);
          } else if (thisJewl.equals("triangle") && !(printJewl.getBlank()))
          {
            triangle(xCoord+10, yCoord+squareDimension-10, xCoord+squareDimension-10, yCoord+squareDimension-10, xCoord+(squareDimension/2), yCoord+10);
          } else if (thisJewl.equals("square") && !(printJewl.getBlank()))
          {
            rect(xCoord+10, yCoord+10, squareDimension-20, squareDimension-20);
          }
        } else
        {
          fill(0);
          rect(xCoord, yCoord, squareDimension, squareDimension);
        }

        arrayInd++;
      }
    }
  }


  // detection of matched objects
  public void matchDetection() {
    int arrayInd = 0;
    boolean checkLeft;
    boolean checkRight;
    boolean checkUp;
    boolean checkDown;
    String jewlType;
    //I needed to initialise each jewl to a new jewl initially as errors were occuring further on 
    // when they were not assigned to a value initailly. 
    Jewl jewlUp = new Jewl();
    Jewl jewlDown = new Jewl();
    Jewl jewlLeft = new Jewl();
    Jewl jewlRight = new Jewl();
    Jewl checkJewl;
    // new array storing a string for matched 
    boolean[] match = new boolean[gridOfJewls.length];

    //for loop to display the objects on the grid
    for (int yCoord = 0; yCoord < width; yCoord+=squareDimension) {

      for (int xCoord = 0; xCoord < height; xCoord+=squareDimension) {

        checkJewl = gridOfJewls[arrayInd];
        jewlType = checkJewl.getJewlType();
        
        if(checkJewl.getBlank())
        {
          checkLeft = false;
          checkRight = false;
          checkUp=false;
          checkDown=false;
        }
        else if (xCoord == 0)
        {
          checkLeft = false;
        } else
        {
          checkLeft = true;
        }

        if (yCoord == 0)
        {
          checkUp = false;
        } else
        {
          checkUp = true;
        }
        if (xCoord == width-squareDimension)
        {
          checkRight = false;
        } else
        {
          checkRight = true;
        }
        if (yCoord == height-squareDimension)
        {
          checkDown = false;
        } else
        {
          checkDown = true;
        }

        if (checkUp)
        {
          jewlUp = gridOfJewls[arrayInd - (height/squareDimension)];
        }
        if (checkDown)
        {
          jewlDown =gridOfJewls[arrayInd + (height/squareDimension)];
        }
        if (checkRight)
        {
          jewlRight = gridOfJewls[arrayInd+1];
        }
        if (checkLeft)
        {
          jewlLeft = gridOfJewls[arrayInd-1];
        }

        if (checkLeft && checkRight) 
        {

          if (jewlType.equals(jewlLeft.getJewlType()) && jewlType.equals(jewlRight.getJewlType()))
          {
            match[arrayInd] = true;
            match[arrayInd-1] = true;
            match[arrayInd+1] = true;
          }
        }
        if (checkDown && checkUp)
        { 
          if (jewlType.equals(jewlUp.getJewlType())&& jewlType.equals(jewlDown.getJewlType()) )
          {
            match[arrayInd] = true;
            match[arrayInd - (height/squareDimension)] =  true;
            match[arrayInd + (height/squareDimension)] =  true; 
          }
        }
        arrayInd++;
      }
    }
     removeMatchedFromGrid(match);
  }

  public void removeMatchedFromGrid(boolean[] match)
  {
    for (int matchIndex = 0; matchIndex<match.length; matchIndex++)
    {
      boolean clear = match[matchIndex];

      if (clear)
      {
        gridOfJewls[matchIndex].setBlank(true);
        match[matchIndex] = false;
        background(0);
        gridDisplay();
      }
    }
  }
  
  public int getScore()
  {
    int score = 0;
    for(int index = 0; index<gridOfJewls.length; index++)
    {
      if(gridOfJewls[index].getBlank())
      {
        score ++; 
      }
    }
    return score;
  }
  
public String toString() {
  return "Square Width: "+squareDimension +"Array Size: "+arraySize+" XCoord:  "+mouseX;
}
}
