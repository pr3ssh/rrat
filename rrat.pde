void setup() {
  size(900,600);
  background(249,205,173);
  smooth();
}

void draw() {
  for(int i=0;i<height/2;i++) {
    fill(249,205,173);
    noStroke();
    rect(random(600), random(500), random(500), random(400));
    fill(254,67,101);
    noStroke();
    rect(random(600), random(500), random(500), random(400));
    fill(131,175,155);
    noStroke();
    rect(random(600), random(500), random(500), random(400));
    fill(19,137,104);
    noStroke();
    triangle(250, 500, 450, 150, 650, 500);
  }
}
