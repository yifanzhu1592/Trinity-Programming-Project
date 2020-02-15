/* Declare an array of Aliens */
final int SCREENX = 800;
final int SCREENY = 800;
int index = 0;
Alien alien[];
PImage myImage;
PImage myImage1;
Player thePlayer;
Bullet bullet[];
void setup() {
  /* create a new alien array */
  /* load the images */
  /* initialise the array */
  size(800, 800);
  background(255);
  myImage = loadImage("spacer.gif");
  myImage1 = loadImage("exploding.gif");
  alien = new Alien[10];
  bullet = new Bullet[100];
  init_aliens(alien, myImage);
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
}

void init_aliens ( /* pass in your array, plus the image to use */Alien alien[], PImage myImage) {
  /* for each position in the array,  create a new alien at an appropriate
   starting point on the screen */
  alien[0] = new Alien(int(random(400, SCREENX - 100)), int(random(400, SCREENY - 100)), myImage);
  for (int i = 1; i < alien.length; i++) {
    alien[i] = new Alien(alien[i - 1].xpos - WIDTH, alien[i - 1].ypos, myImage);
  }
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
  for (int i = 0; i < index; i++) {
    if (bullet[i] != null) {
      bullet[i].move();
      bullet[i].draw();
      bullet[i].collide(alien);
    }
  }
}

void mousePressed() {
  bullet[index] = new Bullet(thePlayer.xpos + PADDLEWIDTH / 2, SCREENY);
  index++;
}
