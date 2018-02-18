// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Pixel Sorting

// Pixel sorting images ------------------------------------------------------------------------------------

// set the mode
// mode 0 - blackness
// mode 1 - brightness
// mode 2 - whiteness
int mode = 1;

// threshold values to determine sorting start and end pixels
float thresholdValue = 500; // between 0 - 1000

Glitcher glitch;

PImage img;

void setup() {
  img = loadImage("data/tokyo.png");
  size(900, 600);
}

void draw() {

  // load an image
  img = loadImage("data/tokyo.png");
  
  // map the values to the mouseX
  float threshold = int(map(mouseX, 0, width-1, 0, 1000));

  // create a new Glitcher
  glitch = new Glitcher(img);

  // make a new pixel sort glitch based on the mouseX positions

  // differernt pixel sort options (use one at a time-- uses a lot of processing power!!!)

  glitch.hpixelSort(0, threshold);
  // glitch.hpixelSort(1, threshold);
  // glitch.hpixelSort(2, threshold);

  // glitch.vpixelSort(0, threshold);
  // glitch.vpixelSort(1, threshold);
  // glitch.vpixelSort(2, threshold);

  // glitch.pixelSort(0, threshold);
  // glitch.pixelSort(1, threshold);
  // glitch.pixelSort(2, threshold);

  // display the glitch
  image(glitch, 0, 0);
}