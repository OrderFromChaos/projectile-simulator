PImage img;

//Editable values:

int targetR = 127;
int targetG = 136;
int targetB = 141;
int tolerances = 22;
//set this to 1 at the lowest

color highlight = color(255,0,204);
//255,102,204 is a pink highlight
//255,0,204 is a neon pink highlight
//57,255,20 is neon green
color blackout = color(0);
//this sets the color of the non-monolayer area


//this speeds up the code slightly
int rl = targetR-tolerances;
int ru = targetR+tolerances;
int gl = targetG-tolerances;
int gu = targetG+tolerances;
int bl = targetB-tolerances;
int bu = targetB+tolerances;


void setup() {
  img = loadImage("cloud lion.jpg");
  surface.setSize(img.width, img.height);
  //this class Z(setSize) may be causing some lag
  noLoop();
}

void draw() {
  image(img, 0, 0);
  
  loadPixels();
  for(int i = 0; i < width*height; i++) {
    color cupix = pixels[i];
    //cupix meaning "current pixel"
    
    //int a = (cupix >> 24) & 0xFF;
    int r = (cupix >> 16) & 0xFF;
    int g = (cupix >> 8) & 0xFF;
    int b = cupix & 0xFF;
    
    if((rl<r) && (r<ru) && (gl<g) && (g<gu) && (bl<b) && (b<bu)) {
      pixels[i] = highlight;
    } else {
      pixels[i] = blackout;
    }
  }
  updatePixels();
  saveFrame("postanalysis###.jpg");
}
