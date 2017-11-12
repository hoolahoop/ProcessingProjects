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
  //7 - ?      - shrink paddle size
  //8 - ?      - increase paddle xSpeed
  //9 - ?      - decrease paddle xSpeed
  //10- ?      - weaker ball
  //11- ?      - increase ball ySpeed
  //12- ?      - bomb(an aoe around where the ball hits)
  
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
    chooseColor();
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
  
  void chooseColor(){
    switch(powerType){
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
      case 7:
        colorRed = 255/2;
        colorGreen = 0;
        colorBlue = 0;
        break;
      case 8:
        colorGreen = 255/2;
        colorRed = 0;
        colorBlue = 0;
        break;
      case 9:
        colorBlue = 255/2;
        colorRed = 0;
        colorGreen = 0;
        break;
      case 10:
        colorRed = 255/2;
        colorGreen = 255/2;
        colorBlue = 0;
        break;
      case 11:
        colorRed = 255/2;
        colorGreen = 0;
        colorBlue = 255/2;
        break;
      case 12:
        colorRed = 0;
        colorGreen = 255/2;
        colorBlue = 255/2;
        break;
      default:
        colorRed = 255;
        colorGreen = 255;
        colorBlue = 255;
        break;
    }
  }
  
  boolean hitPaddle(float x1, float x2, float top, float bottom){
    if(y + powerSize / 2 >= top && y - powerSize / 2 <= bottom){
      if(x + powerSize / 2 >= x1 && x - powerSize / 2 <= x2){
        colorRed = 0;
        colorGreen = 0;
        colorBlue = 0;
        x = 0;
        y = 0;
        my = 0;
        on = true;
        if(powerType == 1 || powerType == 5){
          initialSecond = second();
          initialMinute = minute();
          initialHour = hour();
        }
        return true;
      }
    }
    return false;
  }
  
  void powerUp(){
    
  }
}