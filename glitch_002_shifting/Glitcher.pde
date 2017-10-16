class Glitcher {
  PImage img;
  
  Glitcher(PImage i) {
    this.img = i;
  }
  
  Glitcher shift(int shiftAmount) {
    loadPixels();
    for (int i = 0; i < width*height-shiftAmount; i++) {
      pixels[i] = pixels[i+shiftAmount];
    }
    updatePixels();
    Glitcher g = new Glitcher(this.img.copy());
    return g;
  }
  
  PImage pixelate() {
    return this.img;
  }
  
  PImage offset() {
    return this.img;
  }
  
  PImage stretch() {
    return this.img;
  }
  
  PImage spin() {
    return this.img;  
  }
  
  PImage channel_shift() {
    return this.img; 
  }
  
  PImage data_bend() {
    return this.img; 
  }
  
  PImage pixel_sort() {
    return this.img; 
  }
  
}