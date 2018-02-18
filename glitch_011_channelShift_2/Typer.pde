class Typer {
  PFont font;
  
  Typer(String s, int i) {
    this.font = createFont(s, i);
    textFont(font);
  }
  
  // overloading text methods
  void typeText(char c, float  x, float y) { text(c,x,y); }
  void typeText(char c, float x, float y, float z) { text(c,x,y,z); }
  void typeText(String str, float x, float y) { text(str,x,y); }
  void typeText(char[] chars, int start, int stop, float x, float y) { text(chars,start,stop,x,y); }
  void typeText(String str, float x, float y, float z) { text(str,x,y,z); }
  void typeText(char[] chars, int start, int stop, float x, float y, float z) { text(chars,start,stop,x,y,z); }
  void typeText(String str, float x1, float y1, float x2, float y2) { text(str,x1,y1,x2,y2); }
  void typeText(float num, float x, float y) { text(num,x,y); }
  void typeText(int num, float x, float y) { text(num,x,y); }
  void typeText(float num, float x, float y, float z) { text(num,x,y,z); }
  void typeText(int num, float x, float y, float z) { text(num,x,y,z); }
}