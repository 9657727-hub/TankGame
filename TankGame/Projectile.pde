class Projectile {
  //Member Varible
  float x, y, w, h, speed;
  float vx, vy;
  char idir;

  //Constructor
  Projectile(float x, float y, float vx, float vy) {
    this.x = x;
    this.y = y;
    this.vx = vx;
    this.vy = vy;
    this.w = 10;
    this.h = 10;
    speed = 90;
    idir = 'u';
  }

  void display() {
    fill(127, 0, 0);
    rect(x, y, w, h);
  }

  void move() {
    x += vx;
    y += vy;
  }

  void fire() {
  }

  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    if (distance <100) {
      return true;
    } else

      return false;
  }
}
