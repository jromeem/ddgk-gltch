// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Layering

// Shifting images ------------------------------------------------------------------------------------

Glitcher glitch;

void setup() {
  size(900, 600);
  PImage img1 = loadImage("data/plumbers.jpg");

  glitch = new Glitcher(img1);
  glitch.shift(100).shift(100).shift(100).shift(600);
  image(glitch, 0, 0); 
}


// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3