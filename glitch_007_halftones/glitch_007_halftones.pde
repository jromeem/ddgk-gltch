// dadageek: Generative Collage and Glitch Art with Processing
// Glitch w/ Shapes Context and Structure: Halftones

// Halftoning images ------------------------------------------------------------------------------------

PImage img1;
Glitcher glitch;
Grapher graph;

void setup()
{
  size(900, 600);
  background(0);
  // load some images
  img1 = loadImage("data/plumbers.jpg");

  // load plumbers image into a Grapher object
  graph = new Grapher(img1);

  color cc = color(255, 255, 255);
  graph.halftone(5, cc);

  // image(img1, 0, 0);
  image(graph, 0, 0);
}

void draw()
{ // begin draw loop

} // end draw loop

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3