PImage orig, changed;

void setup() {

  orig=loadImage("macaw.jpg");
  changed=loadImage("macaw.jpg");
  size(orig.width*2, orig.height);

  image( orig, 0, 0 );
  image( changed, orig.width, 0 );
  size(orig.width*2, orig.height);
}


void draw() {
  image(orig, 0, 0);
  image(changed, orig.width, 0);

}

