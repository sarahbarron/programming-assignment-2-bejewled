// Grid class stores an array of Jewls and displays them on a grid
public class Grid {
  // array to store jewls
  private Jewl[] gridOfJewls;
  //internal field that repesents the index in the arrayOfJewls array
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

  //if the user presses the cancel button on the difficulty level jOption pane use default settings
  public Grid() {
    // set the dimension of the squares using the default setter
    setSquareDimension();
    // set the size of the array using the default size
    setArraySize();
    // set the array of jewls
    setGridOfJewls();
    // display the grid
    gridDisplay();
  }
  // if the user selects a difficulty level create a grid using the level  
  public Grid(int level)
  {
    // set the dimension of the squares depending on the difficulty level
    setSquareDimension(level);
    // set the size of the array depending on the difficulty level
    setArraySize(level);
    // set the array of jewls
    setGridOfJewls();
    // display the grid
    gridDisplay();
  }

  // getter method to set the width/height of the squares on the grid 
  public int getSquareDimension() {
    return squareDimension;
  }

  // default setter method sets the width/height dimension of the squares on the grid
  public void setSquareDimension()
  {
    this.squareDimension = 50;
  }

  // setter method where the square dimensions were decided by the difficulty level
  public void setSquareDimension(int sqrDim) {
    this.squareDimension = sqrDim;
  }

  // getter method to get the size of the array
  public int getArraySize() {
    return arraySize;
  }

  // default setter method to set the array size
  public void setArraySize() {
    this.arraySize = (width/getSquareDimension())*(height/getSquareDimension());
  }

  // setter method to set the array size depending on the difficulty level inputted by user 
  public void setArraySize(int squareDimension) {
    this.arraySize = (width/squareDimension) * (height/squareDimension);
  }

  // getter method to return the array which holds the jewl objects
  public Jewl[] getGridOfJewls() {
    return gridOfJewls;
  }

  ///* setter method to set the jewls in the array. a jewl is created for every array 
  //index and added to the array */
  //public void setGridOfJewls() {
  //  // create an array to store the jewls
  //  this.gridOfJewls = new Jewl[arraySize];
  //  // for every index in the array create a jewl for it
  //  for (arrayIndex = 0; arrayIndex < arraySize; arrayIndex++)
  //  {
  //    // create a jewl
  //    Jewl singleJewl = new Jewl();

  //    /* the 1st 2 jewls in the array can be the same after that no 3 jewls of the same 
  //    type can be beside each other in a row or a column */
  //    if (arrayIndex>=2)
  //    {
  //      //this jewl should not be the same as the two jewls to the left of this jewl 
  //      // if they are the same create a new jewl
  //      println("INDEX" + arrayIndex +" : " +gridOfJewls[arrayIndex-1].getJewlType()+" "+gridOfJewls[arrayIndex-2].getJewlType()+" "+singleJewl.getJewlType());
  //      while (gridOfJewls[arrayIndex-1].getJewlType().equals(singleJewl.getJewlType()) 
  //        && gridOfJewls[arrayIndex-2].getJewlType().equals(singleJewl.getJewlType()))
  //      {
  //        singleJewl=new Jewl();
  //        println("INDEX" + arrayIndex +" : " +gridOfJewls[arrayIndex-1].getJewlType()+" "+gridOfJewls[arrayIndex-2].getJewlType()+" "+singleJewl.getJewlType());
  //      }
  //      println("OUT OF WHILE");
  //      /* if the array index is greater than the 1st jewl on the second row 
  //      (this will prevent an out of bounds error when doing checks in the while loop) */
  //      if (arrayIndex >= (width/squareDimension)*2)
  //      {
  //        //this jewl should not be the same as the previous 2 jewls to the two 2 jewls above
  //        // if they are the same create a new jewl
  //        while (gridOfJewls[arrayIndex-((width/squareDimension)*2)].getJewlType().equals(singleJewl.getJewlType()) 
  //          && gridOfJewls[arrayIndex-(width/squareDimension)].getJewlType().equals(singleJewl.getJewlType()))
  //        {
  //          singleJewl = new Jewl();
  //        }
  //      }
  //    }
  //    // add the jewl to the array 
  //    this.gridOfJewls[arrayIndex] = singleJewl;
  //    // set the array index of jewl in the jewl object
  //    singleJewl.setJewlIndex(arrayIndex);
  //    // get the type of the jewl
  //    String type = singleJewl.getJewlType();
  //    // if the type is triangle add 1 to the total count of triangles
  //    if (type.equals("triangle"))
  //    {
  //      this.numOfTri++;
  //    }
  //    // if the type is circle add 1 to the total count of circles
  //    if (type.equals("circle"))
  //    {
  //      this.numOfCirc++;
  //    }
  //    // if the type is oval add 1 to the total count of ovals
  //    if (type.equals("oval"))
  //    {
  //      this.numOfOval++;
  //    }
  //    // if the type is square add 1 to the total count of squares
  //    if (type.equals("square"))
  //    {
  //      this.numOfSqr++;
  //    }
  //  }
  //}


