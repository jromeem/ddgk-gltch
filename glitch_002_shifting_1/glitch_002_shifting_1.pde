// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Shifting

// Shifting images ------------------------------------------------------------------------------------

PImage img1;
PImage img2;
PImage img3;

Glitcher glitch;
Glitcher glitch2;

void setup()
{ // begin setup()

  size(900, 600);
  
  // load some images
  img1 = loadImage("data/plumbers.jpg");
  img2 = loadImage("data/p5-white-on-transparent.png");
  
  // create a new glitcher object using img1
  glitch = new Glitcher(img1);

  // horizontally shift a random segment by a random amount between (-40, 40)
  float randX1 = random(0, width/2);
  float randX2 = random(width/2, width);
  float randXShiftAmount = random(-40, 40);
  glitch.vshiftSegment(randX1, randX2, randXShiftAmount);
  
  // display the resulting glitched image
  image(glitch, 0, 0);
  
  // display img2 (not a glitch object!)
  image(img2, 0, 0);
  
  // copy everything on the screen, and save it as an image (img3)
  PImage img3 = copy();
  
  // create a new glitch using the copied screen
  glitch2 = new Glitcher(img3);
  
  // veritcally shift a random segment by a random amount between (-40, 40)
  float randY1 = random(0, width/2);
  float randY2 = random(width/2, width);
  float randYShiftAmount = random(-40, 40);
  glitch2.shiftSegment(randY1, randY2, randYShiftAmount);
  
  // display the resulting glitched image
  image(glitch2, 0, 0);

} // end setup()


void draw()
{ // beginning of the draw loop


} // end of the draw loop

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3