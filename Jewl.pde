public class Jewl {

   private String[] arrayOfJewls;
   //no getter or setter is created for the arrayIndex as it is an internal field that repesents the index in the arrayOfJewls array
    private int arrayIndex;
    private String jewlType;
    private String jewlColor;
    private int xCoord;
    private int yCoord;
   

    public Jewl() {     
      setArrayOfJewls();
      setJewlType();
      setColor(this.jewlType);
    }

    

    public void setArrayOfJewls() {
          this.arrayOfJewls = new String[4];          
          this.arrayOfJewls[0]="circle";
          this.arrayOfJewls[1]="oval";
          this.arrayOfJewls[2] ="square";
          this.arrayOfJewls[3]="triangle";
    }
    
    public String[] getArrayOfJewls() {
             return arrayOfJewls;
             
    }

    public String getJewlType() {
        return jewlType;
    }

    public void setJewlType() {
        this.arrayIndex = int(random(4));
        this.jewlType = arrayOfJewls[arrayIndex];
        
  }

    public String getColor() {
        return jewlColor;
    }

    public void setColor(String jewlType) {
      
      if(jewlType.equals("circle"))
      {
        this.jewlColor = "red";
      }
      if(jewlType.equals("oval"))
      {
        this.jewlColor = "blue";
      }
      if(jewlType.equals("square"))
      {
        this.jewlColor = "green";
      }
      if(jewlType.equals("triangle"))
      {
        this.jewlColor = "yellow";
      }
    }

//    public int getxCoord() {
//        return xCoord;
//    }

//    public void setxCoord(int xCoord) {
//        this.xCoord = xCoord;
//    }

//    public int getyCoord() {
//        return yCoord;
//    }

//    public void setyCoord(int yCoord) {
//        this.yCoord = yCoord;
//    }

public String toString(){
    return "Jewl Type:" + this.jewlType + " , Jewl Color: "+ this.jewlColor;
  }
}
