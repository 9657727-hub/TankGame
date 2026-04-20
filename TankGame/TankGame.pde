// 1 April 2026 | TankGame by Weston Day
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
//Obstacle o1, o2, o3;
PImage background;
int score;
Timer objTimer;

void setup() {
  size(500, 500);
  score = 0;
  t1 = new Tank();
  //o1 = new Obstacle(400, 250, 100, 50, 2, 100);
  //o2 = new Obstacle(400, 250, 100, 50, 3, 100);
  //o3 = new Obstacle(400, 250, 100, 50, 4, 100);
  background = loadImage("tankbackground.png");
  background.resize(width, height);
  objTimer = new Timer(1000);
  objTimer.start();
}

void draw() {
  background(background);
  imageMode(CORNER);
  image(background, 0, 0);

  // Distribute object on timer
  if (objTimer.isFinished()) {
    // Add object
 obstacles.add(new Obstacle(-100, 200, 100, 100,int(random(1, 10)), 10));
    // Restart Timer
    objTimer.start();
  }
  // render and detect collision
  for (int i = 0; i < projectiles.size(); i++) {
    Projectile p = projectiles.get(i);
    for (int j = 0; j < obstacles.size(); j++) {
      Obstacle o = obstacles.get(j);
      if (p.intersect(o)) {
        score = score + 100;
        projectiles.remove(i);
        obstacles.remove(j);
        continue;
      }
    }
      p.display();
      p.move();
    }
    t1.display();
   // o1.display();
   // o1.move();
    //o2.display();
   // o2.move();
   // o3.display();
   // o3.move();
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
    float dx = mouseX - t1.x;
    float dy = mouseY - t1.x;
    float mag = sqrt(dx*dx + dy*dy);

    if (mag > 0) {
      dx /= mag;
      dy /=mag;
      float speed = 5;
      projectiles.add(new Projectile(t1.x, t1.y, dx * speed, dy * speed));
    }
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
