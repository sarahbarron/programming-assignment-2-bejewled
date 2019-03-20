/*
 Name : Sarah Barron
 Student Number: 20013679
 
 HDIP Computer Science - WIT - March 2019
 Programming assignment 2.
 
 The Grid class stores an array of Jewels and displays them on a grid.
 It also updates the grid when jewels are swapped. 
 Checks for matching jewel types and removes any matches from the grids display
 Checks if there are more moves on the grid.
 And calculates the score based on the number of blanks on the grid
 */

public class Grid {
  // array to store jewels
  private Jewel[] gridOfJewels;
  //The index in the arrayOfJewels array
  private int arrayIndex;
  // size of the array
  private int arraySize;
  // number of triangles displayed on the grid
  private int numOfTri;
  // number of circles displayed on the grid
  private int numOfCirc;
  // number of squares displayed on the grid
  private int numOfSqr;
  //number if ovals displayed on the grid
  private int numOfOval;
  // width/height of the squares on the grid
  private int squareDimension;


  /* Default constructor method of the Grid 
   if the user presses the cancel button on the difficulty 
   level jOption pane use default settings */
  public Grid() {
    // set the dimension of the squares using the default setter
    setSquareDimension();
    // set the size of the array using the default size
    setArraySize();
    // set the array of jewels
    setGridOfJewels();
    // display the grid
    gridDisplay();
  }


  /* Constructor method of the grid with difficulty level parameter passed to it
   if the user selects a difficulty level create a grid using the level */
  public Grid(int level)
  {
    // set the dimension of the squares depending on the difficulty level
    setSquareDimension(level);
    // set the size of the array depending on the difficulty level
    setArraySize(level);
    // set the array of jewels
    setGridOfJewels();
    // display the grid
    gridDisplay();
  }


  // Getter method to set the width/height of the squares on the grid 
  public int getSquareDimension() {
    return squareDimension;
  }


  // Default Setter method sets the width/height dimension of the squares on the grid
  public void setSquareDimension()
  {
    this.squareDimension = 50;
  }


  /* Setter method where the square dimensions were decided by the difficulty level 
   and passed to the setter method */
  public void setSquareDimension(int sqrDim) {
    this.squareDimension = sqrDim;
  }


  // Getter method to get the size of the array
  public int getArraySize() {
    return arraySize;
  }


  // Default Setter method to set the array size
  public void setArraySize() {
    this.arraySize = (width/getSquareDimension())*(height/getSquareDimension());
  }


  /* Setter method to set the array size depending on the difficulty level 
   inputted by user and passed to the setter */
  public void setArraySize(int squareDimension) {
    this.arraySize = (width/squareDimension) * (height/squareDimension);
  }


  // Getter method to return the array which holds the jewel objects
  public Jewel[] getGridOfJewels() {
    return gridOfJewels;
  }


  /* Setter method to set the jewels in the array. a jewel is created for every array 
   index and added to the array */
  public void setGridOfJewels() {
    // create an array to store the jewels
    this.gridOfJewels = new Jewel[arraySize];
    // for every index in the array create a jewel for it
    for (arrayIndex = 0; arrayIndex < arraySize; arrayIndex++)
    {
      // create a jewel
      Jewel singleJewel = new Jewel();

      /* No 3 jewels of the same type can be beside each other in a row or a column initially
       this fist if statement checks the 1st 2 rows - it checks the previous 2 indexes in the
       array and compares the jewel types*/
      if (arrayIndex>=2 && arrayIndex<(width/squareDimension)*2)
      {
        //this jewel should not be the same as the two jewels to the left of this jewel 
        // if they are the same create a new jewel and recheck
        while (gridOfJewels[arrayIndex-1].getJewelType().equals(singleJewel.getJewelType()) 
          && gridOfJewels[arrayIndex-2].getJewelType().equals(singleJewel.getJewelType()))
        {
          singleJewel=new Jewel();
        }
      }

      /* this if statement checks from row 3 onwards  
       (this will prevent an out of bounds error when doing checks in the while loop when trying to check above) */
      if (arrayIndex >= (width/squareDimension)*2)
      {
        //this jewel should not be the same type as the 2 jewels beside it or the 2 jewels above it. if it is create a new jewel and recheck 
        while (gridOfJewels[arrayIndex-((width/squareDimension)*2)].getJewelType().equals(singleJewel.getJewelType()) 
          && gridOfJewels[arrayIndex-(width/squareDimension)].getJewelType().equals(singleJewel.getJewelType()) || gridOfJewels[arrayIndex-1].getJewelType().equals(singleJewel.getJewelType()) 
          && gridOfJewels[arrayIndex-2].getJewelType().equals(singleJewel.getJewelType()))
        {
          singleJewel = new Jewel();
        }
      }

      // add the jewel to the array 
      this.gridOfJewels[arrayIndex] = singleJewel;
      // set the array index of jewel in the jewel object
      singleJewel.setJewelIndex(arrayIndex);
      // get the type of the jewel
      String type = singleJewel.getJewelType();
      // if the type is triangle add 1 to the total count of triangles
      if (type.equals("triangle"))
      {
        this.numOfTri++;
      }
      // if the type is circle add 1 to the total count of circles
      if (type.equals("circle"))
      {
        this.numOfCirc++;
      }
      // if the type is oval add 1 to the total count of ovals
      if (type.equals("oval"))
      {
        this.numOfOval++;
      }
      // if the type is square add 1 to the total count of squares
      if (type.equals("square"))
      {
        this.numOfSqr++;
      }
    }
  }


