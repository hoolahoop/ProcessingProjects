class Block{
  float x;
  float y;
  float xSize;
  float ySize;
  int strength;
  int initialStrength;
  int blockColor;
  
  Block(){
    x = 0;
    y = 0;
    xSize = 100;
    ySize = 30;
    strength = 5;
    initialStrength = strength;
    blockColor = 255;
  }
  
  void update(){
    if(strength <= 0){
      blockColor = 0;
    }
    if(strength == 1){
      blockColor = 40;
    }
    if(strength == 2){
      blockColor = 80;
    }
    if(strength == 3){
      blockColor = 145;
    }
    if(strength == 4){
      blockColor = 195;
    }
    if(strength == 5){
      blockColor = 235;
    }
  }
  
  void show(){
    fill(blockColor);
    //println("x: " + x + " xSize: " + xSize + " y: " + y + " ySize: " + ySize);
    rect(x - xSize / 2, y - ySize / 2, xSize, ySize);
  }
}