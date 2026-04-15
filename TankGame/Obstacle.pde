class Obstacle {
  //Member Varible
  float x, y, w, h, speed, health;
  PImage obs1;
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
   obs1 = loadImage("Obstacle.png");
  }

  void display() {
    fill(128);
    imageMode(CENTER);
    image(obs1,x,y);
  }

  void move() {
    x=x+speed;
    if(x>width) {
    x = 0;
    }
  }
}
