class Glitcher extends PImage {
  PImage img;
  PImage imgImmutable;
  PGraphics pg;
  
  Glitcher(PImage i) {
    this.img = i;
    this.pg = createGraphics(this.img.width, this.img.height);

    // make a immutable copy
    PGraphics pg2 = createGraphics(this.img.width, this.img.height);
    pg2.beginDraw();
    pg2.image(this.img, 0, 0);
    this.imgImmutable = pg2.copy();
    pg2.endDraw();
  }

  Glitcher(Grapher g) {
    this.img = g.img;
    this.pg = createGraphics(this.img.width, this.img.height); 
   
    // make a immutable copy
    PGraphics pg2 = createGraphics(this.img.width, this.img.height);
    pg2.beginDraw();
    pg2.image(this.img, 0, 0);
    this.imgImmutable = pg2.copy();
    pg2.endDraw();
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
  
  PImage pixelate() {
    return this.pixelate(0, 0, this.img.width, this.img.height, int(random(10, 80)));
  }

  PImage pixelate(float pixelAmount) {
    return this.pixelate(0, 0, this.img.width, this.img.height, int(pixelAmount)); 
  }
  
  PImage pixelate(float xOffset, float yOffset, float w, float h, float pixelAmount) {
   return this.pixelate(int(xOffset), int(yOffset), int(w), int(h), int(pixelAmount)); 
  }
  
  PImage pixelate(int xOffset, int yOffset, int w, int h, int pixelAmount) {
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    if (pixelAmount <= 0) {
      this.img = this.pg.copy();
      return this;
    }
    this.pg.loadPixels();    
    for (int j = 0; j < this.img.width*h; j+=this.img.width*pixelAmount) {
      for (int i = 0; i < w; i+=pixelAmount) {
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
        int px = (i+j)%this.img.width + xOffset;
        int py = j/this.img.width + yOffset;
        this.pg.rect(px, py, pixelAmount, pixelAmount);
      }
    }
    this.img = this.pg.copy();
    this.pg.endDraw();
    return this;
  }
  
  PImage offset(int x, int y, int w, int h, int randAmount) {
    PGraphics pgg = createGraphics(this.img.width, this.img.height);
    pgg.beginDraw();
    pgg.image(this.img, 0, 0);
    int rAmount = int(random(-randAmount, randAmount));
    pgg.copy(this.imgImmutable,x,y,w,h,x+rAmount,y+rAmount,w,h);
    this.img = pgg.copy();
    pgg.endDraw();
    
    this.pg = pgg;
    this.pg.beginDraw();
    this.pg.image(this.img, 0, 0);
    this.pg.endDraw();
    
    return this;
  }
  
  PImage stretch() {
    return this.img;
  }
  
  PImage spin() {
    return this.img;  
  }
  
  PImage data_bend() {
    return this.img; 
  }
  
  PImage pixelSort(int mode, float threshold) {
    PixelSort p = new PixelSort(this.img, mode, threshold);
    this.pg.beginDraw();
    this.pg.image(p.ps_draw(), 0, 0);
    this.pg.endDraw();
    this.img = this.pg;
    return this; 
  }

  PImage redChannelShift(int vamount, int hamount) {
    ChannelShift cs = new ChannelShift(this.img, 0, 0, vamount, hamount);
    this.pg.beginDraw();
    this.pg.image(cs.display(), 0, 0);
    this.pg.endDraw();
    this.img = this.pg;
    return this;
  }

  PImage greenChannelShift(int vamount, int hamount) {
    ChannelShift cs = new ChannelShift(this.img, 1, 1, vamount, hamount);
    this.pg.beginDraw();
    this.pg.image(cs.display(), 0, 0);
    this.pg.endDraw();
    this.img = this.pg;
    return this;
  }

  PImage blueChannelShift(int vamount, int hamount) {
    ChannelShift cs = new ChannelShift(this.img, 2, 2, vamount, hamount);
    this.pg.beginDraw();
    this.pg.image(cs.display(), 0, 0);
    this.pg.endDraw();
    this.img = this.pg;
    return this;
  }
}

class ChannelShift {
  /*
   Channel Shift Image Glitching Processing v1.1
   datamoshing.com | 2016
  */
  PImage sourceImg;
  PImage targetImg;

