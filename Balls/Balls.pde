Ball[] balls;
int ballcount = 10;
PVector grav;
int delay;

void setup() {
  size(800, 600);
  grav = new PVector(0, 20);
  balls = new Ball[ballcount];
  for (int i = 0; i < ballcount; i++) {
    PVector loc = new PVector(random(width), random(50));
    PVector vel = new PVector(random(5) - 2.5, random(5) - 2.5);
    balls[i] = new Ball(loc, vel);
  }
  delay = 100;
  
}

void draw() {
  
  PVector direction = grav.copy().setMag(50);
  PVector centre = new PVector(width/2, height/2);
  
  direction.sub(centre);
  line(width/2, height/2, direction.x, direction.y);
  
  System.out.println(grav);
  background(0, 255, 100);
  if (delay == 0) {
    
    for (int i = 0; i < ballcount; i++) {
      balls[i].move(grav);
    }
  grav.rotate(0.01);
  } else {
    delay -= 1;
  }
}
