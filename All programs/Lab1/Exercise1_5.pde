int i = 0;
int j = -50;
int m = 180;
int n = 360;
int c1 = 255;
int c2 = 128;
int c3 = 64;
int c4 = 64;
int c5 = 128;
int c6 = 255;

void setup() {
  size(360, 360);
  noStroke();
}

void draw() {
  background(255);
  fill(c1, c2, c3);
  c1 = (c1+1)%255;
  c2 = (c2+2)%255;
  c3 = (c3+3)%255;
  rect(i++, 125 + sin(i*PI/90)*100, 50, 50);
  if (i >= 309) {
    rect(j++, 125 + sin(i*PI/90)*100, 50, 50);
    if (i >= 359) {
      i = 0;
      j = -50;
    }
  }
  fill(c4, c5, c6);
  c4 = (c4+3)%255;
  c5 = (c5+2)%255;
  c6 = (c6+1)%255;
  rect(m--, 175 + sin(m*PI/45)*50, 50, 50);
  if (m <= 1) {
    rect(n--, 175 + sin(m*PI/45)*50, 50, 50);
    if (m <= -49) {
      m = 310;
      n = 360;
    }
  }
}
