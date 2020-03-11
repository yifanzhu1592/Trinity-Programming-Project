class Bomb {
  
  int xpos, ypos;
  int radius;
  color bombColor = color(100, 100, 200);
  
  Bomb(int xpos, int ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    radius = 20;
  }
  
  void move() {
    ypos++;
  }
  
  void draw() {
    fill(bombColor);
    ellipse(int(xpos), int(ypos), radius, radius);
  }
  
  boolean offScreen() {
    if (ypos > SCREENY) {
      return true;
    }
    else {
      return false;
    }
  }
}
