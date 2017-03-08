public class Water {
  private int rows;
  private int cols;
  private int w;
  private int h;
  public float[][] water;
  private float flying = 0;
  private int scl = 20;

 public Water(int rows, int cols){
   this.rows = rows/scl;
   this.cols = cols/scl;
   this.w = rows-300;
   this.h = cols-300;
 }
 
 public void makeWater(){
   this.flying -= 0.01;
   float yoff = flying;
   water = new float[this.w][this.h];
   for (int y = this.rows*3; y < this.rows*8; y++) {
    float xoff = flying;
    for (int x = this.cols*3; x < this.cols*8; x++) {
      water[x][y] = map(noise(xoff, yoff), 0, 1, -10, 10);
      xoff += 0.2;
    }
    yoff += 0.2;
  }
 }
 
 
 public void showWater(){
  
  noStroke();
  fill(0, 255, 255);
  //translate(this.rows+500, this.cols+500,-15);
  translate(0, 0,-15);
  for (int y = this.rows*3; y < this.rows*8; y++) {
    beginShape(TRIANGLE_STRIP);
    for (int x = this.cols*3; x < this.cols*8; x++) {
      vertex(x*scl, y*scl, water[x][y]);
      vertex(x*scl, (y+1)*scl, water[x][y+1]);
      //rect(x*scl, y*scl, scl, scl);
    }
    endShape();
  }
 }
}