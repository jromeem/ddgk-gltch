/*

 ASDF Pixel Sort
 Kim Asendorf | 2010 | kimasendorf.com
 [recoded in p5.js by Antonio Belluscio]

 sorting modes

 0 = black
 1 = brightness
 2 = white

 */

int mode = 0;

String imgSrcFileName = "new-york_768.jpg";
PImage imgSrc;            // source image  
color[] imgSrcPixels = []; // packed RGB of source image
color[] imgPixels = [];    // packed RGB of sorted image

// threshold values to determine sorting start and end pixels
int blackValue;
int brightnessValue;
int whiteValue;

int row = 0;
int column = 0;

int paramsDiv;


function preload() 
{
  imgSrc = loadImage( imgSrcFileName );
}


function setup() 
{

  createCanvas( imgSrc.width, imgSrc.height );
    cursor( HAND );

    // paramsDiv = createDiv('...');
    // paramsDiv.style("position", "absolute");
    // paramsDiv.style("width", "100%");
    // paramsDiv.style("bottom", 0);
    // paramsDiv.style("font-family", "Verdana");
    // paramsDiv.style("font-size", 12);
    // paramsDiv.style("color", "#fff");
    // paramsDiv.style("text-shadow", "1px 1px 0 #000");
    // paramsDiv.style("text-align", "center");

  imgSrc.loadPixels();
  for (var i = 0; i < 4*(imgSrc.width*imgSrc.height); i+=4) {
      imgSrcPixels[int(i/4)] = (255 << 24) | (imgSrc.pixels[i] << 16) | (imgSrc.pixels[i+1] << 8) | (imgSrc.pixels[i+2]);
  }
  imgSrc.updatePixels();

  loadPixels();
  
  updateParams();
}


function draw() 
{
    imgPixels = imgSrcPixels.slice();

  row = 0;
  column = 0;

  // loop through rows
  while (row < height - 1) {
    sortRow();
    row++;
  }

  // loop through columns
  while (column < width - 1) {
    sortColumn();
    column++;
  }

   var imageBytes = 4*(imgSrc.width*imgSrc.height);

    var i = 0;
  while (i < imageBytes) {
    var col = imgPixels[int(i/4)];
      pixels[i++] = col >> 16 & 255;
    pixels[i++] = col >> 8 & 255;
    pixels[i++] = col & 255;
      pixels[i++] = 255;
    }

  updatePixels();
}


function mouseClicked() 
{
  if (mode < 2) {
    ++mode;
  } else {
    mode = 0;
  }
  updateParams();
}


function mouseMoved() 
{
  updateParams();
}


function updateParams() 
{
  if (mode === 0) {
    blackValue = int(map(mouseX, 0, width - 1, -16777216, 0));
  } else if (mode == 1) {
    brightnessValue = int(map(mouseX, 0, width - 1, 0, 255));
  } else if (mode == 2) {
    whiteValue = int(map(mouseX, 0, width - 1, -16777216, 0));
  }
  
    var params = "";
  if (mode === 0) {
    params = "mode: 0 - blackValue: " + blackValue;
  } else if (mode == 1) {
    params = "mode: 1 - brightnessValue: " + brightnessValue;
  } else if (mode == 2) {
    params = "mode: 2 - whiteValue: " + whiteValue;
  }

    if (paramsDiv) {
      paramsDiv.html( params );
    }
}


