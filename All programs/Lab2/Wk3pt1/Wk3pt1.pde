/* Declare an Alien */
final int SCREENX = 400;
final int SCREENY = 400;
Alien alien;
void setup(){
 /* create a new alien object */ 
 size(400, 400);
 background(255);
 PImage myImage = loadImage("spacer.gif");
 alien = new Alien(int(random(0, SCREENX - 100)), int(random(0, SCREENY - 100)), myImage);
}

void draw(){
  /* clear the screen */
  /* move the alien */
  /* draw the alien */
  background(255);
  alien.move();
  alien.draw();
}
