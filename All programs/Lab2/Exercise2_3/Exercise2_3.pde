final int SCREENX = 320;
final int SCREENY = 240;
final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 50;
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

class Ball {
  float x; 
  float y;
  float dx; 
  float dy;
  int radius;
  color ballColor = color(200, 100, 50);
  Ball() {
    x = random(SCREENX/4, SCREENX/2);
    y = random(SCREENY/4, SCREENY/2);
    dx = random(1, 2); 
    dy = random(1, 2);
    radius=5;
  }
  void move() {
    x = x+dx; 
    y = y+dy;
  }
  void draw() {
    fill(ballColor);
    ellipse(int(x), int(y), radius, 
      radius);
  }
  void collide(Player tp) {
    if (x-radius <=0 && dx < 0) dx=-dx;
    else if (x+radius>=SCREENX && dx > 0) dx=-dx;
    if (y+radius >= tp.ypos &&
      y-radius<tp.ypos+PADDLEHEIGHT &&
      x >=tp.xpos && x <=
      tp.xpos+PADDLEWIDTH) {
      println("collided!");
      dy=-dy;
    }
  }

  void reset() {
    if (y - radius >= SCREENY
      || y + radius <= 0) {
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      dx = 0; 
      dy = 0;
    }
  }
}

Player thePlayer;
Player computerPlayer;
Ball theBall;
int i = SCREENX / 2;
void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  computerPlayer = new Player(0);
  theBall = new Ball();
  ellipseMode(RADIUS);
}
void draw() {
  background(255);
  thePlayer.move(mouseX);
  if (i > theBall.x) {
    computerPlayer.move(i--);
  } else {
    computerPlayer.move(i++);
  }
  theBall.move();
  theBall.collide(thePlayer);
  theBall.collide(computerPlayer);
  theBall.reset();
  thePlayer.draw();
  computerPlayer.draw();
  theBall.draw();
}

void mousePressed() {
  theBall.dx = random(1, 2); 
  theBall.dy = random(1, 2);
} 
