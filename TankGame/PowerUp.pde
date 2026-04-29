class PowerUp {
  float x, y;
  PImage img;

  PowerUp() {
    x = random(width);
    y = random(height);
    img = loadImage("Kiwi.png");
  }

  void display() {
    imageMode(CENTER);
    image(img, x, y, 40, 40);
  }

  boolean touchTank(Tank t) {
    return dist(x, y, t.x, t.y) < 50;
  }
}
