
PImage img;
PFont font;
String randomCharacters = "12340!@#$ASDF?!";

void setup()
{
  size(548,745);
  img = loadImage("data/portrait.jpg");
  font = createFont("Monaco", 44);
  textFont(font);
  textAlign(CENTER, CENTER);
}

void draw()
{
  image(img, 0, 0); 
  text(""+randomCharacters.charAt(4)+"", width/2, height/2);
}