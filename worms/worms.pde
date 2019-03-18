Walker[] w;
int walkerCount = 20;


void setup() {
  w = new Walker[walkerCount];
  for (int i = 0; i < walkerCount; i++) {
    w[i] = new Walker(); 
  }
  size(800, 600);
  frameRate(60);
}

void draw() {
  background(255);
  for (int i = 0; i < walkerCount; i++) {
    w[i].walk(); 
    w[i].render(); 
  }
}

class Walker {
  int x, y, z;
  float xoff, yoff, zoff;
  int brightness;
  
  public Walker() {
    this.x = 0;
    this.y = 0;
    this.z = 0;
    this.xoff = random(10000);
    this.yoff = random(10000);
    this.zoff = random(10000);
    brightness = int(random(256));
  }
  
  public void walk() {
    float x = noise(xoff);
    this.x = int(map(x, 0, 1, 0, width));
    xoff += 0.01;
    
    float y = noise(0, yoff);
    this.y = int(map(y, 0, 1, 0, height));
    yoff += 0.01;
    
    float z = noise(0, 0, zoff);
    this.z = int(map(z, 0, 1, 5, 100));
    zoff += 0.01;
    
    float brightness = noise(xoff, yoff, zoff);
    this.brightness = int(map(brightness, 0, 1, 0, 255));
  }
  
  public void render() {
    fill(brightness);
    ellipse(this.x, this.y, this.z, this.z);
  }
  
  
}
