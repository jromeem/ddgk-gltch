// dadageek: Generative Collage and Glitch Art with Processing
// Glitch w/ Shapes Context and Structure: The Grid

// Offsetting images ------------------------------------------------------------------------------------

PImage img1;
Glitcher glitch;
Grapher graph;
float cstep = 10;

void setup()
{
  size(900, 600);
  // load some images
  img1 = loadImage("data/plumbers.jpg");

  // load plumbers image into a Grapher object
  graph = new Grapher(img1);

  color cc = color(255, 255, 255);
  graph.halftone(5, cc);

  image(img1, 0, 0);
  image(graph, 0, 0);
}

void draw()
{ // begin draw loop

} // end draw loop

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3