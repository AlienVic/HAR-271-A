 float len=500;

void setup() {
  size(800, 800);
  background(255);
  frameRate(6000);
}

void draw() {
  translate(width/2, height/2);
  branch(len);

  for (int i=1; i<10; i++) {
    pushMatrix();
    rotate(PI*i/5);
    branch(len);
    popMatrix();
  }
}

void mousePressed() {
  saveFrame("myimage.png");
}

void branch(float len) {
  float rad=PI/5;
  float y1=-len;
  float y2=-(float)0.35*len;
  int x2=0;
  float x3=-(float)(len*0.55*sin(rad));
  float y3=-(float)(-y2+len*0.55*cos(rad));
  float x4=-x3;
  float y4=y3;

  
  if (len>18) {
    stroke(170,255,86);
    strokeWeight(0.1);
  } else {
    stroke(0,127,0);
    strokeWeight(1.5);
  }
  
  line(0, 0, 0, y1);
  line(x2, y2, x3, y3);
  line(x2, y2, x4, y4);

  len=len*0.55;

  if (len>10) {
    pushMatrix();
    translate(x2, y2);
    
    rotate(-rad);
    branch(len);
    popMatrix();

    pushMatrix();
    translate(x2, y2);
    
    rotate(rad);
    branch(len);
    popMatrix();
  }
}     