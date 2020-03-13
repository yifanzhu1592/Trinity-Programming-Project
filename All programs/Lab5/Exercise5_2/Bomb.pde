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
    if (collide()) {
    }
    else if (ypos > SCREENY + radius / 2) {
    }
    else {
      ypos++;
    }
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
  
  boolean collide() {
    if (xpos >= thePlayer.xpos && xpos <= thePlayer.xpos + PADDLEWIDTH 
    && ypos >= thePlayer.ypos && ypos <= thePlayer.ypos + PADDLEHEIGHT) {
      return true;
    }
    else {
      return false;
    }
  }
}
