int i = 0;
int j = -50;
int m = 100;
int n = 200; 

void setup() {
  size(200, 200);
  noStroke();
}

void draw() {
  background(255);
  fill(255, 255, 0);
  rect(i++, 40, 50, 50);
  if (i >= 149) {
    rect(j++, 40, 50, 50);
    if (i >= 199) {
      i = 0;
      j = -50;
    }
  }
  fill(0, 0, 255);
  rect(m--, 100, 50, 50);
  if (m <= 1) {
    rect(n--, 100, 50, 50);
    if (m <= -49) {
      m = 150;
      n = 200;
    }
  }
}
