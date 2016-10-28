float radius = 1;
//The name "building_height" is a bit of legacy code; it basically determines the starting position of the projectile.
float building_height = 500;
float initial_vel = 75;
//This determines the timestep by doing time = (1/accuracy). Therefore, higher accuracy values increase accuracy.
float accuracy = 1000;
//Global variables:
float time = 0; //Start at time 0
int slope = 10; //Angle of slope down from the horizontal. slope = 0 means the flat case.
float angle = -slope; //Initial angle for iterator. If you want to test a specific angle, put this in and set...
int notloop = 0; //this variable to one. This will prevent the program from looping.

void setup() {
  size(1000,1000);
  background(255); //If you want to program to look super cool, put background(0); here and stroke(255); on line 19 (moving the other lines up).
}

void draw() {
  line(0,500,1000,500+(1000*tan(radians(slope)))); //Draws initial slope.
  time = 0;
  
  //Initial position/angle calculation:
  float vix = initial_vel*cos(radians(angle));
  float viy = initial_vel*sin(radians(angle));
  float y = -(building_height-height+(viy*time)+(.5*-9.8*pow(time,2)));
  float x = vix*time;
  
  while(y<=500+(x*tan(radians(slope)))) { //This terminates the projectile movement when it hits the slope.
    time += 1/accuracy;
    
    //Calculates next projectile position and draws it:
    y = -(building_height-height+(viy*time)+(.5*-9.8*pow(time,2)));
    x = vix*time;
    fill(angle*255/90,0,255-(angle*255/90));
    noStroke();
    ellipse(x,y,radius,radius);
  }
  
  //This prints out the final positions of the objects (in x distance travelled) and the time taken to travel this far.
  println(angle,x,time);
  //This determines the iteration. You can increase this value to decrease the total simulated angles and vice versa for decreasing this value.
  angle += 1;
  
  //This saves a picture of the final result. You'll have to remove the "/*" and "*/" for it to run.
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
