/*
 ASDF Pixel Sort
 Kim Asendorf | 2010 | kimasendorf.com
 
 sorting modes
 
 0 = black
 1 = brightness
 2 = white
 
 */
int blackValue;
int brightnessValue;
int whiteValue;
int mode = 1;

PImage img;

void setup() {
  img = loadImage("data/tokyo.png");
  // use only numbers (not variables) for the size() command, Processing 3
  size(900, 600);
  // load image onto surface - scale to the available width,height for display
  image(img, 0, 0);
}

void draw() {
  img = loadImage("data/tokyo.png");
  PixelSort p = new PixelSort(img, mode, blackValue, brightnessValue, whiteValue);
  p.ps_draw();
}

void mouseMoved() 
{
  updateParams();
}

void updateParams() 
{
  if (mode == 0) {
    blackValue = int(map(mouseX, 0, width - 1, -16777216, 0));
  } else if (mode == 1) {
    brightnessValue = int(map(mouseX, 0, width - 1, 0, 255));
  } else if (mode == 2) {
    whiteValue = int(map(mouseX, 0, width - 1, -16777216, 0));
  }
}

class PixelSort {
  int mode = 1;
  int loops = 1;

  // threshold values to determine sorting start and end pixels
  int blackValue = -16000000;
  int brightnessValue = 60;
  int whiteValue = -13000000;

  int row = 0;
  int column = 0;

  boolean saved = false;
  boolean columnDone = false;
  boolean rowDone = false;

  PImage _img;

  PixelSort(PImage psImg, int mode, int blackValue, int brightnessValue, int whiteValue) {
    this._img = psImg;
    this.mode = mode;
    this.blackValue = blackValue;
    this.brightnessValue = brightnessValue;
    this.whiteValue = whiteValue;
  }

  void ps_draw() {
    
    // loop through columns
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
    image(_img, 0, 0, width, height);

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
    _img = loadImage("data/tokyo.png");
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