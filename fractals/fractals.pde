float stickLength;
float strokeSize;
float theta;
int timer;
void setup() {
  stickLength = 100;
  strokeSize = 2;
  size(640, 360);
  timer = 0;
}

void draw() {
  background(255);
  frameRate(30);
  stroke(0);
  //timer += 1;
  theta +=33.3330;
  translate (width/2, height/2);
  
  strokeWeight(strokeSize);
  line(0, 0, 0, stickLength);
  stick(stickLength);
}

void stick(float h) {
  h*=0.6666;
 
  if (h>3) {
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0,-h);
    stick(h);
    popMatrix();
    
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0,-h);
    stick(h);
    popMatrix();
  }
}