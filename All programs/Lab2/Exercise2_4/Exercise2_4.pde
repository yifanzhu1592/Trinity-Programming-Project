final int SCREENX = 320;
final int SCREENY = 240;
final int PADDLEHEIGHT = 15;
final int PADDLEWIDTH = 50;
final int MARGIN = 10;

class Player {
  int xpos; 
  int ypos;
  color paddlecolor = color(50);
  int lives = 3;
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
  void showLives() {
    if (lives == 0) {
      if (ypos == 0) {
        textSize(20);
        text("Human wins", 120, 120);
      } else {
        textSize(20);
        text("Computer wins", 120, 120);
      }
    }
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
    if (y - radius >= SCREENY) {
      thePlayer.lives--;
    }
    if (y + radius <= 0) {
      computerPlayer.lives--;
    }
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
    i -= 2;
    computerPlayer.move(i--);
  } else {
    i += 2;
    computerPlayer.move(i++);
  }
  theBall.move();
  theBall.collide(thePlayer);
  theBall.collide(computerPlayer);
  theBall.reset();
  thePlayer.showLives();
  computerPlayer.showLives();
  thePlayer.draw();
  computerPlayer.draw();
  theBall.draw();
  textSize(20);
  text("Computer lives: " + computerPlayer.lives, 80, 40);
  textSize(20);
  text("My lives: " + thePlayer.lives, 80, 160);
}

void mousePressed() {
  theBall.dx = random(1, 2); 
  theBall.dy = random(1, 2);
}
