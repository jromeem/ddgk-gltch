// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Shifting

// Shifting images ------------------------------------------------------------------------------------

PImage img1;
PImage img2;

Glitcher glitch;

void setup()
{
  size(900, 600);
  
  // load some images
  img1 = loadImage("data/plumbers.jpg");
  img2 = loadImage("data/p5-white-on-transparent.png");

  // load plumbers image into a Glitcher object
  glitch = new Glitcher(img1);
  
  // initially shift a few segments vertically in the image
  glitch.pixelate(0, 0, 0, 0);
}

// the draw loop
void draw()
{ // begin draw loop
  
} // end draw loop

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3