void setup() {
  size(800,800);
  background(255,255,255);
  
  noStroke();
  fill(237,201,123);
  rect(20,0,780,20);
  rect(0,0,20,780);
  rect(0,780,780,20);
  rect(780,20,20,780);
  
  stroke(119,19,19);
  noFill();
  strokeWeight(10.0);
  rect(20,20,760,760);
  
  
  strokeWeight(1.0);
  
  //angle(700,100,0);
  //for(int i = 150;i < 700;i+=120){
  //  angle(700,i,0.5);
  //}
  //angle(700,700,1);
  //angle(100,700,2);
  //angle(100,100,3);
  
  fill(237,201,123);
  strokeWeight(10.0);
  rect(100,100,600,600);
  strokeWeight(1.0);
  
  for(int i = 110;i < 640; i+=10){
    fill(119,19,19);
    ellipse(i+30,695,4,4);
    ellipse(i+30,105,4,4);
    noFill();
    arc(i+30,695,10,20,PI,2*PI);
    arc(i+30,105,10,20,0,PI);
  }
  for(int i = 110;i < 640; i+=10){
    fill(119,19,19);
    ellipse(695,i + 30,4,4);
    ellipse(105,i + 30,4,4);
    noFill();
    arc(695,i + 30,20,10,PI/2,3*PI/2);
    arc(105,i + 30,20,10,-PI/2,PI/2);
  }
  ellipse_1(105,105,0);
  ellipse_1(695,105,1);
  ellipse_1(695,695,2);
  ellipse_1(105,695,3);
  
  
  for(int x = 100;x <= 680;x+=20){
    demo(x,100,0);
  }
  for(int x = 120;x <= 700;x+=20){
    demo(x,700,2);
  }
  for(int y = 100;y <= 680;y+=20){
    demo(700,y,1);
  }
  for(int y = 120;y <= 700;y+=20){
    demo(100,y,-1);
  }
  angle2(700,700,0);
  angle2(100,700,1);
  angle2(100,100,2);
  angle2(700,100,3);
  
  for(int i = 37;i <= 745;i+=22){
    element(i,30,0);
    element(770,i,1);
  }
  
  for(int i = 37;i <= 745;i+=22){
    element(i,760,0);
    element(40,i,1);
  }
  strokeWeight(1.0);
  circle(150,300);
  circle(300,150);
  
  circle(650,500);
  circle(500,650);
  
  circle(650,300);
  circle(300,650);
  
  circle(150,500);
  circle(500,150);
  
  //center();
  stroke(119,19,19);
  noFill();
  drawCircle(width/2,height/2,200);
  
  save("YuanLi_Quilt.png");
}

void angle(int x,int y,float angle) {
  pushMatrix();
  translate(x,y);
  
  rotate(angle * PI/2);
  stroke(119,19,19);
  noFill();
  arc(-40, -40, 80*sqrt(2), 80*sqrt(2), - PI / 4, PI / 4, OPEN);
  arc(40,40, 80*sqrt(2), 80*sqrt(2), - 3 * PI / 4, - PI / 4, OPEN);
  arc(0, -40, 80, 80, - PI / 2, 0);
  arc(40, 0, 80, 80, - PI / 2, 0);
  popMatrix();
}

void drawCircle(float x, float y, float radius) {
  ellipse(x, y, radius, radius);
  ellipse(y, x, radius, radius);
  if(radius > 2) {
    drawCircle(x + radius/2, y, radius/2);
    drawCircle(x - radius/2, y, radius/2);
  }
}

void demo(int x, int y, int rad){
  pushMatrix();
  translate(x,y);
  rotate(rad * PI/2);
  noFill();
  beginShape();
  line(0,0,0,-20);
  line(0,-20,10,-30);
  line(10,-30,20,-20);
  line(20,-20,20,0);
  line(20,0,10,-10);
  line(10,-10,0,0);
  ellipse(10,-15,5,5);
  line(5,-5,5,-25);
  line(15,-5,15,-25);
  endShape();
  popMatrix();
}

void angle2(int x, int y, int rad){
  pushMatrix();
  translate(x,y);
  rotate(rad * PI/2);
  line(0,0,20,0);
  line(20,0,30,30);
  line(30,30,0,20);
  line(0,20,0,0);
  ellipse(20,20,5,5);
  line(0,0,10,20+10/3);
  line(0,0,20+10/3,10);
  popMatrix();
}

void element(int x,int y, int rad){
  pushMatrix();
  translate(x,y);
  rotate(rad * PI/2);
  strokeWeight(2.0);
  noFill();
  arc(5,5,10,10,PI/2,2 * PI);
  arc(15,5,10,10,-PI/2, PI);
  popMatrix();
}

void circle(int x,int y){
  pushMatrix();
  translate(x,y);
  fill(119,19,19);
  ellipse(0,0,10,10);
  noFill();
  stroke(119,19,19);
  ellipse(0,0,40,40);
  
  for(int i = 0;i < 9; i++){
    line(0,10,0,25);
    rotate(i * (PI/4));
  }
  for(int i = 1;i < 5; i++){
    fill(119,19,19);
    ellipse(0,25,5,5);
    rotate(i * (PI/2));
  }
  
  popMatrix();
}

void ellipse_1(int x,int y, int rad) {
  pushMatrix();
  translate(x,y);
  rotate(rad * PI/2);
  fill(119,19,19);
  
  
  
  ellipse(8,8,15,15);
  noFill();
  curve(-100,-50,0,25,25,0,-50,-100);
  
  
  fill(119,19,19);
  ellipse(120,120,20,20);
  for(int i = 0;i < 16;i++){
    pic(50,50,i);
  }
  
  popMatrix();
}

void pic(int x, int y, int rad){
  pushMatrix();
  translate(x+70,y+70);
  rotate(rad * PI/8);
  line(0,0,-50,0);
  fill(119,19,19);
  ellipse(-50,0,20,5);
  popMatrix();
}
//void center() {
//  pushMatrix();
//  translate(400,400);
//  noFill();
//  beginShape();
//  curve(160,160,40,40,40,-40,160,-160);
//  curve(160,160,40,40,-40,40,-160,160);
//  curve(-160,160,-40,40,-40,-40,-160,-160);
//  curve(-160,-160,-40,-40,40,-40,160,-160);
//  endShape();
//  popMatrix();
//}