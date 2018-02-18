// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Base

PImage img1;

Glitcher glitch;

void setup()
{ // begin setup()

  size(600, 600);
  
  // load some images
  img1 = loadImage("data/apples.jpg");
  
  // initalized in SETUP
  glitch = new Glitcher(img1);

} // end setup()

void draw()
{
  // initialized in DRAW
  // glitch = new Glitcher(img1);

  glitch.redChannelShift(2, 2);
  
  image(glitch, 0, 0);
}