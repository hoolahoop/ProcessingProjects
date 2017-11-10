class Paddle{
  float x;
  float y;
  float mx;
  float xsize;
  float ysize;
  float paddleSpeed;
  boolean keyStateLeft;
  boolean keyStateRight;
  
  Paddle(){
    mx = 0;
    xsize = 100;
    ysize = 30;
    x = width/2;
    y = height - 100;
    paddleSpeed = 5;
    keyStateLeft = false;
    keyStateRight = false;
  }
  
  void update(){
    x += mx * paddleSpeed;
    if(x > width - xsize / 2){
      x = width - xsize / 2;
    }
    if(x < xsize / 2){
      x = xsize / 2;
    }
  }
  
  void show(){
    fill(255);
    rect(x - xsize / 2, y - ysize / 2, xsize, ysize, 5);
  }
}