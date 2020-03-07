class Bullet {
  int xpos, ypos;
  int radius;
  color ballColor = color(200, 100, 50);
  
  Bullet(int xpos, int ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    radius = 20;
  }
  
  void move() {
    ypos--;
  }
  
  void draw() {
    fill(ballColor);
    ellipse(int(xpos), int(ypos), radius, radius);
  }
}
