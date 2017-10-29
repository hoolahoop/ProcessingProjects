var s;
var f;
var scl = 20;
var fr = 10;
var sizex = 600;
var sizey = 600;

function setup(){
	createCanvas(sizex,sizey);
	s = new Snake();
	f = new Food();
	frameRate(fr);
	f.pickLocation();
}

function draw(){
	background(51);
	s.crashEdge();
	s.update();
	s.show();

	if(s.eat(f)){
		f.pickLocation();
		//code for if the food lands on the snake, re-pick the food location
	}

	s.crash();
	

	fill(255, 0, 100);
	rect(f.x, f.y, scl, scl);
}

function keyPressed(){
	if (keyCode === UP_ARROW && s.yspeed !== 1){
		s.dir(0, -1);
	}else if (keyCode === DOWN_ARROW && s.yspeed !== -1){
		s.dir(0, 1);
	}else if (keyCode === LEFT_ARROW && s.xspeed !== 1){
		s.dir(-1, 0);
	}else if (keyCode === RIGHT_ARROW && s.xspeed !== -1){
		s.dir(1, 0);
	}
}