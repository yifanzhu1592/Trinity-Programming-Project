final int A_FORWARD = 0;
final int A_BACKWARD = 1;
final int A_DOWN = 2;
final int HEIGHT = 25;
final int WIDTH = 30;

class Alien {
  /* declare variables for alien position, direction of movement and appearance */
  int xpos, ypos, state, down;
  PImage alienImage;
  /* Constructor is passed the x and y position where the alien is to
   be created, plus the image to be used to draw the alien */

  Alien(int xpos, int ypos, PImage alienImage) {
    /* set up the new alien object */
    this.xpos = xpos;
    this.ypos = ypos;
    this.alienImage = alienImage;
    state = A_FORWARD;
    down = 0;
  }

  void move() {
    /* Move the alien according to the instructions in the exercise */
    if (ypos == SCREENY - WIDTH) {
    } else if (state == A_FORWARD) {
      xpos++;
      if (xpos == SCREENX - WIDTH) {
        state = A_DOWN;
      }
    } else if (state == A_DOWN) {
      ypos++;
      down++;
      if (down == HEIGHT) {
        down = 0;
        if (xpos == 0) {
          state = A_FORWARD;
        } else {
          state = A_BACKWARD;
        }
      }
    } else {
      xpos--;
      if (xpos == 0) {
        state = A_DOWN;
      }
    }
  }

  void draw() {
    /* Draw the alien using the image() method demonstrated in class */
    image(alienImage, xpos, ypos);
  }
}
