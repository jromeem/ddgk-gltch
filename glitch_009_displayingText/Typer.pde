class Typer {
  PFont font;
  
  Typer(String s, int i) {
    this.font = createFont(s, i);
    textFont(font);
  }
  
  // overloading text methods
  void text(char c, float  x, float y) { text(c,x,y); }
  void text(char c, float x, float y, float z) { text(c,x,y,z); }
  void text(String str, float x, float y) { text(str,x,y); }
  void text(char[] chars, int start, int stop, float x, float y) { text(chars,start,stop,x,y); }
  void text(String str, float x, float y, float z) { text(str,x,y,z); }
  void text(char[] chars, int start, int stop, float x, float y, float z) { text(chars,start,stop,x,y,z); }
  void text(String str, float x1, float y1, float x2, float y2) { text(str,x1,y1,x2,y2); }
  void text(float num, float x, float y) { text(num,x,y); }
  void text(int num, float x, float y) { text(num,x,y); }
  void text(float num, float x, float y, float z) { text(num,x,y,z); }
  void text(int num, float x, float y, float z) { text(num,x,y,z); }
}