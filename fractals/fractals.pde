float stickLength;
float strokeSize;
float theta;
float ypos;
int timer;
void setup() {
  stickLength = 100;
  strokeSize = 2;
  size(640, 360);
  timer = 0;
  ypos = 0;
}

void draw() {
  background(255);
  frameRate(30);
  stroke(0);
  //timer += 1;
  //theta +=4;
  ypos-=0.3;
  translate (width/2, height/2-ypos);
  //ellipse(0, 0, 355, 355);
  stickLength += 0.2;
  strokeSize += 0.001;
  strokeWeight(strokeSize);
  line(0, 0, 0, stickLength);
  stick(stickLength);
  //noLoop();
}

void stick(float h) {
  h*=0.666666;
  theta=PI/5;
  if (h>2) {
    println(h);
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    stick(h);
    popMatrix();

    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    stick(h);
    popMatrix();
  }
}