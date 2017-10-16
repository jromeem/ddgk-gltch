// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Layering

// Shifting images ------------------------------------------------------------------------------------

void setup() {
  size(900, 600);
  PImage img1 = loadImage("data/plumbers.jpg");
  Glitcher glitch = new Glitcher(img1);
  
  // chaining shifts
  glitch.shift().vshift().vshift();
}


// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3