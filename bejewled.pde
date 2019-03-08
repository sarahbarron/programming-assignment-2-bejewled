int xCoord;
int yCoord;
int sqrWidthHeight = 50;
int clickedIndex;
int sqrDim;
Grid jewlGrid;

void setup(){
  size(700,700);  
  background(0);
  jewlGrid = new Grid();
  sqrDim = jewlGrid.getSquareDimension();
  println(sqrDim);
  
}

void draw(){
  
}

void mouseClicked(){
    
  clickedIndex=(((mouseY/sqrDim)*(width/sqrDim))+(mouseX/sqrDim));
  
}