  PImage _img;
  PGraphics pgg;
  PImage imgImmutable;

  boolean shiftVertically;
  boolean shiftHorizontally;

  int sourceChannel;
  int targetChannel;
  int verticalShift;
  int horizontalShift;

  ChannelShift (PImage csImage, int sChannel, int tChannel, int shiftVertAmount, int shiftHoriAmount) {
    this._img = csImage;

    this.pgg = createGraphics(this._img.width, this._img.height);
    // make a immutable copy
    PGraphics pg2 = createGraphics(this._img.width, this._img.height);
    pg2.beginDraw();
    pg2.image(this._img, 0, 0);
    this.imgImmutable = pg2.copy();
    pg2.endDraw();

    this.sourceImg = this._img;
    this.targetImg = this._img;

    this.sourceImg.loadPixels();
    this.targetImg.loadPixels();

    this.sourceChannel = constrain(sChannel, 0, 2);
    this.targetChannel = constrain(tChannel, 0, 2);
    
    this.verticalShift = shiftVertAmount;
    this.horizontalShift = shiftHoriAmount;
  }

  PImage display() {
    this.pgg.beginDraw();
    // load pixels
    this.sourceImg.loadPixels();
    this.targetImg.loadPixels();
    // shift the channel
    copyChannel(this.sourceImg.pixels, this.targetImg.pixels, this.verticalShift, this.horizontalShift, this.sourceChannel, this.targetChannel);
    // update the target pixels
    this.targetImg.updatePixels();
    this.pgg.image(this.targetImg, 0, 0);
    // load updated image onto surface
    this.pgg.endDraw();
    return this.pgg;
  }

  void copyChannel(color[] sourcePixels, color[] targetPixels, int sourceY, int sourceX, int sourceChannel, int targetChannel)
  {
    if (this.verticalShift < 0) {
      this.verticalShift = this.targetImg.height + this.verticalShift;
    }
    if (this.horizontalShift < 0) {
      this.horizontalShift = this.targetImg.width + this.horizontalShift;
    }
    // starting at the sourceY and pointerY loop through the rows
    for(int y = 0; y < this.targetImg.height; y++)
    {   
        // add y counter to sourceY
        int sourceYOffset = this.verticalShift + y;
        
        // wrap around the top of the image if we've hit the bottom
        if(sourceYOffset >= this.targetImg.height)
          sourceYOffset -= this.targetImg.height;

        // starting at the sourceX and pointerX loop through the pixels in this row
        for(int x = 0; x < this.targetImg.width; x++) {
          // add x counter to sourceX
          int sourceXOffset = this.horizontalShift + x;
          
          // wrap around the left side of the image if we've hit the right side
          if(sourceXOffset >= this.targetImg.width)
            sourceXOffset -= this.targetImg.width;

          // get the color of the source pixel
          color sourcePixel = sourcePixels[sourceYOffset * this.targetImg.width + sourceXOffset];
          
          // get the RGB values of the source pixel
          float sourceRed = red(sourcePixel);
          float sourceGreen = green(sourcePixel);
          float sourceBlue = blue(sourcePixel);

          // get the color of the target pixel
          color targetPixel = targetPixels[y * this.targetImg.width + x]; 

          // get the RGB of the target pixel
          // two of the RGB channel values are required to create the new target color
          // the new target color is two of the target RGB channel values and one RGB channel value from the source
          float targetRed = red(targetPixel);
          float targetGreen = green(targetPixel);
          float targetBlue = blue(targetPixel);
          
          // create a variable to hold the new source RGB channel value
          float sourceChannelValue = 0;
          
          // assigned the source channel value based on sourceChannel random number passed in
          switch(this.sourceChannel)
          {
            case 0:
              // use red channel from source
              sourceChannelValue = sourceRed;
              break;
            case 1:
              // use green channel from source
              sourceChannelValue = sourceGreen;
              break;
            case 2:
              // use blue channel from source
              sourceChannelValue = sourceBlue;
              break;
          }
          
          // assigned the source channel value to a target channel based on targetChannel random number passed in
          switch(this.targetChannel)
          {
            case 0:
              // assign source channel value to target red channel
              targetPixels[y * this.targetImg.width + x] =  color(sourceChannelValue, targetGreen, targetBlue);
              break;
            case 1:
              // assign source channel value to target green channel
              targetPixels[y * this.targetImg.width + x] =  color(targetRed, sourceChannelValue, targetBlue);
              break;
            case 2:
              // assign source channel value to target blue channel
              targetPixels[y * this.targetImg.width + x] =  color(targetRed, targetGreen, sourceChannelValue);
              break;
          }
        }
      }
    }
  }

class PixelSort {
  /*
   ASDF Pixel Sort
   Kim Asendorf | 2010 | kimasendorf.com
   Sorting modes:
   0 = black
   1 = brightness
   2 = white
  */
  int mode = 1;
  float thresholdValue;
  
