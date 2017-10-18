// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Homework 1

PImage img;
Glitcher glitch;
int eyeShiftAmount = 40;
int theta = 10;

void setup() {
  size(490,700);
  img = loadImage("data/frida.jpg");
  glitch = new Glitcher(img);
  
  // head
  glitch.shiftSegment(0, 240, 20);
  // eyes
  glitch.shiftSegment(240, 305, eyeShiftAmount);
  // nose
  glitch.shiftSegment(305, 375, 20);
  // mouth
  glitch.shiftSegment(375, 425, 40);
  // bottom half
  glitch.shiftSegment(425, height, 20);
  // left half
  glitch.vshiftSegment(0, 220, 15);
  // right half
  glitch.vshiftSegment(220, width, -15);
}

void draw() {
  // right half
  glitch.vshiftSegment(220, width, 15);
  // left half
  glitch.vshiftSegment(0, 220, -15);
  // bottom half
  glitch.shiftSegment(425, height, -20);
  // mouth
  glitch.shiftSegment(375, 425, -40);
  // nose
  glitch.shiftSegment(305, 375, -20);
  // eyes
  glitch.shiftSegment(240, 305, -eyeShiftAmount);
  // head
  glitch.shiftSegment(0, 240, -20);
  
  // head
  glitch.shiftSegment(0, 240, 20);
  // eyes
  glitch.shiftSegment(240, 305, eyeShiftAmount + theta);
  // nose
  glitch.shiftSegment(305, 375, 20);
  // mouth
  glitch.shiftSegment(375, 425, 40);
  // bottom half
  glitch.shiftSegment(425, height, 20);
  // left half
  glitch.vshiftSegment(0, 220, 15);
  // right half
  glitch.vshiftSegment(220, width, -15);
  
  image(glitch, 0, 0);
  
  displaySquares();
}

// method for drawing the squares
void displaySquares() {
  // some drawing settings
  noStroke();
  rectMode(CENTER);
  fill(255,255,255);
  
  // some variables for display the squares
  int lsize = 200;
  int ssize = 15;
  int l2size = lsize/2;
  int s2size = ssize/2;

  // left three squares
  rect(width/2-l2size, height/2-l2size-s2size, ssize, ssize);
  rect(width/2-l2size, height/2-s2size, ssize, ssize);
  rect(width/2-l2size, height/2+l2size-s2size, ssize, ssize);
  
  // right three squares
  rect(width/2+l2size, height/2-l2size-s2size, ssize,ssize);
  rect(width/2+l2size, height/2-s2size, ssize, ssize);
  rect(width/2+l2size, height/2+l2size-s2size, ssize, ssize);
  
  // top and bottom middle squares
  rect(width/2, height/2+l2size-s2size, ssize, ssize);
  rect(width/2, height/2-l2size-s2size, ssize, ssize);
}