// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Layering

// Shifting images ------------------------------------------------------------------------------------

int theta = 1;
int shiftAmount = 100;
Glitcher glitch;

void setup() {
  size(900, 600);
  PImage img1 = loadImage("data/plumbers.jpg");

  glitch = new Glitcher(img1);
  glitch.shiftSegment(100, 200, 100);
  glitch.shiftSegment(200, 300, 200);
  glitch.shiftSegment(300, 400, 300);
  glitch.shiftSegment(400, 500, 400);
  glitch.shiftSegment(500, 600, 500);
  image(glitch, 0, 0);
}

//void draw() {
//  float go = random(0,height-300);
//  glitch.shiftSegment(go, go+300, random(-3,3));
//  image(glitch, 0, 0);
//}


// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3