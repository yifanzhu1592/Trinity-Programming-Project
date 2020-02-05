int i = 0;

void setup() {
  size(200, 200);
  noStroke();
}

void draw() {
  background(255);
  fill(255, 255, 0);
  rect(i, 40, 50, 50);
  if (i++ >= 199)
    i = 0;
}
