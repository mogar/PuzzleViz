/*
shock_waves.pde

Generate waves that move through a non-linear medium from left to right.

Change B to change the non-linearity of the medium. B=0 corresponds to a linear medium.
The model starts to break down above B=.00002.

*/

int base = 128;
int w0 = 1;
float k0 = .05;
int amplitude = 80;
float B = .000015;

int t = 0;
void setup()
{
  size(1000,200);
  background(base);
}

boolean printNow = true;
void draw() 
{
  float k = k0;
  float w = .1*w0;
  for (int i = 0; i < width; i++) {
    //change k to change wavespeed=w/k
    //k changes with amplitude of wave so let k = k0 at i = 0
    //update k based on last amplitude
    //the stroke color is the magnitude of the wave
    float wave = amplitude*sin(w*t-k*i);
    k = k0 + B*wave;
    if (printNow) {
     println(k); 
    }
    stroke(0,0,base + wave);
    line(i, 0, i, height);
  } 
  printNow = false;
  t++;
  delay(200);
}

boolean go = true;
void mousePressed() 
{
  if (go) {
    noLoop();
    go = false;
    saveFrame("shockwave-#####.jpg");
  } else {
    loop();
    go = true; 
  } 
}
