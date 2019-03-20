/*
 Name : Sarah Barron
 Student Number: 20013679
 
 HDIP Computer Science - WIT - March 2019
 Programming assignment 2.
 
 Jewel Class - creates a jewel - there are 4 types of jewel that it could be
 Each Jewl has a type, color, x Coordinate, y Coordinate, array index,
 and a boolean to check if it is blank or not (it is set to blank if
 it has been matched on the grid.)
 */

public class Jewel { //<>//
  // Array storing 4 different jewel types 
  private String[] arrayOfJewels;
  //Index in the arrayOfJewels array
  private int arrayIndex;
  // Stores the index of where the jewel is stored in the gridOfJewels array
  private int jewelIndex;
  // The type of jewel 
  private String jewelType;
  // Array of values for the color of the jewel
  private int[] jewelColor;
  // X Coordinate of the jewel on the grid
  private int xCoord;
  // Y Coordinate of the jewel on the grid
  private int yCoord;
  // variable to store if is the jewel blank or not 
  private boolean blank;


  // Constructor method calling various setter methods to create a jewel
  public Jewel() {     
    setArrayOfJewels();
    setJewelType();
    setJewelColor(jewelType);
    setBlank(false);
  }

  // Setter method sets an array of 4 different jewel types
  public void setArrayOfJewels() {
    this.arrayOfJewels = new String[4];          
    this.arrayOfJewels[0]="circle";
    this.arrayOfJewels[1]="oval";
    this.arrayOfJewels[2] ="square";
    this.arrayOfJewels[3]="triangle";
  }


  // Getter returns the array of jewel types
  public String[] getArrayOfJewels() {
    return arrayOfJewels;
  }


  // Getter returns the type of jewel 
  public String getJewelType() {
    return jewelType;
  }


  /* Setter method to randomly set the type of jewel by picking a random number between
   0 and 3 and picking a jewel using this random number from the array of jewels */
  public void setJewelType() {
    this.arrayIndex = int(random(4));
    this.jewelType = arrayOfJewels[arrayIndex];
  }


  // Setter method sets the jewel type to blank
  public void setJewelType(String blank) {
    this.jewelType = "blank";
  }


  // Getter method returns an array with the 3 color values for RGB
  public int[] getJewelColor() {
    return jewelColor;
  }


  // Setter method sets the color values depending on the jewel type
  public void setJewelColor(String jewelType) {
    // create a jewelColor array of size 3 to store a value for R,G,B
    this.jewelColor = new int[3];
    // if the jewel type is circle set the RGB values to red and store each value in the array
    if (jewelType.equals("circle"))
    {
      this.jewelColor[0] = 255;
      this.jewelColor[1] = 0;
      this.jewelColor[2] = 0;
    }
    // otherwise if the type is oval set the RGB values to blue and store each value in the array
    else if (jewelType.equals("oval"))
    {
      this.jewelColor[0]=0;
      this.jewelColor[1]=0;
      this.jewelColor[2]=255;
    }
    // otherwise if the type is square set the RGB values to green and store each value in the array
    else if (jewelType.equals("square"))
    {
      this.jewelColor[0]=0;
      this.jewelColor[1]=255;
      this.jewelColor[2]=0;
    }
    // otherwise if the type is triangle set the RGB values to yellow and store each value in the array
    else if (jewelType.equals("triangle"))
    {
      this.jewelColor[0]=255;
      this.jewelColor[1]=255;
      this.jewelColor[2]=0;
    }
  }


  // Getter method to get the X Coordinate of where the jewel is positioned in the array
  public int getXCoord() {
    return xCoord;
  }


  // Setter method to set the X Coordinate of where the jewel is positioned in the array
  public void setXCoord(int xCoord) {
    this.xCoord = xCoord;
  }


  // Getter method to get the Y Coordinate of where the jewel is positioned in the array
  public int getYCoord() {
    return yCoord;
  }


  // Setter method to set the Y Coordinate of where the jewel is positioned in the array
  public void setYCoord(int yCoord) {
    this.yCoord = yCoord;
  }


  // Getter method to get the index of where the jewel is positioned in the Grids array
  public int getJewelIndex() {
    return jewelIndex;
  }


  // Setter method to set the index of where the jewel is positioned in the Grids array
  public void setJewelIndex(int jewelIndex) {
    this.jewelIndex = jewelIndex;
  }


  /* Setter method sets the jewels blank variable initially to false
   but when the jewel has been matched to 3 in a row or in a column this 
   setter method will be called again and the boolean true will be passed to it */
  public void setBlank(boolean blank)
  {
    this.blank = blank;
    // if the jewel is blank set the jewel type to blank
    if (blank == true)
    {
      setJewelType("blank");
    }
  }


  // Getter method returns true or false depending on if the jewel is blank or not
  public boolean getBlank()
  {
    return blank;
  }


  // Jewel class toString method
  public String toString() {
    return "Jewel Type:" + this.jewelType + " , Jewel Color: "+ this.jewelColor+ ", X Coord: "+this.xCoord +" , Y Coord: "+this.yCoord;
  }
}