  int loops = 1;

  // threshold values to determine sorting start and end pixels
  float blackValue = -16000000;
  float brightnessValue = 60;
  float whiteValue = -13000000;

  int row = 0;
  int column = 0;

  boolean saved = false;
  boolean columnDone = false;
  boolean rowDone = false;

  PImage _img;
  PGraphics pgg;
  PImage imgImmutable;

  PixelSort(PImage psImg, int mode, float thresholdValue) {
    this._img = psImg;
    this.mode = mode;
    
    // map the values based on the mode
    if (this.mode == 0) {
      this.thresholdValue = map(thresholdValue, 0, 1000, 0, -16000000);
    } else if (this.mode == 1) {
      this.thresholdValue = map(thresholdValue, 0, 1000, 255, 0);
    } else if (this.mode == 2) {
      this.thresholdValue = map(thresholdValue, 0, 1000, -16000000, 0);
    } else {
      this.mode = 0;
      this.thresholdValue = 1000;
    }

    // set the values to the threshold value
    this.blackValue = this.thresholdValue;
    this.brightnessValue = this.thresholdValue;
    this.whiteValue = this.thresholdValue;

    this.pgg = createGraphics(_img.width, _img.height);
    // make a immutable copy
    PGraphics pg2 = createGraphics(this._img.width, this._img.height);
    pg2.beginDraw();
    pg2.image(this._img, 0, 0);
    this.imgImmutable = pg2.copy();
    pg2.endDraw();
  }

  PGraphics ps_draw() {
    // loop through columns
    pgg.beginDraw();
    while(column < _img.width-1) {
      _img.loadPixels(); 
      sortColumn();
      column++;
      _img.updatePixels();
    }
    // loop through rows
    while(row < _img.height-1) {
      _img.loadPixels(); 
      sortRow();
      row++;
      _img.updatePixels();
    }
    // load updated image onto surface and scale to fit the display width,height
    pgg.image(_img, 0, 0, width, height);
    if (column >= _img.width-1) {
      columnDone = true;
    }
    if (row >= _img.height-1) {
      rowDone = true;
    }
    if (columnDone && rowDone) {
      column = 0;
      row = 0;
      columnDone = false;
      rowDone = false;
    }
    _img = imgImmutable;

    pgg.endDraw();
    return pgg;
  }

  void sortRow() {
    // current row
    int y = row;
    // where to start sorting
    int x = 0;
    // where to stop sorting
    int xend = 0;
    while(xend < _img.width-1) {
      switch(mode) {
        case 0:
          x = getFirstNotBlackX(x, y);
          xend = getNextBlackX(x, y);
          break;
        case 1:
          x = getFirstBrightX(x, y);
          xend = getNextDarkX(x, y);
          break;
        case 2:
          x = getFirstNotWhiteX(x, y);
          xend = getNextWhiteX(x, y);
          break;
        default:
          break;
      }
      if(x < 0) break;
      int sortLength = xend-x;
      color[] unsorted = new color[sortLength];
      color[] sorted = new color[sortLength];
      for(int i=0; i<sortLength; i++) {
        unsorted[i] = _img.pixels[x + i + y * _img.width];
      }
      sorted = sort(unsorted);
      for(int i=0; i<sortLength; i++) {
        _img.pixels[x + i + y * _img.width] = sorted[i];      
      }
      x = xend+1;
    }
  }

