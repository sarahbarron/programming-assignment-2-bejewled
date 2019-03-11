public class Jewl {

   private String[] arrayOfJewls;
   //no getter or setter is created for the arrayIndex as it is an internal field that repesents the index in the arrayOfJewls array
    private int arrayIndex;
    private int jewlIndex;
    private String jewlType;
    private int[] jewlColor;
    private int xCoord;
    private int yCoord;
   

    public Jewl() {     
      setArrayOfJewls();
      setJewlType();
      setJewlColor(jewlType);
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

    public int[] getJewlColor() {
        return jewlColor;
    }

    public void setJewlColor(String jewlType) {
      this.jewlColor = new int[3];
      if(jewlType.equals("circle"))
      {
        this.jewlColor[0] = 255;
        this.jewlColor[1] = 0;
        this.jewlColor[2] = 0;
      }
      if(jewlType.equals("oval"))
      {
        this.jewlColor[0]=0;
        this.jewlColor[1]=0;
        this.jewlColor[2]=255;
      }
      if(jewlType.equals("square"))
      {
        this.jewlColor[0]=0;
        this.jewlColor[1]=255;
        this.jewlColor[2]=0;
      }
      if(jewlType.equals("triangle"))
      {
        this.jewlColor[0]=255;
        this.jewlColor[1]=255;
        this.jewlColor[2]=0;
      }
    }

    public int getXCoord() {
        return xCoord;
    }

    public void setXCoord(int xCoord) {
        this.xCoord = xCoord;
    }

    public int getYCoord() {
        return yCoord;
   }

    public void setYCoord(int yCoord) {
        this.yCoord = yCoord;
    }
    
    public int getJewlIndex(){
      return jewlIndex;
    }
    public void setJewlIndex(int jewlIndex){
      this.jewlIndex = jewlIndex;
    }

public String toString(){
    return "Jewl Type:" + this.jewlType + " , Jewl Color: "+ this.jewlColor+ ", X Coord: "+this.xCoord +" , Y Coord: "+this.yCoord;
  }
}
