import ddf.minim.analysis.*;
import ddf.minim.*;
import ddf.minim.signals.*;
 
Minim minim;
AudioInput in;

float[] myBuffer;

void setup() {
  size(900,600);
  background(249,205,173);
  smooth();
  
  minim = new Minim(this);
  in = minim.getLineIn(Minim.MONO,2048);

  myBuffer = new float[in.bufferSize()];
  
}

void draw() {
  
  background(249,205,173);
  stroke(0);
  
  // grab a stationary copy
  for (int i = 0; i < in.bufferSize(); ++i) {
    myBuffer[i] = in.left.get(i);
  }
  
  // find trigger point as largest +ve slope in first 1/4 of buffer
  int offset = 0;
  float maxdx = 0;
  for(int i = 0; i < myBuffer.length/4; ++i)
  {
      float dx = myBuffer[i+1] - myBuffer[i]; 
      if (dx > maxdx) {
        offset = i;
        maxdx = dx;
      }
  }
  
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
  }
  float ampl = maxdx * 10000; 
  fill(19,137,104);
  noStroke();
  triangle(250-ampl, 500+ampl, 450, 150-ampl, 650+ampl, 500+ampl);
  
}
