class SmokeRing {
  
  float seed;
  float t = 0;
  float toff;
  float offset = random(TWO_PI);
  float part = 0.1+0.5*pow(random(1),2.0);
  
  float r = 200;
  float alphaFactor = random(0.5,2.5);
  float strokeWeight = random(0.8,1.8);
  float displacementIntensity = random(10,120);
  
  SmokeRing() {
    seed = random(10,10000);
    toff = random(0.01, 0.05);
  }

  void show() {
    
    strokeWeight(strokeWeight);
    
    for (int i = 0; i < m; i++) {
      float p = 1.0 * i/m;
      float a = offset + part * TWO_PI * i/m;
      stroke(255,alphaFactor*18*sin(PI*p));
      float dx = r * cos(a) + pow(p,3.0)*displacementIntensity * (float)noise.eval(seed + rad * cos(TWO_PI*(nperiod*p-t)), rad * sin(TWO_PI * (nperiod*p-t)), 4.0 * p);
      float dy = r * sin(a) + pow(p,3.0)*displacementIntensity * (float)noise.eval(2 * seed + rad * cos(TWO_PI*(nperiod*p-t)), rad * sin(TWO_PI * (nperiod*p-t)), 4.0 * p);
      
      float x = cos(a);
      float y = sin(a);
      point(dx,dy);
    }
    
    t += toff;
  }
}
