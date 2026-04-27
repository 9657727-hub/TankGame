class Obstacle {
  float x, y, w, h, speed, health;
  PImage obs1;

  // Constructor
  Obstacle(float x, float y, float w, float h, float speed, float health) {
    this.w = w;
    this.h = h;
    this.speed = speed;
    this.health = health;

    // Spawn just off the left side at random height
    this.x = -w;
    this.y = random(height);

    obs1 = loadImage("Obstacle.png");
  }

  void display() {
    imageMode(CENTER);
    image(obs1, x, y, w, h);
  }

  void move() {
    x += speed;
  }

  boolean offScreen() {
    return x > width + w;
  }

  boolean intersect(Obstacle o) {
    float distance = dist(x, y, o.x, o.y);
    return distance < (w / 2 + o.w / 2);
  }
}
