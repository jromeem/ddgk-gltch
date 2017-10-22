class Glitcher extends PImage {
  PImage img;
  PGraphics pg;
  
  Glitcher(PImage i) {
    this.img = i;
    this.pg = createGraphics(this.img.width, this.img.height); 
  }
  
  // overriding method from PImage
  void resize(int w, int h) {
    this.pg = createGraphics(w, h);
    this.pg.beginDraw();
    this.img.resize(w, h);
    this.pg.image(this.img, 0, 0);
    this.img = this.pg.copy();
    this.pg.endDraw(); 
  }
  
  // defer PImage methods -- get PImage first then use PImage methods
  PImage getPImage() {
    return this.img; 
  }
  
  Glitcher shift() {
    return this.shift(int(random(this.img.width)));
  }

  Glitcher shift(float shiftAmount) {
    return this.shiftSegment(0, this.img.height, int(shiftAmount));
  }

  Glitcher shift(int shiftAmount) {
    return this.shiftSegment(0, this.img.height, shiftAmount);
  }

  Glitcher shiftSegment() {
    int y1 = int(random(this.img.height));
    int y2 = int(random(this.img.height));
    int randShiftAmount = int(random(this.img.width));
    int minY = min(y1, y2);
    int maxY = max(y1, y2);
    return this.shiftSegment(minY, maxY, randShiftAmount);
  }

  Glitcher shiftSegment(float y1, float y2, float shiftAmount) {
    return this.shiftSegment(int(y1), int(y2), int(shiftAmount));
  }

  Glitcher shiftSegment(int y1, int y2, int shiftAmount) {
    y1 = constrain(y1, 0, this.img.height);
    y2 = constrain (y2, 0, this.img.height);
    shiftAmount = int(shiftAmount);
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    this.pg.loadPixels();
    for (int i = y1*this.img.width; i < y2*this.img.width; i+=this.img.width) {
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

  Glitcher vshift() {
    return this.vshiftSegment(0, this.img.width, int(random(this.img.height)));
  }

  Glitcher vshift(float shiftAmount) {
    return this.vshiftSegment(0, this.img.width, int(shiftAmount));
  }

  Glitcher vshift(int shiftAmount) {
    return this.vshiftSegment(0, this.img.width, shiftAmount);
  }

  Glitcher vshiftSegment() {
    int x1 = int(random(this.img.width));
    int x2 = int(random(this.img.width));
    int randShiftAmount = int(random(this.img.height));
    int minX = min(x1, x2);
    int maxX = max(x1, x2);
    return this.vshiftSegment(minX, maxX, randShiftAmount);
  }

  Glitcher vshiftSegment(float x1, float x2, float shiftAmount) {
    return this.vshiftSegment(int(x1), int(x2), int(shiftAmount));
  }

  Glitcher vshiftSegment(int x1, int x2, int shiftAmount) {
    x1 = constrain(x1, 0, this.img.width);
    x2 = constrain (x2, 0, this.img.width);
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    this.pg.loadPixels();
    for (int i = x1; i < x2; i++) {
      color[] pixelsDest = new color[this.img.height];
      for (int c = 0; c < this.img.height; c++) {
        int index = c * this.img.width + i;
        pixelsDest[c] = this.pg.pixels[index];
      }
      for (int j = 0; j < this.img.height; j++) {
        if (shiftAmount >= 0) {
          int shifter = (j+shiftAmount)%this.img.height;
          int sindex = shifter * this.img.width + i;
          this.pg.pixels[sindex] = pixelsDest[j];
        } else {
          int absShiftAmount = abs(shiftAmount);
          this.pg.pixels[j*this.img.width+i] = pixelsDest[((j+absShiftAmount)%this.img.height)];
        }
      }
    }
    this.pg.updatePixels();
    this.img = this.pg.copy();
    this.pg.endDraw();
    return this;
  }
  
  PImage pixelate(float pixelAmount) {
    return this.pixelate(0, 0, this.img.width, this.img.height, int(pixelAmount)); 
  }
  
  //PImage pixelate(float xOffset, float yOffset, float w, float h, float pixelAmount) {
  //  return this.pixelate(int(xOffset), int(yOffset), int(w), int(h), int(pixelAmount)); 
  //}
  
  PImage pixelate(int xOffset, int yOffset, int w, int h, int pixelAmount) {
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    if (pixelAmount <= 0) {
      this.img = this.pg.copy();
      return this;
    }
    this.pg.loadPixels();    
    for (int j = 0+yOffset*this.img.width; j < this.img.width*h; j+=this.img.width*pixelAmount) {
      for (int i = 0+xOffset; i < w; i+=pixelAmount) {
        // find pixel average
        int collectionTotal = int(pixelAmount*pixelAmount);
        float totalR, totalG, totalB;
        totalR = totalG = totalB = 0;
        for (int m = 0; m < pixelAmount*this.img.width; m+=this.img.width) {
          for (int p = 0; p < pixelAmount; p++) {
            color c = this.pg.pixels[min(p+m + i+j, this.pg.pixels.length-1)];
            totalR += red(c);
            totalG += green(c);
            totalB += blue(c);
          }
        }
        float thisR = totalR / collectionTotal;
        float thisG = totalG / collectionTotal;
        float thisB = totalB / collectionTotal;
        color newColor = color(thisR, thisG, thisB);
        this.pg.fill(newColor);
        this.pg.noStroke();
        
        // draw new pixel rect
        int px = (i+j)%this.img.width;
        int py = j/this.img.width;
        this.pg.rect(px, py, pixelAmount, pixelAmount);
      }
    }
    this.img = this.pg.copy();
    this.pg.endDraw();
    return this;
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

// keyboard interactions
void keyPressed() {
  if (key == 'g' || key == 'G') {
    clear();
    setup();
  }
}

// overloading image() methods
void image(Glitcher g, float a, float b) {
  image(g.img, a, b); 
}

void image(Glitcher g, float a, float b, float c, float d) {
  image(g.img, a, b, c, d); 
}