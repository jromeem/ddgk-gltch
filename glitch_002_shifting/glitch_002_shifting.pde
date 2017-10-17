// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Layering

// Shifting images ------------------------------------------------------------------------------------

int theta = 1;
int shiftAmount = 100;
Glitcher glitch;
Glitcher glitch2;
PImage img2;

void setup() {
  size(900, 600);
  PImage img1 = loadImage("data/plumbers.jpg");
  img2 = loadImage("data/p5-white-on-transparent.png");

  glitch = new Glitcher(img1);
  glitch2 = new Glitcher(img2);

  int sa = 1;
  glitch.vshiftSegment(000, 100, 100/sa);
  glitch.vshiftSegment(100, 200, 200/sa);
  glitch.vshiftSegment(200, 300, 300/sa);
  glitch.vshiftSegment(300, 400, 400/sa);
  glitch.vshiftSegment(400, 500, 500/sa);
  glitch.vshiftSegment(500, 600, 600/sa);
  glitch.vshiftSegment(600, 700, 700/sa);
  glitch.vshiftSegment(700, 800, 800/sa);
  glitch.vshiftSegment(800, 900, 900/sa);
  //noLoop();
}

void draw() {
  float sa = 20;
  glitch.vshiftSegment(000, 100, sa);
  glitch.vshiftSegment(100, 200, sa);
  glitch.vshiftSegment(200, 300, sa);
  glitch.vshiftSegment(300, 400, sa);
  glitch.vshiftSegment(400, 500, sa);
  glitch.vshiftSegment(500, 600, sa);
  glitch.vshiftSegment(600, 700, sa);
  glitch.vshiftSegment(700, 800, sa);
  glitch.vshiftSegment(800, 900, sa);
  image(glitch, 0, 0);
  image(glitch2, 0, 0);
}


// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3