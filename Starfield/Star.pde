class Star{
  float x;
  float y;
  float z;
  
  float mx;
  float my;
  
  float pz;
  
  Star() {
    //x = random(-width/10, width/10);
    //y = random(-height/10, height/10);
    mx = map(mouseX, 0, width, -width/2, width/2);
    x = random(mx - width/10, mx + width/10);
    my = map(mouseY, 0, height, -height/2, height/2);
    y = random(my - height/10, my + height/10);
    z = random(width);
    pz = z;
  }
  
  void update(){
    z = z - speed;
    if( z < 1){
      z = width;
      //x = random(-width/10, width/10);
      //y = random(-height/10, height/10);
      //x = map(mouseX, 0, width, -width/2, width/2);
      //y = map(mouseY, 0, height, -height/2, height/2);
      mx = map(mouseX, 0, width, -width/2, width/2);
      x = random(mx - width/10, mx + width/10);
      my = map(mouseY, 0, height, -height/2, height/2);
      y = random(my - height/10, my + height/10);
      pz = z;
    }
  }
  
  void show(){
    fill(255);
    noStroke();
    
    float sx = map(x / z, 0, 1, 0, width);
    float sy = map(y / z, 0, 1, 0, height);
    
    float r = map(z, 0, width, 16, 0);
    ellipse(sx, sy, r, r);
    
    float px = map(x / pz, 0, 1, 0, width);
    float py = map(y / pz, 0, 1, 0, height);
    
    stroke(255);
    //line(px, py, sx, sy);
    pz = z;
  }
}