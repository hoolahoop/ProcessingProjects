class Ball{
  float x;
  float y;
  float mx;
  float my;
  float ballSpeed;
  float ballSize;
  int paddleHitCount;
  
  Ball(){
    mx = 1;
    my = -1;
    ballSize = 20;
    x = width/2;
    y = height - 200;
    ballSpeed = 5;
    paddleHitCount = 0;
  }
  
  void update(){
    if(x >= width - ballSize / 2){
      mx *= -1;
    }
    if(x <= 0){
      mx *= -1;
    }
    if(y <= 0){
      my *= -1;
    }
    
    x += mx * ballSpeed;
    y += my * ballSpeed;
  }
  
  void show(){
    fill(255);
    rect(x - ballSize / 2, y - ballSize / 2, ballSize, ballSize, ballSize / 2);
  }
  
  void hitPaddle(float x1, float x2, float top, float bottom){
    if(y + ballSize / 2 >= top && y - ballSize / 2 <= bottom){
      //println(paddleHitCount + " x1:" + x1 + " x:" + x + " x2:" + x2);
      if(x + ballSize / 2 >= x1 && x - ballSize / 2 <= x2){
        paddleHitCount++;
        my *= -1;
        mx = map((x2 - x), 0, x2 - x1, 2, -2);
      }
    }
  }
  
  int hitBlock(float x1, float x2, float top, float bottom, int blockNum){
    if(y - ballSize / 2 == bottom || y + ballSize / 2 == top){
      if(x + ballSize / 2 >= x1 && x - ballSize / 2 <= x2){
        my *= -1;
        return blockNum;
      }
    }
    if(y - ballSize / 2 < bottom && y + ballSize / 2 > top){
      if(x + ballSize / 2 >= x1 && x - ballSize / 2 <= x2){
        mx *= -1;
        return blockNum;
      }
    }
    return -1;
  }
}