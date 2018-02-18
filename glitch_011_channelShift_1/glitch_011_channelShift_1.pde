// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Base

PImage img1;

Glitcher glitch;

void setup()
{ // begin setup()

  size(600, 600);
  
  // load some images
  img1 = loadImage("data/apples.jpg");
  
  // create a new glitcher object using img1
  glitch = new Glitcher(img1);

  // channel shift the segments
  glitch.redChannelShift(4, 6);
  glitch.greenChannelShift(15, 47);
  glitch.blueChannelShift(67, 29);
  
  // display the resulting glitched image
  image(glitch, 0, 0);

} // end setup()