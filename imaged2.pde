PImage photo, mod;

void setup() {

  photo=loadImage("macaw.jpg");
  mod=loadImage("macaw.jpg");
  size(photo.width*2, photo.height);

  image( photo, 0, 0 );
  image( mod, photo.width, 0 );
  size(photo.width*2, photo.height);
}

void restore() {
  mod.copy(photo, 0, 0, photo.width, photo.height, 0, 0, photo.width, photo.height);
}

void mouseDragged() {
  println(mouseX+" "+mouseY);
  mod.set(mouseX, mouseY, color(255, 0, 0));
}

/* Makes everything blue */
void lighten() {
  int x, y;
  float r, g, b;
  for (x=0; x<50; x++)
    for (y=0; y<50; y++) {
      color c = mod.get(x, y);
      r = red(c) + 50;
      g = green(c) + 50;
      b = blue(c) + 50;
      mod.set(x, y, color(r, g, b));
      println( r + ", " + g + ", " + b );
    }
}

void darken() {
  int x, y;
  for (x=0; x<50; x++)
    for (y=0; y<50; y++) {
      color c = mod.get(x, y);
      float r, g, b;
      r = red(c) - 50;
      g = green(c) - 50;
      b = blue(c) - 50;
      mod.set(x, y, color(r, g, b));
      println( r + ", " + g + ", " + b );
    }
}

void blueify() {
  int x, y;
  for (x=0; x<photo.width; x++)
    for (y=0; y<photo.height; y++) {
      color c = mod.get(x, y);
      float r, g, b;
      r = red(c);
      g = green(c);
      b = blue(c);
      b=b+50;
      mod.set(x, y, color(r, g, b));
    }
}

/* Makes the blue more blue */
void blueify2() {
  int x, y;
  for (x=0; x<photo.width; x++)
    for (y=0; y<photo.height; y++) {
      color c = mod.get(x, y);
      float r, g, b;
      r = red(c);
      g = green(c);
      b = blue(c);
      if (b>100)
        b=b+20;
      mod.set(x, y, color(r, g, b));
    }
}

void keyTyped() {
  if (key=='r')
    restore();
  if (key=='b')
    blueify();
  if (key=='B')
    blueify2();
  if (key == 'd' )
    darken();
  if (key == 'l' )
    lighten();
}

void draw() {
  image(mod, 0, 0);
  image(photo, photo.width, 0);
}

