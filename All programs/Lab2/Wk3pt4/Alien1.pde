final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
final int HEIGHT = 25;
final int WIDTH = 30;
final int NON_EXPLODING = 0;
final int EXPLODING = 1;
final int NON_SPECIAL = 0;
final int SPECIAL = 1;
final int SPECIAL_WIDTH = 130;

class Alien {
 /* declare variables for alien position, direction of movement and appearance */
 int xpos, ypos, state, down, status, special, ypos_plus;
 float acceleration;
 PImage alienImage;
 /* Constructor is passed the x and y position where the alien is to
 be created, plus the image to be used to draw the alien */
 
 Alien(int xpos, int ypos, PImage alienImage){
  /* set up the new alien object */ 
  this.xpos = xpos;
  this.ypos = ypos;
  this.alienImage = alienImage;
  state = A_FORWARD;
  down = 0;
  status = NON_EXPLODING;
  acceleration = 0;
  ypos_plus = 0;
  if (alienImage == myImage2) {
    special = SPECIAL;
  }
  else {
    special = NON_SPECIAL;
  }
 }
  
 void move(){
  /* Move the alien according to the instructions in the exercise */
  if (status == EXPLODING) {
  }
  else if (ypos == SCREENY - WIDTH) {
  }
  else if (state == A_FORWARD) {
    xpos += acceleration;
    ypos = (int)(100 + sin(xpos*PI/180)*50) + ypos_plus;
    if (xpos >= SCREENX - WIDTH) {
      state = A_DOWN;
    }
  }
  else if (state == A_DOWN) {
    ypos += 3;
    ypos_plus += 3;
    down++;
    if (down == HEIGHT) {
      down = 0;
      if (xpos <= 0) {
        state = A_FORWARD;
      }
      else {
        state = A_BACKWARD;
      }
    }
  }
  else {
    xpos -= acceleration;
    ypos = (int)(100 + sin(xpos*PI/180)*50) + ypos_plus;
    if (xpos <= 0) {
      state = A_DOWN;
    }
  }
  acceleration += 0.01;
 }
  
  void draw(){
    /* Draw the alien using the image() method demonstrated in class */
    image(alienImage, xpos, ypos);
  }
  
  void explode() {
    status = EXPLODING;
    alienImage = myImage1;
  }
}
