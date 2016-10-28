float radius = 1;
float building_height = 500;
//float angle = 45; //(from horizontal)
float initial_vel = 75;
float accuracy = 1000;
//Calculated values:
float time = 0;
int slope = 10;
int a = 0;
float angle = -slope;
int notloop = 0;

void setup() {
  size(1000,1000);
  background(255);
}

void draw() {
  line(0,500,1000,500+(1000*tan(radians(slope))));
  //Line final could be variant on angle, giving us a starting thing
  time = 0;
  
  float vix = initial_vel*cos(radians(angle));
  float viy = initial_vel*sin(radians(angle));
  float y = -(building_height-height+(viy*time)+(.5*-9.8*pow(time,2)));
  float x = vix*time;
  
  while(y<=500+(x*tan(radians(slope)))) {
    time += 1/accuracy;
    y = -(building_height-height+(viy*time)+(.5*-9.8*pow(time,2)));
    x = vix*time;
    fill(angle*255/90,0,255-(angle*255/90));
    noStroke();
    ellipse(x,y,radius,radius);
  }
    
  println(angle,x,time);
  angle += 1;
  
  if((angle > 90) || (angle<= -slope)) {
    /*
    for(int i = -30; i<60; i+=5) {
      stroke(1);
      fill(0);
      line(0,500,1000,500+(1000*tan(radians(i))));
    }
    saveFrame();
    */
    noLoop();
  }

  
  if(notloop == 1) {
    noLoop();
  }
  
}
