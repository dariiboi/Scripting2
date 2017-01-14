//length of each stick
float stickLength;
//length of the stroke
float strokeSize;
//angle at which the stick branches out
float theta;
//the ypos of the origin of translation
float ypos;
void setup() {
  stickLength = 100;
  strokeSize = 2.5;
  size(640, 360);
  ypos = 0;
}

void draw() {
  background(255);
  stroke(0);
  ypos-=0.6;//move upwards constantly
  translate (width/2, height/2-ypos);//changes origin
  stickLength += 0.4;//increase the size of the sticks (makes it look like its zooming in)
  strokeSize -= 0.0008;//as you get farther the sticks get thinner so you can see detail
  line(0, 0, 0, stickLength);//first line
  stick(stickLength, strokeSize);
}

void stick(float h, float s) {
  h*=0.666666;//h is the next stick length.
  theta=PI/5;//the angle at which the sticks branch out in
  strokeWeight(s);
  if (h>2) {//recursive function stops when h is not bigger than 2
    //strokeSize*=(1/h);
 
    pushMatrix();
    //makes a branch go off to the right
    rotate(theta);
    line(0, 0, 0, -h);
    translate(0, -h);//move origin to the end of the last stick
    stick(h, strokeSize);//recall function.
    popMatrix();
    //push and pop matrix reset the translations
    pushMatrix();
    //makes a branch go off to the left
    rotate(-theta);
    line(0, 0, 0, -h);
    translate(0, -h);
    stick(h, strokeSize);
    popMatrix();
  }
}