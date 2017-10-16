// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Layering

// Shifting images ------------------------------------------------------------------------------------

void setup() {
  size(900, 600);
  PImage img1 = loadImage("data/plumbers.jpg");
  image(img1, 0, 0); 
  Glitcher glitch = new Glitcher(img1);
  glitch.shift().shift().shift();
}


// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3