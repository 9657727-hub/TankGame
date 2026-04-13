// 1 April 2026 | TankGame by Weston Day
Tank t1;
Obstacle o1;
PImage background;

void setup() {
  size(500, 500);
  t1 = new Tank();
  background = loadImage("tankbackground.png");
  background.resize(width,height);
  o1 = new Obstacle(400,100,100,50,5,100);
}

void draw() {
  background(background);
  imageMode(CORNER);
  t1.display();
  o1.display();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if(key == 's') {
    t1.move('s');
  } else if(key == 'a') {
    t1.move('a');
  } else if(key == 'd') {
    t1.move('d');
  }
}
