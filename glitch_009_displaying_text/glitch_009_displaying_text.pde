
PImage img;
PFont font;

// a random string of characters
String randomCharacters = "12340!@#$ASDF?!QWERTYUIOP";

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
  size(548,745);
  
  img = loadImage("data/portrait.jpg");
  font = createFont("Monaco", 22);
  textFont(font);
  
  posx1 = random(0, width);
  posx2 = random(0, width);
  posx3 = random(0, width);
  
  posy1 = random(0, height);
  posy2 = random(0, height);
  posy3 = random(0, height);
}

void draw()
{
  image(img, 0, 0);
  
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
  textAlign(CENTER, BOTTOM);
  text(date, 0, 0, width, height*7/8);
  
  char randomLetter = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter2 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter3 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter4 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter5 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  char randomLetter6 = randomCharacters.charAt(int(random(randomCharacters.length()-1)));
  
  textAlign(CORNER, CORNER);
  text("h"+randomLetter+"llo w"+randomLetter2+"rld", posx1, posy1);
  text("he"+randomLetter3+"lo worl"+randomLetter4, posx2, posy2);
  text(randomLetter5+"ello wor"+randomLetter6+"d", posx3, posy3);
}