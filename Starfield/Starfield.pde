Star[] stars = new Star[800];
float speed = 20;
void settings(){
  size(1500, 1500);
}

void setup() {
  for (int i=0; i < stars.length; i++){
    stars[i] = new Star();
  }
}

void draw(){
  //speed = map(mouseX, 0, width, 0, 50);
  background(0);
  translate(width/2, height/2);
  for (int i=0; i < stars.length; i++){
    stars[i].update();
    stars[i].show();
  }
}