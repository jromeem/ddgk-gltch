class Glitcher extends PImage {
  PImage img;
  PGraphics pg;
  
  Glitcher(PImage i) {
    this.img = i;
    this.pg = createGraphics(this.img.width, this.img.height); 
  }
  
  Glitcher shift() {
    return this.shift(int(random(width)));
  }

  Glitcher shift(float shiftAmount) {
    return this.shiftSegment(0, this.img.height, shiftAmount);
  }

  Glitcher shiftSegment(float y1, float y2, float shiftAmount) {
    y1 = constrain(y1, 0, this.img.height);
    y2 = constrain (y2, 0, this.img.height);
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    this.pg.loadPixels();
    for (int i = int(y1*this.img.width); i < int(y2*this.img.width); i+=this.img.width) {
      color[] pixelsDest = new color[this.img.width];
      arrayCopy(this.pg.pixels, i, pixelsDest, 0, this.img.width);
      for (int w = 0; w < this.img.width; w++) {
        if (shiftAmount < 0) {
          float absShiftAmount = abs(shiftAmount);
          this.pg.pixels[i+w] = pixelsDest[(w+int(absShiftAmount))%this.img.width];
        } else {
          this.pg.pixels[i+((w+int(shiftAmount))%this.img.width)] = pixelsDest[w];
        }
      }
    }
    this.pg.updatePixels();
    this.img = this.pg.copy();
    this.pg.endDraw();
    return this;
  }

  Glitcher vshiftSegment(float x1, float x2, float shiftAmount) {
    x1 = constrain(x1, 0, this.img.width);
    x2 = constrain (x2, 0, this.img.width);
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    this.pg.loadPixels();
    for (int i = int(x1); i < x2; i++) {
      // save a vertical slice of pixels
      color[] pixelsDest = new color[this.img.height];
      for (int c = 0; c < this.img.height; c++) {
        int index = c * this.img.width + i;
         pixelsDest[c] = this.pg.pixels[index];
      }
      // traversal array
      for (int j = 0; j < this.img.height; j++) {
        // shift down
        if (shiftAmount >= 0) {
          float shifter = (j+shiftAmount)%this.img.height;
          int sindex = int(shifter) * this.img.width + i;
          this.pg.pixels[sindex] = pixelsDest[j];
        // shift up
        } else {
          float absShiftAmount = abs(shiftAmount);
          this.pg.pixels[j*this.img.width+i] = pixelsDest[((j+int(absShiftAmount))%this.img.height)];
        }
      }
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