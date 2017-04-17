PGraphics pg;    // a PGraphics "buffer" where we can draw to
int No = 1;
int drawWeight = 5;
int numPoints = 20;                            // how many coordinates to keep?
int drawMode = 0;
color drawColor = color(0);
int[] T_X = new int[3];
int[] T_Y = new int[3];
int ClickNum = 0;
int ClickNum2 = 0;

int x1=0,y1=0;
void setup() {
  size(800,800);
  noCursor();
  // create the PGraphics buffer at the same size
  // as our sketch window
  pg = createGraphics(width,height);
}

void draw() {
  
  // PGraphics has a clear background, so we
  // have to redraw the background every frame
  background(255);
  color a = color(255, 0, 0);
  color b = color(0, 255, 0);
  color c = lerpColor(a, b, map(mouseX, 0, width, 0, 1));
  fill(c);
  rect(0, 780, width, 20);
  rect(0, 0, width, 20);
  rect(0, 0, 20, height);
  rect(780,0,20, height);
  
  image(pg, 0,0);
  fill(0, 100);                // semi-transparent lets us see the drawing underneath
  noStroke();
  ellipse(mouseX,mouseY, drawWeight,drawWeight);
  
}

void mouseClicked() { 
  if(drawMode == 4) {
    if(ClickNum2==0){
        x1=mouseX;
        y1=mouseY;
        ClickNum2++;
     }else{
       pg.beginDraw();
       pg.rect(x1,y1,mouseX-x1,mouseY-y1);
       pg.endDraw();
       ClickNum2=0;
     }
  }
}
// when the mouse is pressed, draw a
// square to the PGraphics image
void mousePressed() {
  
  if(ClickNum == 3){
    pg.beginDraw();
    pg.fill(drawColor);
    pg.strokeWeight(1);
    pg.triangle(T_X[0],T_Y[0],T_X[1],T_Y[1],T_X[2],T_Y[2]);
    pg.endDraw();
    T_X = new int[3];
    T_Y = new int[3];
    ClickNum = 0;
  }
  if(drawMode == 3){
    T_X[ClickNum] = mouseX;
    T_Y[ClickNum]= mouseY;
    ClickNum++;
  }
  
  
  if(drawMode == 0 || drawMode == 1){
    pg.beginDraw();                  // start drawing to PGraphics
    pg.stroke(drawColor);                    // note that we use pg.<command>
    pg.strokeWeight(drawWeight);
    pg.line(mouseX,mouseY, pmouseX,pmouseY);
    pg.endDraw();                    // endDraw() to update for display
  }else{
    pg.beginDraw();  
    pg.stroke(drawColor);                    // note that we use pg.<command>
    pg.strokeWeight(10);
    pg.line(mouseX,mouseY, pmouseX,pmouseY);;
    pg.endDraw();
  }
  
}

void mouseDragged() {
  if(drawMode == 0){
    pg.beginDraw();                  // start drawing to PGraphics
    //pg.fill(0);      // note that we use pg.<command>
    pg.strokeWeight(drawWeight);
    
    pg.stroke(drawColor);
    pg.line(mouseX,mouseY, pmouseX,pmouseY);
    pg.endDraw();                    // endDraw() to update for display
  }
  if(drawMode == 1) {
    pg.beginDraw();                  // start drawing to PGraphics
    //pg.fill(0);  
    
    pg.strokeWeight(drawWeight);
    pg.stroke(255,255,255);
    //pg.noStroke();
    pg.line(mouseX,mouseY, pmouseX,pmouseY);
    pg.endDraw();                    // endDraw() to update for display
  }
  
}

void keyPressed() {
  if (key == 's') {
    pg.save("DrawingAPP"+No+".png");
    No++;
  }
  if (key == '+') {
    drawWeight += 5;
  }
  if (key == '-') {
    drawWeight -= 5;
  }
  if(key == ' ') {
    drawColor = color(200,200,0); 
  }
  if(key == ','){
    color a = color(255, 0, 0);
    color b = color(0, 255, 0);
    drawColor = lerpColor(a, b, map(mouseX, 0, width, 0, 1));
  }
  if(key == '0') {
    drawMode = 0;
  }
  if(key == '1'){
    drawMode = 1;
  }
  if(key == '3'){
    drawMode = 3;
  }
  if(key == '4'){
    drawMode = 4;
  }
}