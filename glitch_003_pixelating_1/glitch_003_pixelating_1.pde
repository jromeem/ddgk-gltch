// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Pixelating

// Pixelating images ------------------------------------------------------------------------------------

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
  img2 = loadImage("data/p5-white-on-transparent.png");

  // load plumbers image into a Glitcher object
  glitch = new Glitcher(img1);
}

void draw()
{ // begin draw loop

  // increase pixelation by the delta amount
  theta+=delta;

  // reverse the delta when theta reaches a certain amount
  if (theta > 30) {
    delta*=-1; 
  }

   //pixelate the image
  glitch.pixelate(theta);
  
  // draw image
  image(glitch, 0, 0);
  
} // end draw loop

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3