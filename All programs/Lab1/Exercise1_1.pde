int i = 0;
int j = 0;
int z = 0;

void setup() {
  size(200, 200);
  noStroke();
  i = 50;
  j = 40;
  z = 50;
}

void draw() {
  background(255);
  fill(255, 255, 0);
  rect(j--, 30, 50, 50);
  fill(0, 0, 255);
  rect(80, z++, 50, 50);
  fill(0, 255, 0);
  rect(i++, 40, 50, 50);
}
