// 1 April 2026 | TankGame by Weston Day
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
Obstacle o1, o2, o3;
PImage background;
int score;

void setup() {
  size(500, 500);
  score = 0;
  t1 = new Tank();
  o1 = new Obstacle(400, 50, 100, 50, 1, 100);
  o2 = new Obstacle(400, 250, 100, 50, 1, 100);
  o3 = new Obstacle(400, 450, 100, 50, 1, 100);
  background = loadImage("tankbackground.png");
  background.resize(width, height);
}

void draw() {
  background(background);
  imageMode(CORNER);
  image(background, 0, 0);
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile part = projectiles.get(i);
    part.display();
    part.move();
  }
  t1.display();
  o1.display();
  o1.move();
  o2.display();
  o2.move();
  o3.display();
  o3.move();
  scorePanel();
}

void keyPressed() {
  if (key == 'w') {
    t1.move('w');
  } else if (key == 's') {
    t1.move('s');
  } else if (key == 'a') {
    t1.move('a');
  } else if (key == 'd') {
    t1.move('d');
  }
}

void mousePressed() {
  projectiles.add(new Projectile(t1.x, t1.y, 4, 10));
}

void scorePanel() {
  fill(127, 200);
  rectMode(CENTER);
  noStroke();
  rect(width/2, 15, width, 30);
  fill(255);
  textSize(30);
  textAlign(CENTER);
  text("Score:" + score, width/2, 25);
}
