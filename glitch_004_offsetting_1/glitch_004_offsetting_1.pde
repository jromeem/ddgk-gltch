// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Offsetting

// Offsetting images ------------------------------------------------------------------------------------

PImage img1;
Glitcher glitch;

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
  
  glitch.offset(int(random(width)),int(random(height)),50,50,30);
  image(glitch, 0, 0);
  
} // end draw loop

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3