  /* setter method to set the jewls in the array. a jewl is created for every array 
   index and added to the array */
  public void setGridOfJewls() {
    // create an array to store the jewls
    this.gridOfJewls = new Jewl[arraySize];
    // for every index in the array create a jewl for it
    for (arrayIndex = 0; arrayIndex < arraySize; arrayIndex++)
    {
      // create a jewl
      Jewl singleJewl = new Jewl();

      /* No 3 jewls of the same type can be beside each other in a row or a column initially
       this fist if statement checks the 1st 2 rows - it checks the previous 2 indexes in the
       array and compares the jewl types*/
      if (arrayIndex>=2 && arrayIndex<(width/squareDimension)*2)
      {
        //this jewl should not be the same as the two jewls to the left of this jewl 
        // if they are the same create a new jewl and recheck
        while (gridOfJewls[arrayIndex-1].getJewlType().equals(singleJewl.getJewlType()) 
          && gridOfJewls[arrayIndex-2].getJewlType().equals(singleJewl.getJewlType()))
        {
          singleJewl=new Jewl();
        }
      }

      /* this if statement checks from row 3 onwards  
       (this will prevent an out of bounds error when doing checks in the while loop when trying to check above) */
      if (arrayIndex >= (width/squareDimension)*2)
      {
        //this jewl should not be the same type as the 2 jewls beside it or the 2 jewls above it. if it is create a new jewl and recheck 
        while (gridOfJewls[arrayIndex-((width/squareDimension)*2)].getJewlType().equals(singleJewl.getJewlType()) 
          && gridOfJewls[arrayIndex-(width/squareDimension)].getJewlType().equals(singleJewl.getJewlType()) || gridOfJewls[arrayIndex-1].getJewlType().equals(singleJewl.getJewlType()) 
          && gridOfJewls[arrayIndex-2].getJewlType().equals(singleJewl.getJewlType()))
        {
          singleJewl = new Jewl();
        }
      }
    
    // add the jewl to the array 
    this.gridOfJewls[arrayIndex] = singleJewl;
    // set the array index of jewl in the jewl object
    singleJewl.setJewlIndex(arrayIndex);
    // get the type of the jewl
    String type = singleJewl.getJewlType();
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

// if a jewl is swapped with another jewl the grid must be updated
public void updateGrid(Jewl jewl, String direction)
{ 
  //get the index of the selected jewl 
  int index = jewl.getJewlIndex();
  //set the background to black
  background(0);
  //if the jewl was moved to the square on the right
  if (direction.equals("RIGHT"))
  {      
    /*the jewl in the square to the right - set its index
    to the index of the selected jewl*/
    gridOfJewls[index+1].setJewlIndex(index);
    // swap the jewl on the right into the selected jewls position in the array
    gridOfJewls[index] = gridOfJewls[index+1];
    //add one the the selected jewls index
    jewl.setJewlIndex(index+1);
    // swap the selected jewl into the right jewls position in the array
    gridOfJewls[index+1] = jewl;
  } 
  // otherwise if direction is left
  else if (direction.equals("LEFT"))
  {
    /* The jewl in the square to the left - 
    set its index to the index of the selected jewl */
    gridOfJewls[index-1].setJewlIndex(index);
    // swap the jewl on the left into the selected jewls position in the array
    gridOfJewls[index] = gridOfJewls[index-1];
    // Reduce the jewls index by 1
    jewl.setJewlIndex(index-1);
    // swap the selected jewl into the left jewls position in the array
    gridOfJewls[index-1] = jewl;
  } 
  // otherwise if the direction is above
  else if (direction.equals("ABOVE"))
  {
    //set the index of the jewl above to the index of the selected jewl
    gridOfJewls[index-(height/sqrDim)].setJewlIndex(index);
    // swap the jewl above into the selected jewls position in the array
    gridOfJewls[index] = gridOfJewls[index-(height/sqrDim)];
    // set the selected jewls index to that of the index above
    jewl.setJewlIndex(index-(height/sqrDim));
    // swap the selected jewl into the above position in the array
    gridOfJewls[index-(height/sqrDim)] = jewl;
  } 
  // Otherwise if the direction is below
  else if (direction.equals("BELOW"))
  {
    // Set the index of the jewl below to the index of the selected jewl
    gridOfJewls[index+(height/sqrDim)].setJewlIndex(index);
    // swap the jewl below into the selected jewls position in the array
    gridOfJewls[index] = gridOfJewls[index+(height/sqrDim)];
    // set the selected jewls index to the below jewls index
    jewl.setJewlIndex(index+(height/sqrDim));
    // swap the selected jewl into the below position in the array
    gridOfJewls[index+(height/sqrDim)] = jewl;
  }
 // display the grid
  gridDisplay();
}

// Displays the grid, drawing the lines and a shape for each jewl in the array
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

      // assign the the jewl from the array to printJewl
      Jewl printJewl = gridOfJewls[arrayInd];
      // if printJewl is not null
      if (printJewl !=null)
      {
        // get the jewl type
        String thisJewl = printJewl.getJewlType();
        // set the xCoordinate of the Jewl to the current x Coordinate
        printJewl.setXCoord(xCoord);
        // set the y Coordinate of the jewl to the current y coordinate
        printJewl.setYCoord(yCoord);
        // get the color array of the jewl
        int[] jewlColor = printJewl.getJewlColor();
        // set the color of the shape
        fill(jewlColor[0], jewlColor[1], jewlColor[2]);
        // if the jewl type is circle and not blank
        if (thisJewl.equals("circle") && !(printJewl.getBlank()))
        {
          // draw a circle 
          ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-10, squareDimension-10);
        } 
        // Otherwise if the jewl type is oval and not blank
        else if (thisJewl.equals("oval") && !(printJewl.getBlank()))
        {
          // draw and oval
          ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-35, squareDimension-10);
        } 
        // Otherwise if the jewl type is triangle and not blank
        else if (thisJewl.equals("triangle") && !(printJewl.getBlank()))
        {
          // draw a triangle
          triangle(xCoord+10, yCoord+squareDimension-10, xCoord+squareDimension-10, yCoord+squareDimension-10, xCoord+(squareDimension/2), yCoord+10);
        } 
        // Otherwise if the jewl type is square
        else if (thisJewl.equals("square") && !(printJewl.getBlank()))
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

      if (checkJewl.getBlank())
      {
        checkLeft = false;
        checkRight = false;
        checkUp=false;
        checkDown=false;
      } else if (xCoord == 0)
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
      String type = gridOfJewls[matchIndex].getJewlType();
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
  for (int index = 0; index<gridOfJewls.length; index++)
  {
    if (gridOfJewls[index].getBlank())
    {
      score ++;
    }
  }
  return score;
}

public boolean areMoreMoves()
{
  if (numOfTri < 3 && numOfCirc < 3 && numOfSqr < 3 && numOfOval < 3)
  {
    return false;
  }
  return true;
}

public String toString() {
  return "Square Width: "+squareDimension +"Array Size: "+arraySize+" XCoord:  "+mouseX;
}
}
