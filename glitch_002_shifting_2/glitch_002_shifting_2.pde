// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Shifting

// Shifting images ------------------------------------------------------------------------------------

PImage img1;
PImage img2;

Glitcher glitch;

void setup() {
  size(900, 600);
  
  // load some images
  img1 = loadImage("data/plumbers.jpg");
  img2 = loadImage("data/p5-white-on-transparent.png");

  // load plumbers image into a Glitcher object
  glitch = new Glitcher(img1);
  
  // initially shift a few segments vertically in the image
  glitch.vshiftSegment(000, 100, 100);
  glitch.vshiftSegment(100, 200, 200);
  glitch.vshiftSegment(200, 300, 300);
  glitch.vshiftSegment(300, 400, 400);
  glitch.vshiftSegment(400, 500, 500);
  glitch.vshiftSegment(500, 600, 600);
  glitch.vshiftSegment(600, 700, 700);
  glitch.vshiftSegment(700, 800, 800);
  glitch.vshiftSegment(800, 900, 900);
}

// the draw loop
void draw() {
  
  // shift the same segments by the shiftAmount (10 pixels!)
  int shiftAmount = 10;
  glitch.vshiftSegment(000, 100, shiftAmount);
  glitch.vshiftSegment(100, 200, shiftAmount);
  glitch.vshiftSegment(200, 300, shiftAmount);
  glitch.vshiftSegment(300, 400, shiftAmount);
  glitch.vshiftSegment(400, 500, shiftAmount);
  glitch.vshiftSegment(500, 600, shiftAmount);
  glitch.vshiftSegment(600, 700, shiftAmount);
  glitch.vshiftSegment(700, 800, shiftAmount);
  glitch.vshiftSegment(800, 900, shiftAmount);
  
  // display the resulting glitched image
  image(glitch, 0, 0);
  
  // display img2 (not a glitched image!)
  image(img2, 0, 0);
}

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3