class Grapher extends PImage {
  PImage img;
  PImage imgImmutable;
  PGraphics pg;
  
  Grapher(PImage i) {
    this.img = i;
    this.pg = createGraphics(this.img.width, this.img.height); 
   
    // make a immutable copy
    PGraphics pg2 = createGraphics(this.img.width, this.img.height);
    pg2.beginDraw();
    pg2.image(this.img, 0, 0);
    this.imgImmutable = pg2.copy();
    pg2.endDraw();
  }

  void repeatImage() {

  }

  Grapher drawGrid(float stepSize, color c) {
    this.drawRows(stepSize, c);
    this.drawColumns(stepSize, c);
    return this;
  }

  Grapher drawRows(float rowWidth, color c) {
    this.pg.beginDraw();
    this.pg.stroke(c);
    for (int i = 0; i < this.pg.height; i+=rowWidth) {
      this.pg.line(0, i, this.pg.width, i);
    }
    this.pg.endDraw();
    return this;
  }

  Grapher drawColumns(float columnWidth, color c) {
    this.pg.beginDraw();
    this.pg.stroke(c);
    for (int i = 0; i < this.pg.width; i+=columnWidth) {
      this.pg.line(i, 0, i, this.pg.height);
    }
    this.pg.endDraw();
    return this;
  }

  Grapher halftone(float stepSize, color cc) {
    PGraphics imgpg = createGraphics(this.img.width, this.img.height);
    imgpg.beginDraw();
    imgpg.image(this.img, 0, 0);
    imgpg.loadPixels();
    this.pg.beginDraw();
    this.pg.noStroke();
    this.pg.fill(cc);
    int stepOffset = 1;
    float offset = stepSize;
    for (int i = 0; i < this.img.width*this.img.height; i+=this.img.width*(offset*1.5)) {
      for (int j = 0; j < this.img.width; j+=offset) {
        float brightVal = brightness(imgpg.pixels[i+j]);
        float ellispeSize = map(brightVal, 0, 255, 0, offset);
        float xLoc = (i+j) % this.img.width;
        float yLoc = i / this.img.width;
        this.pg.ellipse(xLoc, yLoc, ellispeSize, ellispeSize);
      }
      stepOffset*=-1;
    }

    this.pg.endDraw();
    imgpg.endDraw();

    return this;
  }

}

// overloading image() methods
void image(Grapher g, float a, float b) {
  image(g.pg, a, b); 
}

void image(Grapher g, float a, float b, float c, float d) {
  image(g.pg, a, b, c, d); 
}