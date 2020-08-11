OpenSimplexNoise noise;

SmokeRing[] rings;
SmokePath[] lines;

boolean recording = false;
boolean writing = true;

ArrayList<PVector> path;
PVector prevMouse, currentMouse;

int ringCount = 20;

void setup(){
  size(600,600,P2D);
  path = new ArrayList<PVector>();
  noise = new OpenSimplexNoise(); 
  rings = new SmokeRing[ringCount];
  lines = new SmokePath[ringCount];
  for (int i = 0; i < rings.length; i++) {
    rings[i] = new SmokeRing();
    lines[i] = new SmokePath();
  }
}

int m = 2000;
float rad = 1.5;
float nperiod = 4.0;
 
void draw(){
  background(0);
  if (recording) {
    if (writing) {
      currentMouse = new PVector(mouseX, mouseY);
      if ((prevMouse == null) || (PVector.dist(prevMouse, currentMouse) > 5)) {
        path.add(currentMouse);
        prevMouse = currentMouse;
      }
    }
    stroke(255);
    strokeWeight(1);
    for (PVector p : path) {
      point(p.x, p.y);
    }
    text("Recording mouse path\nPress space to lift or lower the pen", 10, 15);
  } else if (path.size() < 1) {
    translate(width/2, height/2);
    for (SmokeRing s : rings) {
      s.show();
    }
  } else {
    translate(0, 0);
    for (SmokePath s : lines) {
      s.show();
    }
  }
}

void mousePressed() {
  if (!recording) {
    path.clear();
    writing = true;
  }
  recording = (recording) ? false : true;
}

void keyPressed() {
  if (recording && key == ' ') {
    writing = writing ? false : true;
  }
}
