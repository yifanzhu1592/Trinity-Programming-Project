final int PADDLEHEIGHT = 20;
final int PADDLEWIDTH = 100;
final int MARGIN = 10;
final int WIN = 2;
final int MOVING = 1;
final int LOSE = 0;

class Player {
  int xpos; 
  int ypos;
  int status;
  color paddlecolor = color(50);
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
    status = MOVING;
  }
  void move(int x) {
    if (x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;
  }
  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
}
