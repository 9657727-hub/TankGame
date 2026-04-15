class Projectile {
  //Member Varible
  float x, y, w, h, speed;
  char idir;

  //Constructor
  Projectile(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    speed = 10;
  }

  void display() {
    fill(127,0,0);
    rect(x, y, w, h);
  }

  void move() {
    y = y - speed;
  }
}
