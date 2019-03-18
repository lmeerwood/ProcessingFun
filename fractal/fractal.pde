PVector[] triangle;
PVector point;

void setup() {
  size(1000, 1000);
  float h = 200;
  
  frameRate(100);
 
  
  triangle = new PVector[3];
  triangle[0] = new PVector(0, height - 200);
  triangle[1] = new PVector(width, height - 200);
  triangle[2] = new PVector(width/2, h);
    
  point = new PVector(250,400);
  background(0);
}

void draw() {
  PVector start = point.copy();
  PVector target = triangle[int(random(3))].copy();
  start.sub(target);
  start.div(2);
  point = target.add(start);
  ellipse(point.x, point.y, 5, 5);
}
