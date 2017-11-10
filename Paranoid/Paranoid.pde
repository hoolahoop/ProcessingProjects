Paddle paddle;
Ball ball;
int ballCount;
Block[] blocks = new Block[5];
int testCount = 0;

void settings(){
  size(1500, 1000);
}

void setup(){
   paddle = new Paddle();
   ball = new Ball();
   ballCount = 1;
   for(int i = 0; i < blocks.length; i++){
     blocks[i] = new Block();
     blocks[i].x = width/blocks.length*(i + 1) - blocks[i].xSize*2 + blocks[i].xSize/2;
     blocks[i].y = 200;
   }
}

void draw(){
  background(0);
  paddle.update();
  paddle.show();
  
  for(int i = 0; i < blocks.length; i++){
     blocks[i].update();
     blocks[i].show();
   }
  
  if(ball.y > 850){
  ball.hitPaddle(
    paddle.x - paddle.xsize / 2, 
    paddle.x + paddle.xsize / 2, 
    paddle.y - paddle.ysize / 2, 
    paddle.y + paddle.ysize / 2);
  }
  
  if(ball.y < 300){
    int hitBlock = -1;
    for(int i = 0; i < blocks.length; i++){
      if(blocks[i].strength > 0){
        hitBlock = ball.hitBlock(
          blocks[i].x - blocks[i].xSize / 2,
          blocks[i].x + blocks[i].xSize / 2,
          blocks[i].y - blocks[i].ySize / 2,
          blocks[i].y + blocks[i].ySize / 2,
          i);
      }
      if(hitBlock != -1){
        println(hitBlock + " " + blocks[hitBlock].strength);
        blocks[hitBlock].strength--;
        println(blocks[hitBlock].strength);
      }
    }
  }
  
  ball.update();
  ball.show();
}

void keyPressed(){
  if(key == CODED){
    if(keyCode == LEFT){
      paddle.keyStateLeft = true;
      paddle.mx = -1;
    }
    else if(keyCode == RIGHT){
      paddle.keyStateRight = true;
      paddle.mx = 1;
    }
  }
}

void keyReleased(){
  if(key == CODED){
    if(keyCode == LEFT){
      if(paddle.keyStateRight){
        paddle.mx = 1;
      }else{
        paddle.mx = 0;
      }
      paddle.keyStateLeft = false;
    }
    else if(keyCode == RIGHT){
      if(paddle.keyStateLeft){
        paddle.mx = -1;
      }else{
        paddle.mx = 0;
      }
      paddle.keyStateRight = false;
    }
  }
}