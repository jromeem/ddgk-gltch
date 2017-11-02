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
  // use only numbers (not variables) for the size() command, Processing 3
  size(900, 600);
  // create a new Glitcher
  glitch = new Glitcher(img);
}

void draw() {

  // load an image
  img = loadImage("data/tokyo.png");
  
  // map the values to the mouseX
  float threshold = int(map(mouseX, 0, width-1, 0, 1000));

  // create a new Glitcher
  glitch = new Glitcher(img);

  // make a new pixel sort glitch based on the mouseX positions
  glitch.pixelSort(2, threshold);
  
  // display the glitch
  image(glitch, 0, 0);
}