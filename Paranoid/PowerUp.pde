class PowerUp{
  float x;
  float y;
  float my;
  float powerSize;
  int powerType;
  int colorRed;
  int colorGreen;
  int colorBlue;
  boolean on;
  int initialSecond;
  int initialMinute;
  int initialHour;
  
  //randomize powerups:
  //1 - red    - instakill
  //2 - green  - extend paddle size
  //3 - blue   - multiple balls
  //4 - yellow - slow ball ySpeed
  //5 - purple - space = rocket/laser shot
  //6 - teal   - stronger ball
  
  PowerUp(){
    x = 0;
    y = 0;
    my = 0;
    powerSize = 20;
    powerType = 0;
    on = false;
  }
  
  void start(float xCoord, float yCoord){
    x = xCoord;
    y = yCoord;
    my = 5;
    choosePower();
    chooseColor(powerType);
  }
  
  void update(){
    y += my;
  }
  
  void show(){
    fill(colorRed, colorGreen, colorBlue);
    rect(x - powerSize / 2, y - powerSize / 2, powerSize, powerSize, powerSize / 2);
  }
  
  void choosePower(){
    powerType = ceil(random(0.1, 6));
  }
  
  void chooseColor(int type){
    switch(type){
      case 1:
        colorRed = 255;
        colorGreen = colorBlue = 0;
        break;
      case 2:
        colorGreen = 255;
        colorRed = colorBlue = 0;
        break;
      case 3:
        colorBlue = 255;
        colorRed = colorGreen = 0;
        break;
      case 4:
        colorRed = 255;
        colorGreen = 255;
        colorBlue = 0;
        break;
      case 5:
        colorRed = 255;
        colorGreen = 0;
        colorBlue = 255;
        break;
      case 6:
        colorRed = 0;
        colorGreen = 255;
        colorBlue = 255;
        break;
      default:
        colorRed = 255;
        colorGreen = 255;
        colorBlue = 255;
        break;
    }
  }
  
  int hitPaddle(float x1, float x2, float top, float bottom){
    if(y + powerSize / 2 >= top && y - powerSize / 2 <= bottom){
      if(x + powerSize / 2 >= x1 && x - powerSize / 2 <= x2){
        colorRed = 0;
        colorGreen = 0;
        colorBlue = 0;
        x = 0;
        y = 0;
        my = 0;
        on = true;
        initialSecond = second();
        initialMinute = minute();
        initialHour = hour();
        return powerType;
      }
    }
    return 0;
  }
  
}