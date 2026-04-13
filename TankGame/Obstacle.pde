class Obstacle {
  //Member Varible
  float x, y, w, h, speed, health;
  PImage tankA, tankW, tankS, tankD;
  char idir;

  //Constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;
    idir = 'w';
  }

  void display() {
    fill(128);
    rectMode(CENTER);
    rect(x, y, w, h);
  }

  void move() {
    x=x+speed;
  }
}
