/*

Hello to whomever may be seeing this!
The image is already in place so you should be able to run the code. Feel free to edit values to make it fit what you want.
The program takes roughly 1 second to run. You may have to click on the active window at the end to make it render.

The image input and output are stored in Documents/Processing/Monolayer_Highlighter.

*/


PImage img;

//Editable values:
int targetR = 127;
int targetG = 136;
int targetB = 141;
//for presentation: (127,136,141)
//for flakes: (86,126,102)
int tolerances = 22;
//set this to 1 at the lowest
color highlight = color(255,0,204);
//255,102,204 is a pink highlight
//255,0,204 is a neon pink highlight
//57,255,20 is neon green
color blackout = color(0);
//this sets the color of the non-monolayer area


//this speeds up the code *slightly*
int rl = targetR-tolerances;
int ru = targetR+tolerances;
int gl = targetG-tolerances;
int gu = targetG+tolerances;
int bl = targetB-tolerances;
int bu = targetB+tolerances;


void setup() {
  img = loadImage("cloud lion.jpg");
  surface.setSize(img.width, img.height);
  //this class Z(setSize) may be causing some lag as well
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
      //other means of figuring out whether a pixel fits a certain range?? doing "areas" of pixels?
      //one means: compress image, analyze color, analyze again but only target locations found to be not_substrate
      //PGraphics optimization??
      //running in parallel??
      pixels[i] = highlight;
    } else {
      pixels[i] = blackout;
    }
  }
  updatePixels();
  saveFrame("postanalysis###.jpg");
  
  /*
  if(rl<260) {
    rl = rl+10;
    ru = ru+10;
    gl = gl+10;
    gu = gu+10;
    bl = bl+10;
    bu = bu+10;
  } else {
    stop();
  }
  */
  
  
  stop();
  
  /*
  if(targetR<255) {
    rl = rl+10;
    ru = ru+10;
  } else {
    stop();
  }
  */
}