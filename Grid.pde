public class Grid {

  private Jewl[] gridOfJewls;
  //no getter or setter is created for the arrayIndex as it is an internal field that repesents the index in the arrayOfJewls array
  private int arrayIndex;
  private int arraySize;

  private int xCoord;
  private int yCoord;
  private int squareDimension;



  public Grid() {
    setSquareDimension();
    setArraySize();

    setGridOfJewls();
    gridDisplay();
  }
  
  public int getSquareDimension() {
    return squareDimension;
  }

  public void setSquareDimension() {
    this.squareDimension = 50;
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
      
      // the 1st 2 jewls can be the same (checking from the 3 jewl onwards will prevent an out of bounds error when doing checks in the while loop)
      if(arrayIndex>=2)
      {
        //this jewl should not be the same as the two jewls to the left of this jewl 
        // if they are the same create a new jewl
        while(gridOfJewls[arrayIndex-1].getJewlType().equals(singleJewl.getJewlType()) 
        && gridOfJewls[arrayIndex-2].getJewlType().equals(singleJewl.getJewlType()))
        {
          singleJewl=new Jewl();
          
        }
        // if the array index is greater than the 1st jewl on the second row (this will prevent an out of bounds error when doing checks in the while loop)
        if (arrayIndex >= (width/squareDimension)*2)
        {
          //this jewl should not be the same as the previous 2 jewls to the two 2 jewls above
          // if they are the same create a new jewl
          while(gridOfJewls[arrayIndex-((width/squareDimension)*2)].getJewlType().equals(singleJewl.getJewlType()) 
          && gridOfJewls[arrayIndex-(width/squareDimension)].getJewlType().equals(singleJewl.getJewlType()))
          {
            singleJewl = new Jewl();
          }
        }
        
      }
      this.gridOfJewls[arrayIndex] = singleJewl;
    }
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
        String thisJewl = printJewl.getJewlType();
        println("index: "+arrayInd+" shape: "+thisJewl);

        if (thisJewl.equals("circle"))
        {
          fill(255, 0, 0);
          ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-10, squareDimension-10);
        }

        if (thisJewl.equals("oval"))
        {
           fill(0, 0, 255);
            ellipse(xCoord+(squareDimension/2), yCoord+(squareDimension/2), squareDimension-35, squareDimension-10);
        }
        if (thisJewl.equals("triangle"))
        {
           fill(255, 255, 0);
           triangle(xCoord+10, yCoord+squareDimension-10, xCoord+squareDimension-10, yCoord+squareDimension-10, xCoord+(squareDimension/2), yCoord+10);
        }
        if (thisJewl.equals("square"))
        {
           fill(0, 255, 0);
           rect(xCoord+10, yCoord+10, squareDimension-20, squareDimension-20);
        }
        
          arrayInd++;
      }
        
      }
    }

    public String toString() {
      return "Square Width: "+squareDimension +"Array Size: "+arraySize+"grid Of Jewls: "+gridOfJewls[195];
    }
  }