function sortRow() 
{
  // current row
  var y = row;
  var iRow = y * imgSrc.width;

  // where to start sorting
  var x = 0;

  // where to stop sorting
  var xend = 0;

  while (xend < width - 1) {
    switch (mode) {
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

    if (x < 0) break;

    var sortLength = xend - x;

    var unsorted = [];
    var sorted = [];

    for (var i = 0; i < sortLength; i++) {
      unsorted[i] = imgPixels[x + i + iRow];
    }

    sorted = sort(unsorted);

    for (var i = 0; i < sortLength; i++) {
      imgPixels[x + i + iRow] = sorted[i];
    }

    x = xend + 1;
  }
}


function sortColumn() 
{
  // current column
  var x = column;

  // where to start sorting
  var y = 0;

  // where to stop sorting
  var yend = 0;

  while (yend < height - 1) {
    switch (mode) {
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

    if (y < 0) break;

    var sortLength = yend - y;

    var unsorted = [];
    var sorted = [];

    for (var i = 0; i < sortLength; i++) {
      unsorted[i] = imgPixels[x + (y + i) * imgSrc.width];
    }

    sorted = sort(unsorted);

    for (var i = 0; i < sortLength; i++) {
      imgPixels[x + (y + i) * imgSrc.width] = sorted[i];
    }

    y = yend + 1;
  }
}


// black x
function getFirstNotBlackX( x, y )
{
  var iRow = y * imgSrc.width;
  while (imgPixels[x + iRow] < blackValue) {
    x++;
    if (x >= width)
      return -1;
  }
  return x;
}


function getNextBlackX( x, y )
{
  x++;
  var iRow = y * imgSrc.width;
  while (imgPixels[x + iRow] > blackValue) {
    x++;
    if (x >= width)
      return width - 1;
  }
  return x - 1;
}


// brightness x
function getFirstBrightX( x, y )
{
  var iRow = y * imgSrc.width;
  while (brightness2(imgPixels[x + iRow]) < brightnessValue) {
    x++;
    if (x >= width)
      return -1;
  }
  return x;
}


function getNextDarkX( _x, _y )
{
  var x = _x + 1;
  var y = _y;

  var iRow = y * imgSrc.width;
  while (brightness2(imgPixels[x + iRow]) > brightnessValue) {
    x++;
    if (x >= width) return width - 1;
  }
  return x - 1;
}


// white x
function getFirstNotWhiteX( x, y )
{
  var iRow = y * imgSrc.width;
  while (imgPixels[x + iRow] > whiteValue) {
    x++;
    if (x >= width)
      return -1;
  }
  return x;
}


function getNextWhiteX( x, y )
{
  x++;
  var iRow = y * imgSrc.width;
  while (imgPixels[x + iRow] < whiteValue) {
    x++;
    if (x >= width)
      return width - 1;
  }
  return x - 1;
}


// black y
function getFirstNotBlackY( x, y )
{
  if (y < height) {
    while (imgPixels[x + y * imgSrc.width] < blackValue) {
      y++;
      if (y >= height)
        return -1;
    }
  }
  return y;
}


function getNextBlackY( x, y )
{
  y++;
  if (y < height) {
    while (imgPixels[x + y * imgSrc.width] > blackValue) {
      y++;
      if (y >= height)
        return height - 1;
    }
  }
  return y - 1;
}


// brightness y
function getFirstBrightY( x, y )
{
  if (y < height) {
    while (brightness2(imgPixels[x + y * imgSrc.width]) < brightnessValue) {
      y++;
      if (y >= height)
        return -1;
    }
  }
  return y;
}


function getNextDarkY( x, y )
{
  y++;
  if (y < height) {
    while (brightness2(imgPixels[x + y * imgSrc.width]) > brightnessValue) {
      y++;
      if (y >= height)
        return height - 1;
    }
  }
  return y - 1;
}


// white y
function getFirstNotWhiteY( x, y )
{
  if (y < height) {
    while (imgPixels[x + y * imgSrc.width] > whiteValue) {
      y++;
      if (y >= height)
        return -1;
    }
  }
  return y;
}


function getNextWhiteY( x, y )
{
  y++;
  if (y < height) {
    while (imgPixels[x + y * imgSrc.width] < whiteValue) {
      y++;
      if (y >= height)
        return height - 1;
    }
  }
  return y - 1;
}


function brightness2( col ) {
  return ( ((col >> 16) & 255) + ((col >> 8) & 255) + (col & 255) ) / 3;
}