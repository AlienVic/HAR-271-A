import processing.pdf.*;
float maxSize=random(20,250);
float minSize=random(maxSize*0.3, maxSize*0.6);

void setup(){
  size(1152,720);
  beginRecord(PDF, "RandomAssign2.pdf");
  background(255);
  colorMode(HSB);
  noStroke();
  smooth();
  
}
 
void draw(){
  float x = random(width);
  float y=random(height);
  float r=random(maxSize, minSize);
  boolean bk = true;
   
  fill(0,50);
  ellipse(x+4, y+4, r, r);
   
  if(random(100)<50){
    bk=false;
  }
  float c=random(255);
  while (r>10){
    if(bk){
      fill(c,255,20);
    } else {
      fill(c,random(50,200),255);
    }
    ellipse(x,y, r, r);
    r*=random(0.75,0.95);
    bk=!bk;
  }
}

void keyReleased(){
  endRecord();
  exit();
}