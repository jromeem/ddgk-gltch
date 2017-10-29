// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Pixel Sorting

// Pixel sorting images ------------------------------------------------------------------------------------

// set the mode
int mode = 1;
// threshold values to determine sorting start and end pixels
int blackValue = -16000000;
int brightnessValue = 60;
int whiteValue = -13000000;

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
  blackValue = int(map(mouseX, 0, width - 1, -16777216, 0));
  brightnessValue = int(map(mouseX, 0, width - 1, 0, 255));
  whiteValue = int(map(mouseX, 0, width - 1, -16777216, 0));

  // create a new Glitcher
  glitch = new Glitcher(img);
  // make a new pixel sort glitch based on the mouseX positions
  glitch.pixelSort(mode, blackValue, brightnessValue, whiteValue);
  
  // display the glitch
  image(glitch, 0, 0);
}