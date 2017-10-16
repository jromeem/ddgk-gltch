class Glitcher {
  PImage img;
  
  Glitcher(PImage i) {
    this.img = i;
  }
  
  Glitcher shift(int shiftAmount) {
    image(this.img, 0, 0);
    loadPixels();
    for (int i = 0; i < width*height-shiftAmount; i++) {
      pixels[i] = pixels[i+shiftAmount];
    }
    updatePixels();
    Glitcher g = new Glitcher(copy());
    return g;
  }
  
  Glitcher shift() {
    image(this.img, 0, 0);
    int randomShiftAmount = int(random(0, width));
    loadPixels();
    for (int i = 0; i < width*height-randomShiftAmount; i++) {
      pixels[i] = pixels[i+randomShiftAmount];
    }
    updatePixels();
    Glitcher g = new Glitcher(copy());
    return g;
  }

  Glitcher vshift() {
    image(this.img, 0, 0);
    int randomShiftAmount = int(random(0, width));
    loadPixels();
    for (int i = 0; i < width*height - randomShiftAmount*width; i++) {
      pixels[i] = pixels[(i+randomShiftAmount*width)];
    }
    updatePixels();
    Glitcher g = new Glitcher(copy());
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