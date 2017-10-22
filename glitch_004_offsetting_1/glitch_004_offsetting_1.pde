// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Offsetting

// Offsetting images ------------------------------------------------------------------------------------

PImage img1;
PImage img2;
Glitcher glitch;
int theta = 0;
int delta = 1;

void setup()
{
  size(900, 600);
  
  // load some images
  img1 = loadImage("data/plumbers.jpg");

  // load plumbers image into a Glitcher object
  glitch = new Glitcher(img1);
}

void draw()
{ // begin draw loop
  
  glitch.offset(int(random(width)),int(random(height)),100,100,100);
  image(glitch, 0, 0);
  
} // end draw loop

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3