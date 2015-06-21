PImage img;
int chunkSize;

void setup() {
   img = loadImage("input.jpg");
   size(img.width, img.height);
   colorMode(RGB, 100);
   chunkSize = 10;
   img.loadPixels();
   loadPixels();
   noStroke();
   noLoop();
   background(0);
}

void draw() {    
  
   for (int y = 0; y < height; y += chunkSize)
   {
       for (int x = 0; x < width; x += chunkSize)
       {
           drawTriangles(x,y);
       }
   }

  saveFrame("line-######.png");
  
}

void drawTriangles(int xOrigin, int yOrigin)
{
  color top = getAverageColourTop(xOrigin, yOrigin);
  color bottom = getAverageColourBottom(xOrigin, yOrigin);
  
  //Top is X origin, x origin + chunk size, y origin + chunk size
  fill(top);
  triangle(xOrigin,yOrigin, xOrigin+chunkSize+1,yOrigin, xOrigin,yOrigin + chunkSize);
  
  fill(bottom);
  triangle(xOrigin+chunkSize,yOrigin, xOrigin+chunkSize, yOrigin+chunkSize, xOrigin-1, yOrigin+chunkSize);
}

color getAverageColourTop(int xOrigin, int yOrigin)
{
  float r = 0;
  float g = 0;
  float b = 0;
  float counter = 0;
  
  float xReduce = 1;
  
  for(int y = 0; y < chunkSize; y++)
  {
      for(int x = 0; x < chunkSize - xReduce; x++)
      {
        counter++;
        color c = img.pixels[(xOrigin + x) + ((yOrigin + y) * width)];
        r += red(c);
        g += green(c);
        b += blue(c);
      }
      
   xReduce++;
  }

  r = r/counter;
  g = g/counter;
  b = b/counter;
  return color(r,g,b);
}

color  getAverageColourBottom(int xOrigin, int yOrigin)
{
  float r = 0;
  float g = 0;
  float b = 0;
  float counter = 0;
  
  float xReduce = 0;
  
  for(int y = 0; y < chunkSize; y++)
  {
      for(int x = chunkSize; x >= chunkSize - xReduce; x--)
      {
        counter++;
        color c = img.pixels[(xOrigin + x) + ((yOrigin + y) * width)-1];
        r += red(c);
        g += green(c);
        b += blue(c);
      }
      
      xReduce++;  
  }

  r = r/counter;
  g = g/counter;
  b = b/counter;
  return color(r,g,b);
}
