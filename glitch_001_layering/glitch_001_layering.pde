// dadageek: Generative Collage and Glitch Art with Processing
// Glitch & Media: Layering

// Loading multiple images ------------------------------------------------------------------------------------

void setup()
{
  size(900, 600);
  PImage img1 = loadImage("data/plumbers.jpg");
  image(img1, 0, 0);

  PImage img2 = loadImage("data/p5-white-on-transparent.png");
  imageMode(CENTER);
  image(img2, width/2, height/2);
  blend(img2, 0, 0, width, height, 0, 0, width, height, OVERLAY);
}

// Blending images -----------------------------------------------------------------------------------------------------

//void setup()
//{
//  size(900, 600);
//  PImage img1 = loadImage("data/plumbers.jpg");
//  image(img1, 0, 0);

//  PImage img2 = loadImage("data/p5-white-on-black.png");
//  blend(img2, 0, 0, width, height, 0, 0, width, height, OVERLAY);
//}

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3