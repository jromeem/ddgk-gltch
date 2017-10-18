// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Foundation

// Loading an image ------------------------------------------------------------------------------------

void setup()
{
  size(900, 600);
  PImage img;
  img = loadImage("data/plumbers.jpg");
  image(img, 0, 0);
}

// Positioning an image --------------------------------------------------------------------------------

//void setup()
//{
//  size(900, 600);
//  PImage img;
//  img = loadImage("data/plumbers.jpg");
//  image(img, 100, 100);
//}

// Image modes -----------------------------------------------------------------------------------------

//void setup()
//{
//  size(900, 600);
//  PImage img;
//  img = loadImage("data/plumbers.jpg");
//  imageMode(CENTER);
//  image(img, 300, 300);
//  //////////////////////////////////
//  //imageMode(CORNERS);
//  //image(img, 300, 300, 320, 320);
//  //////////////////////////////////
//  //imageMode(CORNER);
//  //image(img, 300, 300, 320, 320);
//}

// Resizing an image -----------------------------------------------------------------------------------

//void setup()
//{
//  size(900, 600);
//  PImage img;
//  img = loadImage("data/plumbers.jpg");
//  img.resize(100, 100);
//  image(img, 300, 200);
//}

// Remeber: There is always more than one solution to a given problem! --------------------------------

//void setup()
//{
//  size(900, 600);
//  PImage img;
//  img = loadImage("data/plumbers.jpg");
//  img.resize(400, 266);
//  image(img, width/2 - 400/2, height/2 - 266/2);
//  ////////////////////////////////////
//  //size(900, 600);
//  //PImage img;
//  //img = loadImage("data/plumbers.jpg");
//  //img.resize(400, 0);
//  //imageMode(CENTER);
//  //image(img, width/2, height/2);
//}

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3