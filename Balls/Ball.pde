class Ball {
  PVector loc, vel;
  float currentTime, lastTime;
  public Ball(PVector loc, PVector vel) {
    this.loc = loc;
    this.vel = vel;
    currentTime = millis();
  }
  
  private void update(PVector gravity) {
    this.lastTime = this.currentTime;
    this.currentTime = millis();
    float timeDiff = this.currentTime - this.lastTime;
    PVector localGrav = gravity.copy();
    this.vel.add(localGrav.mult(timeDiff/1000));
    
    this.loc.add(this.vel);
    
    
    if ((this.loc.x > width)) {
      this.vel.x *= -0.95;
      this.loc.x = width;
    } else if (this.loc.x < 0) {
      this.vel.x *= -0.95;
      this.loc.x = 0;
    }
  
    if ((this.loc.y > height)) {
      this.vel.y *= -0.95;
      this.loc.y = height;
    } else if (this.loc.y < 0) {
      this.vel.y *= -1;
      this.loc.y = 0;
    }
  }
  
  public void move(PVector gravity) {
    this.update(gravity);
    float col = map(this.vel.mag(), 0, 20, 0, 255);
    fill(col);
    ellipse(this.loc.x, this.loc.y, 40, 40);
  }
}
