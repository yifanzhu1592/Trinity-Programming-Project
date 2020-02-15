class Bullet {
  int xpos, ypos;
  int radius;
  color ballColor = color(200, 100, 50);
  
  Bullet(int xpos, int ypos) {
    this.xpos = xpos;
    this.ypos = ypos;
    radius = 10;
  }
  
  void move() {
    ypos--;
  }
  
  void draw() {
    fill(ballColor);
    ellipse(int(xpos), int(ypos), radius, radius);
  }
  
  void collide(Alien alien[]) {
    for (int i = 0; i < alien.length; i++) {
      if (xpos >= alien[i].xpos && xpos <= alien[i].xpos + WIDTH 
      && ypos >= alien[i].ypos && ypos <= alien[i].ypos + HEIGHT) {
        alien[i].status = EXPLODING;
        alien[i].alienImage = myImage1;
      }
    }
  }
}
