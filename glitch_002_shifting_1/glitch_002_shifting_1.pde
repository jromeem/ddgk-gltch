// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Shifting

// Shifting images ------------------------------------------------------------------------------------

PImage img1;
PImage img2;
PImage img3;

Glitcher glitch;
Glitcher glitch2;

void setup() {
  size(900, 600);
  
  // load some images
  img1 = loadImage("data/plumbers.jpg");
  img2 = loadImage("data/p5-white-on-transparent.png");
}

// the draw loop
void draw() {
  
  // display img1
  Glitcher glitch = new Glitcher(img1);
  glitch.shiftSegment(random(height), random(height), random(-40, 40));
  
  image(glitch, 0, 0);
  
  // display img2
  image(img2, 0, 0);
  
  // copy everything on the screen, and save it as an image (img3)
  PImage img3 = copy();
  
  // create a new glitch using the copied screen
  glitch2 = new Glitcher(img3);
  
  // pick a random segment and a random shift amount between (-40, 40) to horizontally shift 
  glitch2.shiftSegment(random(height), random(height), random(-40, 40));
  
  // display the resulting glitched image
  image(glitch2, 0, 0);
}

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3