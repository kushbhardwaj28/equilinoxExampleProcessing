public class Terrain {
  PImage img = loadImage("terrain1.jpg");
  public float[][] terrain;
  private float yoff = 0;
  private int w;
  private int h;
  private int rows;
  private int cols;
  private int scl = 20;
  public Terrain(){
  } 
  public Terrain(int rows,int cols){
    this.rows = rows/scl;
    this.cols = cols/scl;
    this.w = rows-300;
    this.h = cols-300;
  }
  
 public void makeTerrain(){
   terrain = new float[this.h][this.w];
   for (int y = this.rows*3; y < this.rows*8; y++) {
    float xoff = 0;
    for (int x = this.cols*3; x < this.cols*8; x++) {
      terrain[x][y] = map(noise(xoff, yoff), 0, 1, -100, 100);
      xoff += 0.1;
    }
    yoff += 0.1;
  }
 }
 
 
 public void showTerrain(){
  //stroke(179, 89, 0);
  fill(102, 51, 0);

  //translate(this.w, this.h,-10);
  //rotateX(PI/2);
  //translate(-(this.w+2000), -(this.h+2000));
  for (int y = 0; y < this.w-1; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = 0; x < this.h; x++) {
      //texture(img);
      vertex(x*scl, y*scl, terrain[x][y]);
      vertex(x*scl, (y+1)*scl, terrain[x][y+1]);
    }
    endShape();
  }
 }
}