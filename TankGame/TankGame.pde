// 1 April 2026 | TankGame by Weston Day
Tank t1;
ArrayList<Projectile> projectiles = new ArrayList<Projectile>();
ArrayList<Obstacle> obstacles = new ArrayList<Obstacle>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
//Obstacle o1, o2, o3;
PImage background;
int score;
Timer objTimer, puTimer;


void setup() {
 size(500, 500);
  score = 0;

  t1 = new Tank();

  background = loadImage("tankbackground.png");
  background.resize(width, height);

  objTimer = new Timer(1000);
  objTimer.start();

  puTimer = new Timer(4000);
  puTimer.start();
}


  void draw() {
  background(background);
  imageMode(CORNER);
  image(background, 0, 0);

  // HEALTH BAR
  rectMode(CORNER);
  fill(255, 0, 0);
  fill(0, 255, 0);


  // SPAWN OBSTACLES
  if (objTimer.isFinished()) {
    obstacles.add(new Obstacle(-100, 200, 100, 100, int(random(1, 10)), 10));
    objTimer.start();
  }

  // OBSTACLES LOOP
  for (int j = obstacles.size()-1; j >= 0; j--) {
    Obstacle o = obstacles.get(j);
    o.display();
    o.move();

    if (o.offScreen()) {
      obstacles.remove(j);
    }

    // DAMAGE PLAYER
    if (t1.intersect(o)) {
      t1.health -= 0.3;
    }
  }

  // PROJECTILES
  for (int i = projectiles.size()-1; i >= 0; i--) {
    Projectile p = projectiles.get(i);

    p.display();
    p.move();

    for (int j = obstacles.size()-1; j >= 0; j--) {
      Obstacle o = obstacles.get(j);

      if (p.intersect(o)) {
        projectiles.remove(i);
        obstacles.remove(j);
        score += 100;
        break;
      }
    }
  }

  // SPAWN POWERUPS
  if (puTimer.isFinished()) {
    powerups.add(new PowerUp());
    puTimer.start();
  }

  // POWERUPS LOOP
  for (int i = powerups.size()-1; i >= 0; i--) {
    PowerUp p = powerups.get(i);
    p.display();

    if (p.touchTank(t1)) {
      t1.health += 20;
      if (t1.health > 100) t1.health = 100;
      powerups.remove(i);
    }
  }

  // DRAW PLAYER
  t1.display();

  // UI
  fill(255);
  textSize(20);
  text("Health: " + int(t1.health), 10, 50);

  scorePanel();

  // GAME OVER
  if (t1.health <= 0) {
    background(0);
    fill(255);
    textSize(40);
    textAlign(CENTER);
    text("GAME OVER", width/2, height/2);
    noLoop();
  }
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
    float dy = mouseY - t1.y;
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
    text("Health:"+t1.health,width/2,55);
  }
