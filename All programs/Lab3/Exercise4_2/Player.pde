final int PADDLEHEIGHT = 20;
final int PADDLEWIDTH = 100;
final int MARGIN = 10;

class Player {
  int xpos; 
  int ypos;
  color paddlecolor = color(50);
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
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
