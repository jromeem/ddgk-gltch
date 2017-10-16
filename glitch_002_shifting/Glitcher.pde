class Glitcher extends PImage {
  PImage img;
  PGraphics pg;
  
  Glitcher(PImage i) {
    this.img = i;
    this.pg = createGraphics(this.img.width, this.img.height); 
  }
  
  Glitcher shift(int shiftAmount) {
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    this.pg.loadPixels();
    for (int i = 0; i < this.img.width*this.img.height; i+=this.img.width) {
      color[] pixelsDest = new color[this.img.width];
      arrayCopy(this.pg.pixels, i, pixelsDest, 0, this.img.width);
      for (int w = 0; w < this.img.width; w++) {
        if (shiftAmount < 0) {
          int absShiftAmount = abs(shiftAmount);
          this.pg.pixels[i+w] = pixelsDest[(w+absShiftAmount)%this.img.width];
        } else {
          this.pg.pixels[i+((w+shiftAmount)%this.img.width)] = pixelsDest[w]; 
        }
      }
    }
    this.pg.updatePixels();
    this.img = this.pg.copy();
    this.pg.endDraw();
    return this;
  }
  
  Glitcher shift() {
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    int randomShiftAmount = int(random(0, this.img.width));
    this.pg.loadPixels();
    for (int i = 0; i < this.img.width*this.img.height-randomShiftAmount; i++) {
      this.pg.pixels[i] = this.pg.pixels[i+randomShiftAmount];
    }
    this.pg.updatePixels();
    this.img = this.pg.copy();
    this.pg.endDraw();
    return this;
  }

  Glitcher vshift() {
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    int randomShiftAmount = int(random(0, this.img.width));
    this.pg.loadPixels();
    for (int i = 0; i < this.img.width*this.img.height - randomShiftAmount*this.img.width; i++) {
      this.pg.pixels[i] = this.pg.pixels[(i+randomShiftAmount*this.img.width)];
    }
    this.pg.updatePixels();
    this.img = this.pg.copy();
    this.pg.endDraw();
    return this;
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

void image(Glitcher g, float a, float b) {
  image(g.img, a, b); 
}

void image(Glitcher g, float a, float b, float c, float d) {
  image(g.img, a, b, c, d); 
}