  void sortColumn() {
    // current column
    int x = column;
    // where to start sorting
    int y = 0;
    // where to stop sorting
    int yend = 0;
    while(yend < _img.height-1) {
      switch(mode) {
        case 0:
          y = getFirstNotBlackY(x, y);
          yend = getNextBlackY(x, y);
          break;
        case 1:
          y = getFirstBrightY(x, y);
          yend = getNextDarkY(x, y);
          break;
        case 2:
          y = getFirstNotWhiteY(x, y);
          yend = getNextWhiteY(x, y);
          break;
        default:
          break;
      }
      if(y < 0) break;
      int sortLength = yend-y;
      color[] unsorted = new color[sortLength];
      color[] sorted = new color[sortLength];
      for(int i=0; i<sortLength; i++) {
        unsorted[i] = _img.pixels[x + (y+i) * _img.width];
      }
      sorted = sort(unsorted);
      for(int i=0; i<sortLength; i++) {
        _img.pixels[x + (y+i) * _img.width] = sorted[i];
      }
      y = yend+1;
    }
  }


  // black x
  int getFirstNotBlackX(int x, int y) {
    while(_img.pixels[x + y * _img.width] < blackValue) {
      x++;
      if(x >= _img.width) 
        return -1;
    }
    return x;
  }

  int getNextBlackX(int x, int y) {
    x++;
    while(_img.pixels[x + y * _img.width] > blackValue) {
      x++;
      if(x >= _img.width) 
        return _img.width-1;
    }
    return x-1;
  }

  // brightness x
  int getFirstBrightX(int x, int y) {
    while(brightness(_img.pixels[x + y * _img.width]) < brightnessValue) {
      x++;
      if(x >= _img.width)
        return -1;
    }
    return x;
  }

  int getNextDarkX(int _x, int _y) {
    int x = _x+1;
    int y = _y;
    while(brightness(_img.pixels[x + y * _img.width]) > brightnessValue) {
      x++;
      if(x >= _img.width) return _img.width-1;
    }
    return x-1;
  }

  // white x
  int getFirstNotWhiteX(int x, int y) {
    while(_img.pixels[x + y * _img.width] > whiteValue) {
      x++;
      if(x >= _img.width) 
        return -1;
    }
    return x;
  }

  int getNextWhiteX(int x, int y) {
    x++;
    while(_img.pixels[x + y * _img.width] < whiteValue) {
      x++;
      if(x >= _img.width) 
        return _img.width-1;
    }
    return x-1;
  }

  // black y
  int getFirstNotBlackY(int x, int y) {
    if(y < _img.height) {
      while(_img.pixels[x + y * _img.width] < blackValue) {
        y++;
        if(y >= _img.height)
          return -1;
      }
    }
    return y;
  }

  int getNextBlackY(int x, int y) {
    y++;
    if(y < _img.height) {
      while(_img.pixels[x + y * _img.width] > blackValue) {
        y++;
        if(y >= _img.height)
          return _img.height-1;
      }
    }
    return y-1;
  }

  // brightness y
  int getFirstBrightY(int x, int y) {
    if(y < _img.height) {
      while(brightness(_img.pixels[x + y * _img.width]) < brightnessValue) {
        y++;
        if(y >= _img.height)
          return -1;
      }
    }
    return y;
  }

  int getNextDarkY(int x, int y) {
    y++;
    if(y < _img.height) {
      while(brightness(_img.pixels[x + y * _img.width]) > brightnessValue) {
        y++;
        if(y >= _img.height)
          return _img.height-1;
      }
    }
    return y-1;
  }

  // white y
  int getFirstNotWhiteY(int x, int y) {
    if(y < _img.height) {
      while(_img.pixels[x + y * _img.width] > whiteValue) {
        y++;
        if(y >= _img.height)
          return -1;
      }
    } 
    return y;
  }

  int getNextWhiteY(int x, int y) {
    y++;
    if(y < _img.height) {
      while(_img.pixels[x + y * _img.width] < whiteValue) {
        y++;
        if(y >= _img.height) 
          return _img.height-1;
      }
    }
    return y-1;
  }
}



// keyboard interactions
void keyPressed() {
  if (key == 'g' || key == 'G') {
    clear();
    setup();
  }
  if (key == ' ') {
    saveFrame("GLITCH-####.png");
  }
}

// overloading image() methods
void image(Glitcher g, float a, float b) {
  image(g.img, a, b); 
}

void image(Glitcher g, float a, float b, float c, float d) {
  image(g.img, a, b, c, d); 
}