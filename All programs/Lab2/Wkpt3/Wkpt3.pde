/* Declare an array of Aliens */
final int SCREENX = 800;
final int SCREENY = 800;
Alien alien[];
PImage myImage;
PImage myImage1;
void setup(){
/* create a new alien array */
/* load the images */
/* initialise the array */
 size(800, 800);
 background(255);
 myImage = loadImage("spacer.gif");
 myImage1 = loadImage("exploding.gif");
 alien = new Alien[10];
 init_aliens(alien, myImage);
}

void init_aliens ( /* pass in your array, plus the image to use */Alien alien[], PImage myImage){
 /* for each position in the array,  create a new alien at an appropriate
 starting point on the screen */
 alien[0] = new Alien(int(random(400, SCREENX - 100)), int(random(400, SCREENY - 100)), myImage);
 for (int i = 1; i < alien.length; i++) {
   alien[i] = new Alien(alien[i - 1].xpos - WIDTH, alien[i - 1].ypos, myImage);
 }
}

void draw(){
  /* clear the screen */
  /* for each alien in the array - move the alien, then draw the alien */
  background(255);
  for (int i = 0; i < alien.length; i++) {
    if (alien[i].status == NON_EXPLODING) {
      float rand = random(1000);
      if (rand < 1) {
        alien[i].explode();
      }
    }
    alien[i].move();
    alien[i].draw();
  }
}
