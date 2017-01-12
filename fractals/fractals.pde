float stickLength;
float strokeSize;
float theta;
int timer;
void setup() {
  stickLength = 100;
  strokeSize = 3;
  size(640, 360);
  timer = 0;
}

void draw() {
  //background(255);
  frameRate(30);
  stroke(0);
  timer += 1;
  if (timer%2==0&&stickLength > 0&& strokeSize>0) {
    theta+=10;
    strokeSize -= 0.01;
    stickLength -= 0.1;
  }
  translate (width/2, height/2);
  strokeWeight(strokeSize);
  line(0, 0, 0, stickLength);
  stick(stickLength);
}

void stick(float h) {
  h*=0.75;

  if (h>2) {
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