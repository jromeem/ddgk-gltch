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
  PImage img1 = loadImage("data/tokyo copy.png");
  img2 = loadImage("data/p5-white-on-transparent.png");

  glitch = new Glitcher(img1);
  glitch2 = new Glitcher(img2);

}

void draw() {
  int sa = 10;

  glitch.vshiftSegment(000, 100, random(-sa, sa));
  glitch.vshiftSegment(100, 200, random(-sa, sa));
  glitch.vshiftSegment(200, 300, random(-sa, sa));
  glitch.vshiftSegment(300, 400, random(-sa, sa));
  glitch.vshiftSegment(400, 500, random(-sa, sa));
  glitch.vshiftSegment(500, 600, random(-sa, sa));

  image(glitch, 0, 0);
  image(glitch2, 0, 0);
}


// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3