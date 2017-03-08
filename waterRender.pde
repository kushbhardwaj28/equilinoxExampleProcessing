import peasy.*;

int scl = 20;
int w = 600;
PeasyCam cam;
int h = 600;
Terrain terrain;
Water water;
int x = 0;

void setup() {
  size(1280,720, P3D);
  cam = new PeasyCam(this,w+700,h/4,500,900);
  
  cam.setSuppressRollRotationMode();
  cam.setYawRotationMode();

  terrain = new Terrain(w,h);
  water = new Water(w,h);

  terrain.makeTerrain();
}


void draw() {
  
  pointLight(255,255,255,w+700,-1000,500);
  background(77);
  translate(this.w, this.h,-10);
  rotateX(PI/2);
  translate(-(this.w+2000), -(this.h+2000));

  terrain.showTerrain();
  water.makeWater();
  water.showWater();
  if(x>1000)
    x=0;
  x++;
}