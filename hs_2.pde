PImage photo,mod;
void setup(){

  photo=loadImage("mccaw.jpg");
  mod=loadImage("mccaw.jpg");
  mod.copy(photo,0,0,photo.width,photo.height,0,0,photo.width,photo.height);
  size(photo.width*2,photo.height);
  

}

void restore() {
  mod.copy(photo,0,0,photo.width,photo.height,0,0,photo.width,photo.height);
}

void mouseDragged(){
  println(mouseX+" "+mouseY);
  mod.set(mouseX,mouseY,color(255,0,0));

}
/* Makes everything blue */
void blueify(){
  int x,y;
  for (x=0;x<photo.width;x++)
    for (y=0;y<photo.height;y++){
      color c = mod.get(x,y);
      float r,g,b;
      r = red(c);
      g = green(c);
      b = blue(c);
      b=b+50;
      mod.set(x,y,color(r,g,b));
    }
}


/* Makes the blue more blue */
void blueify2(){
  int x,y;
  for (x=0;x<photo.width;x++)
    for (y=0;y<photo.height;y++){
      color c = mod.get(x,y);
      float r,g,b;
      r = red(c);
      g = green(c);
      b = blue(c);
      if (b>100)
        b=b+20;
      mod.set(x,y,color(r,g,b));
    }
}

void keyTyped() {
  if (key=='r')
    restore();
  if (key=='b')
    blueify();
  if (key=='B')
    blueify2();
  
}

void draw() {
  image(mod,0,0);
  image(photo,photo.width,0);
}


