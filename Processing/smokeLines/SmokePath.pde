class SmokePath {
  
  float seed;
  float t = 0;
  float toff;
  float offset = random(TWO_PI);
  float part = 0.1+0.5*pow(random(1),2.0);
  float r = 200;
  float alphaFactor = random(0.5,2.5);
  float strokeWeight = random(0.8,1.8);
  float displacementIntensity = random(10,120);
  
  SmokePath() {
    seed = random(10,10000);
    toff = random(0.01, 0.05);
  }

  void show() {
    
    strokeWeight(strokeWeight);
    
    for(int i=0;i<m;i++){
      float p = 1.0*i/m;
      float a = part*TWO_PI*i/m;
      stroke(255,alphaFactor*18*sin(PI*p));
      
      int posPrev = (path.size()*i)/m;
      int posNext = posPrev + 1;
      float x, y;
      if (posNext < path.size()) { // Linear interpolation between points of the path
        float factor = 1.0*(path.size()*i)/m - posPrev;
        float xPrev = path.get(posPrev).x;
        float xNext = path.get(posNext).x;
        x = xPrev + (xNext-xPrev)*factor;
        
        float yPrev = path.get(posPrev).y;
        float yNext = path.get(posNext).y;
        y = yPrev + (yNext-yPrev)*factor;
      } else {
        x = path.get(posPrev).x;
        y = path.get(posPrev).y;
      }
      
      float dx = x + pow(p,3.0)*displacementIntensity*(float)noise.eval(seed + rad*cos(TWO_PI*(nperiod*p-t)),rad*sin(TWO_PI*(nperiod*p-t)),4.0*p);
      float dy = y + pow(p,3.0)*displacementIntensity*(float)noise.eval(2*seed + rad*cos(TWO_PI*(nperiod*p-t)),rad*sin(TWO_PI*(nperiod*p-t)),4.0*p);
      
      
      point(dx,dy);
    }
    
    t += toff;
  }
}