  // Method - if a jewel is swapped with another jewel the grid must be updated
  public void updateGrid(Jewel jewel, String direction)
  { 
    //get the index of the selected jewel 
    int index = jewel.getJewelIndex();
    //set the background to black
    background(0);
    //if the jewel was moved to the square on the right
    if (direction.equals("RIGHT"))
    {      
      /*the jewel in the square to the right - set its index
       to the index of the selected jewel*/
      gridOfJewels[index+1].setJewelIndex(index);
      // swap the jewel on the right into the selected jewels position in the array
      gridOfJewels[index] = gridOfJewels[index+1];
      //add one the selected jewels index
      jewel.setJewelIndex(index+1);
      // swap the selected jewel into the right jewels position in the array
      gridOfJewels[index+1] = jewel;
    } 
    // otherwise if direction is left
    else if (direction.equals("LEFT"))
    {
      /* The jewel in the square to the left - 
       set its index to the index of the selected jewel */
      gridOfJewels[index-1].setJewelIndex(index);
      // swap the jewel on the left into the selected jewels position in the array
      gridOfJewels[index] = gridOfJewels[index-1];
      // Reduce the jewels index by 1
      jewel.setJewelIndex(index-1);
      // swap the selected jewel into the left jewels position in the array
      gridOfJewels[index-1] = jewel;
    } 
    // otherwise if the direction is above
    else if (direction.equals("ABOVE"))
    {
      //set the index of the jewel above to the index of the selected jewel
      gridOfJewels[index-(height/sqrDim)].setJewelIndex(index);
      // swap the jewel above into the selected jewels position in the array
      gridOfJewels[index] = gridOfJewels[index-(height/sqrDim)];
      // set the selected jewels index to that of the index above
      jewel.setJewelIndex(index-(height/sqrDim));
      // swap the selected jewel into the above position in the array
      gridOfJewels[index-(height/sqrDim)] = jewel;
    } 
    // Otherwise if the direction is below
    else if (direction.equals("BELOW"))
    {
      // Set the index of the jewel below to the index of the selected jewel
      gridOfJewels[index+(height/sqrDim)].setJewelIndex(index);
      // swap the jewel below into the selected jewels position in the array
      gridOfJewels[index] = gridOfJewels[index+(height/sqrDim)];
      // set the selected jewels index to the below jewels index
      jewel.setJewelIndex(index+(height/sqrDim));
      // swap the selected jewel into the below position in the array
      gridOfJewels[index+(height/sqrDim)] = jewel;
    }
    // display the grid
    gridDisplay();
  }


