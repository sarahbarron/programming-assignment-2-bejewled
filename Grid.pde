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



  public Grid() {
    setSquareDimension(50);
    setArraySize();
    setGridOfJewls();
    gridDisplay();
  }

  public Grid(int level)
  {
    setSquareDimension(level);
    setArraySize();
    setGridOfJewls();
    gridDisplay();
  }

  public int getSquareDimension() {
    return squareDimension;
  }

  public void setSquareDimension(int sqrDim) {
    this.squareDimension = sqrDim;
  }

  public int getArraySize() {
    return arraySize;
  }

  public void setArraySize() {
    this.arraySize = (width/squareDimension) * (height/squareDimension);
  }
  public Jewl[] getGridOfJewls() {
    return gridOfJewls;
  }

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

  public void updateGrid(Jewl jewl, String direction)
  { 
    int index = jewl.getJewlIndex();
    background(0);
    if(direction.equals("RIGHT"))
    {
      gridOfJewls[index] = gridOfJewls[index+1];
      gridOfJewls[index+1] = jewl;  
    }
    if(direction.equals("LEFT"))
    {
      gridOfJewls[index] = gridOfJewls[index-1];
      gridOfJewls[index-1] = jewl;
    }
    if(direction.equals("ABOVE"))
    {
      gridOfJewls[index] = gridOfJewls[index-(height/sqrDim)];
      gridOfJewls[index-(height/sqrDim)] = jewl;
    }
    if(direction.equals("BELOW"))
    {
      gridOfJewls[index] = gridOfJewls[index+(height/sqrDim)];
      gridOfJewls[index+(height/sqrDim)] = jewl;
    }
    
    
    
    gridDisplay();
    
  }





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
            if (thisJewl.equals("circle"))
            {
              ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-10, squareDimension-10);
            } else if (thisJewl.equals("oval"))
            {
              ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-35, squareDimension-10);
            } else if (thisJewl.equals("triangle"))
            {
              triangle(xCoord+10, yCoord+squareDimension-10, xCoord+squareDimension-10, yCoord+squareDimension-10, xCoord+(squareDimension/2), yCoord+10);
            } else if (thisJewl.equals("square"))
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

    public String toString() {
      return "Square Width: "+squareDimension +"Array Size: "+arraySize+" XCoord:  "+mouseX;
    }
  }
