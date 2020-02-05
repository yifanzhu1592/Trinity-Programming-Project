int i = 0;
int j = -50;

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
}
