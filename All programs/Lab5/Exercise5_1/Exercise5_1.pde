/* Declare an array of Aliens */
final int SCREENX = 800;
final int SCREENY = 800;
Alien alien[];
PImage myImage;
PImage myImage1;
Player thePlayer;
ArrayList bullets;
Bomb bomb;
void setup() {
  /* create a new alien array */
  /* load the images */
  /* initialise the array */
  size(800, 800);
  background(255);
  myImage = loadImage("spacer.gif");
  myImage1 = loadImage("exploding.gif");
  alien = new Alien[10];
  bullets = new ArrayList();
  init_aliens(alien, myImage);
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
}

void init_aliens ( /* pass in your array, plus the image to use */Alien alien[], PImage myImage) {
  /* for each position in the array,  create a new alien at an appropriate
   starting point on the screen */
  alien[0] = new Alien(int(random(400, SCREENX - 100)), int(random(400, SCREENY - 100)), 
                        myImage, HEIGHT, WIDTH);
  for (int i = 1; i < alien.length; i++) {
    alien[i] = new Alien(alien[i - 1].xpos - WIDTH, alien[i - 1].ypos, myImage, HEIGHT, WIDTH);
  }
  bomb = new Bomb(100, 100);
}

void draw() {
  /* clear the screen */
  /* for each alien in the array - move the alien, then draw the alien */
  background(255);
  for (int i = 0; i < alien.length; i++) {
    alien[i].move();
    alien[i].draw();
  }
  thePlayer.move(mouseX);
  thePlayer.draw();
  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = (Bullet) bullets.get(i);
    if (bullet != null) {
      if (bullet.y() < 0) {
        bullets.remove(i);
      }
      bullet.move();
      bullet.draw();
      bullet.collide(alien);
    }
  }
  bomb.move();
  bomb.draw();
}

void mousePressed() {
  bullets.add(new Bullet(thePlayer.xpos + PADDLEWIDTH / 2, SCREENY));
}