  // Method to display grid, drawing the lines and a shape for each jewel in the array
  public void gridDisplay() {
    // Set the background to black
    background(0);
    // For loop to display the lines on the grid creating a square effect using x and y coordinates    
    for (int xCoord = squareDimension; xCoord < width; xCoord += squareDimension) {
      stroke(100);
      for (int yCoord = squareDimension; yCoord < height; yCoord += squareDimension) {

        line(0, yCoord, width, yCoord);
      }
      line(xCoord, 0, xCoord, height);
    }

    // set the index array to 0
    int arrayInd = 0;

    //for loop to display the objects on the grid using the x and y coordinates
    for (int yCoord = 0; yCoord < width; yCoord+=squareDimension) {

      for (int xCoord = 0; xCoord < height; xCoord+=squareDimension) {

        // assign the jewel from the array to printJewel
        Jewel printJewel = gridOfJewels[arrayInd];
        // if printJewel is not null
        if (printJewel !=null)
        {
          // get the jewel type
          String thisJewel = printJewel.getJewelType();
          // set the xCoordinate of the Jewel to the current x Coordinate
          printJewel.setXCoord(xCoord);
          // set the y Coordinate of the jewel to the current y coordinate
          printJewel.setYCoord(yCoord);
          // get the color array of the jewel
          int[] jewelColor = printJewel.getJewelColor();
          // set the color of the shape
          fill(jewelColor[0], jewelColor[1], jewelColor[2]);
          // if the jewel type is circle and not blank
          if (thisJewel.equals("circle") && !(printJewel.getBlank()))
          {
            // draw a circle 
            ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-10, squareDimension-10);
          } 
          // Otherwise if the jewel type is oval and not blank
          else if (thisJewel.equals("oval") && !(printJewel.getBlank()))
          {
            // draw and oval
            ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-35, squareDimension-10);
          } 
          // Otherwise if the jewel type is triangle and not blank
          else if (thisJewel.equals("triangle") && !(printJewel.getBlank()))
          {
            // draw a triangle
            triangle(xCoord+10, yCoord+squareDimension-10, xCoord+squareDimension-10, yCoord+squareDimension-10, xCoord+(squareDimension/2), yCoord+10);
          } 
          // Otherwise if the jewel type is square
          else if (thisJewel.equals("square") && !(printJewel.getBlank()))
          {
            // Draw a square
            rect(xCoord+10, yCoord+10, squareDimension-20, squareDimension-20);
          }
        }
        // otherwise it is blank
        else
        {
          // draw a square the same size as the grid square and color it black 
          fill(0);
          rect(xCoord, yCoord, squareDimension, squareDimension);
        }
        // increase the array index by 1
        arrayInd++;
      }
    }
  }


  /* Method to detect matched jewls - for each jewel this method checks
   if the jewel is in the centre of a 3 in a row match or 3 in a column match */
  public void matchDetection() {
    // array index initialised to 0
    int arrayInd = 0;
    // check left, right, up or down will be either true or false
    boolean checkLeft;
    boolean checkRight;
    boolean checkUp;
    boolean checkDown;
    // type of jewel
    String jewelType;
    //I needed to initialise each jewel to a new jewel initially as errors were occurring further on 
    // when they were not assigned to a value initially. 
    Jewel jewelUp = new Jewel();
    Jewel jewelDown = new Jewel();
    Jewel jewelLeft = new Jewel();
    Jewel jewelRight = new Jewel();
    // the jewel to be checked against
    Jewel checkJewel;

    // new array the same length as the grid array storing a boolean true for matched 
    boolean[] match = new boolean[gridOfJewels.length];

    //for loop to check each jewel on the grid
    for (int yCoord = 0; yCoord < width; yCoord+=squareDimension) {

      for (int xCoord = 0; xCoord < height; xCoord+=squareDimension) {

        // assign the check jewel to the jewel at the array index counter
        checkJewel = gridOfJewels[arrayInd];
        // get the type of jewel it is
        jewelType = checkJewel.getJewelType();

        /* if the jewel returns true for getBlank it means the jewel has already been matched
         and is no longer displayed on the grid so no need to check this jewel */
        if (checkJewel.getBlank())
        {
          checkLeft = false;
          checkRight = false;
          checkUp=false;
          checkDown=false;
        } 
        // if the xCoordinate is 0 (i.e.  the 1st column) don't check left
        else if (xCoord == 0)
        {
          checkLeft = false;
        } 
        // otherwise do check left
        else
        {
          checkLeft = true;
        }
        // if the y coordinate is 0 (i.e.  the 1st row) don't check up
        if (yCoord == 0)
        {
          checkUp = false;
        } 
        // otherwise do check up
        else
        {
          checkUp = true;
        }
        // if the x Coord is the width minus the square width (i.e.  the last column) don't check right
        if (xCoord == width-squareDimension)
        {
          checkRight = false;
        } 
        // otherwise do check right
        else
        {
          checkRight = true;
        }
        // if the y cooridinate is the height minus the square height (i.e.  the last row) don't check down
        if (yCoord == height-squareDimension)
        {
          checkDown = false;
        } 
        // otherwise do check down
        else
        {
          checkDown = true;
        }

        // if checkUp is true
        if (checkUp)
        {
          // get the jewel above the selected jewel
          jewelUp = gridOfJewels[arrayInd - (height/squareDimension)];
        }
        // if checkDown is true
        if (checkDown)
        {
          // get the jewel below the selected jewel
          jewelDown =gridOfJewels[arrayInd + (height/squareDimension)];
        }
        // if checkRight is true
        if (checkRight)
        {
          // get the jewel to the right of the selected jewel
          jewelRight = gridOfJewels[arrayInd+1];
        }
        // if the checkLeft is true
        if (checkLeft)
        {
          // Get the jewel to the left of the selected jewel
          jewelLeft = gridOfJewels[arrayInd-1];
        }
        // if check left is true and check right is true 
        if (checkLeft && checkRight) 
        {
          // the selected jewel type is equal to the left jewel type and is equal to the right jewel type
          if (jewelType.equals(jewelLeft.getJewelType()) && jewelType.equals(jewelRight.getJewelType()))
          {
            // set the match array at the same array position to true
            match[arrayInd] = true;
            // set the match array at the previous position to true
            match[arrayInd-1] = true;
            // set the match array at the newt position to true
            match[arrayInd+1] = true;
          }
        }
        // if checkDown and CheckUp is true
        if (checkDown && checkUp)
        { 
          // if the selected jewel type is equal to the jewel type of the jewel above and the same as the jewel type below
          if (jewelType.equals(jewelUp.getJewelType())&& jewelType.equals(jewelDown.getJewelType()) )
          {
            // set the match array at the same array position to true
            match[arrayInd] = true;
            // set the match array at the above array position to true
            match[arrayInd - (height/squareDimension)] =  true;
            // set the match array at the below postion to true
            match[arrayInd + (height/squareDimension)] =  true;
          }
        }
        // increment the array index by 1
        arrayInd++;
      }
    }
    // Once all jewels have been checked call the removeMatchedFromDisply and pass the match array
    removeMatchedFromDisplay(match);
  }


  // this is a method to remove all matched jewels from being displayed on the grid
  public void removeMatchedFromDisplay(boolean[] match)
  {
    // for loop to check every index in the match array 
    for (int matchIndex = 0; matchIndex<match.length; matchIndex++)
    {
      // assigns the boolean from the match array at a certain index to clear
      boolean clear = match[matchIndex];

      // if clear is true
      if (clear)
      {
        // get the jewel type of the jewel at the same index in the grid of jewels array
        String type = gridOfJewels[matchIndex].getJewelType();
        /* depending on the type of jewel it is decrement the number of this 
         type of jewel being displayed on the grid */
        if (type.equals("triangle"))
        {
          this.numOfTri--;
        }
        if (type.equals("circle"))
        {
          this.numOfCirc--;
        }
        if (type.equals("oval"))
        {
          this.numOfOval--;
        }
        if (type.equals("square"))
        {
          this.numOfSqr--;
        }
        // set the jewels blank variable to true
        gridOfJewels[matchIndex].setBlank(true);
        //reset the match at index to false
        match[matchIndex] = false;
        //set the background to black
        background(0);
        //display the grid with the matched rows and columns removed from display
        gridDisplay();
      }
    }
  }


  // Method to get the score based on the number of blank jewels in the array
  public int getScore()
  {
    // score starts at 0
    int score = 0;
    // for loop to check each jewel in the grid of jewels array
    for (int index = 0; index<gridOfJewels.length; index++)
    {
      // if the jewels blank variable is set to true add 1 to the score
      if (gridOfJewels[index].getBlank())
      {
        score ++;
      }
    }
    // return the score
    return score;
  }


  // Method to check if there are any more valid moves in the game
  public boolean areMoreMoves()
  {
    /* if the number of each type of jewel goes below 3 there are no more 
     valid moves so return false */
    if (numOfTri < 3 && numOfCirc < 3 && numOfSqr < 3 && numOfOval < 3)
    {
      return false;
    }
    //otherwise return true
    return true;
  }


  // toString method for the Grid class
  public String toString() {
    return "Square Width: "+squareDimension +"Array Size: "+arraySize;
  }
}
