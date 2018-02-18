
// images and fonts
PImage img;
PFont font;

// glitchers and graphers
Glitcher glitch;
Grapher graph;
Typer tt;

// a random string of characters
String randomCharacters = "{}|[]/:<>?.,);'~(*&^%$#@!-=_+12340!@#$";

// three x positions
float posx1;
float posx2;
float posx3;

// three y positions
float posy1;
float posy2;
float posy3;

void setup()
{
  // create the canvas
  size(548,745);
  
  // load an image and a font
  img = loadImage("data/portrait.jpg");
  tt = new Typer("Monaco", 22);
  
  // start a glitcher
  glitch = new Glitcher(img);
  glitch.shiftSegment(240, 285, -200);
  
  // create random x positions
  posx1 = random(0, width);
  posx2 = random(0, width);
  posx3 = random(0, width);
  
  // create random y positions
  posy1 = random(0, height);
  posy2 = random(0, height);
  posy3 = random(0, height);
}


void draw()
{
  // do some glitches first
  glitch.shiftSegment(240, 285, 3);
  glitch.shiftSegment(415, 540, -3);
  glitch.shiftSegment(615, 640, 2);
  glitch.vshiftSegment(0, width, 2);
  
  // start a grapher using the glitch as the image
  graph = new Grapher(glitch);
  color cc = color(255, 255, 255);
  
  // create a halftone based on the glitched image
  graph.halftone(10, cc);
  
  // display the background glitched image
  image(glitch, 0, 0);
  // display the halftone
  image(graph, 0, 0);
  // display a smaller version of the background on top
  image(glitch, 100, 100, 300, 500);
  
  // create a white unfilled rectangle
  noFill();
  stroke(255, 255, 255);
  rect(120, 60, 300, 500);
  
  // create strings for text
  String mm =  nf(millis()%1000, 3); // Values from 0 - 999
  String d = nf(day(), 2);    // Values from 1 - 31
  String mo = nf(month(), 2);  // Values from 1 - 12
  String y = nf(year(), 4);   // 2003, 2004, 2005, etc.
  String s = nf(second(), 2);  // Values from 0 - 59
  String m = nf(minute(), 2);  // Values from 0 - 59
  String h = nf(hour(), 2);    // Values from 0 - 23
  
  // build the date string
  String date = y+"-"+mo+"-"+d+" "+h+":"+m+":"+s+":"+mm;
  
  // set the alignment and display the text
  textAlign(CENTER, BOTTOM);
  tt.typeText(date, 0, 0, width, height*7/8);
  
  // create random letters drawn from the randomCharacters string
  char randomLetter = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter2 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter3 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter4 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter5 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter6 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  
  // set the alignment again
  textAlign(CORNER, CORNER);
  
  // display three different texts in three different positions
  tt.typeText("h"+randomLetter+"llo w"+randomLetter2+"rld", posx1, posy1);
  tt.typeText("he"+randomLetter3+"lo worl"+randomLetter4, posx2, posy2);
  tt.typeText(randomLetter5+"ello wor"+randomLetter6+"d", posx3, posy3);
}