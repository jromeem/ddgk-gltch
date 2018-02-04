// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Base

PImage img1;

Glitcher glitch;

void setup()
{ // begin setup()

  size(900, 600);
  
  // load some images
  img1 = loadImage("data/plumbers.jpg");
  
  // create a new glitcher object using img1
  glitch = new Glitcher(img1);

  // shift the segments
  glitch.shiftSegment(100, 200, 50);
  glitch.shiftSegment(250, 400, 150);
  glitch.shiftSegment(420, 440, 250);
  glitch.shiftSegment(600, 700, 350);
  
  // display the resulting glitched image
  image(glitch, 0, 0);

} // end setup()