float stickLength;
float strokeSize;
float theta;
float ypos;
int timer;
void setup() {
  stickLength = 100;
  strokeSize = 2.5;
  size(640, 360);
  timer = 0;
  ypos = 0;
}

void draw() {
  background(255);
  //frameRate(30);
  stroke(0);
  //timer += 1;
  //theta +=4;
  ypos-=0.6;
  translate (width/2, height/2-ypos);
  //ellipse(0, 0, 355, 355);
  stickLength += 0.4;
  strokeSize -= 0.0008;

  line(0, 0, 0, stickLength);
  stick(stickLength, strokeSize);
}

void stick(float h, float s) {
  h*=0.666666;
  theta=PI/5;
  strokeWeight(s);
  if (h>2) {
    //strokeSize*=(1/h);
    pushMatrix();
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    stick(h, strokeSize);
    popMatrix();

    pushMatrix();
    //strokeSize/=h;
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    stick(h, strokeSize);
    popMatrix();
  }
}