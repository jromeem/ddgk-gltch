// dadageek: Generative Collage and Glitch Art with Processing
// Glitch w/ Shapes Context and Structire: The Grid

// Using the grid ------------------------------------------------------------------------------------

PImage img1;
Glitcher glitch;
Grapher graph;
float cstep = 10;

void setup()
{
  size(900, 600);
  // load an image
  img1 = loadImage("data/plumbers.jpg");
  // load plumbers image into a Grapher object
  graph = new Grapher(img1);
  // load plumbers image into a Glitcher object
  glitch = new Glitcher(img1);
}

void draw()
{ // begin draw loop

  cstep+=0.1;
  color yellowColor = color(255, 255, 0);
  color blueColor = color(0, 255, 255);

  graph = new Grapher(img1);
  graph.drawRows(cstep, yellowColor);
  graph.drawColumns(cstep, blueColor);
  glitch.vshiftSegment(random(0, width), random(0, width), 20);

  image(glitch, 0, 0);
  image(graph, 100, 100, 700, 400);
  
} // end draw loop

// -----------------------------------------------------------------------------------------------------

// Happy Sketching,
// Jerome <3