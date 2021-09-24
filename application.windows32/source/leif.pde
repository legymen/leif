import processing.sound.*;

Lander theEagle;
Leif theLeif;
Planet thePlanet;
Rock[] rocks;
Dashboard theDash;

float gravity = 0.003;
int numRocks = 60;
float leifSpeed = 1.0;
int tankVolume = 1000;
float minRockDist = 30;
float minLandSpeed = 0.2;

int state = 1;

PImage theEagleImage, skyImage, theLeifImage, FlameImage, mountainImage, rockImage1, rockImage2, rockImage3, groundImage, theLeifGameOverImage, theLeifGameOverImage2, dashImage, explosionImage, GameOverImage;
SoundFile leifDirectionSound, thrustStartSound, explosionSound, leifLaughSound;

void setup() {

  size(800, 600);

  // Load the images
  theEagleImage = loadImage("bilder/theEagle.png");
  theLeifImage = loadImage("bilder/leif in an alien saucer 1.png");
  skyImage = loadImage("bilder/himlen2.png");
  FlameImage = loadImage("bilder/Flame.png");
  theLeifGameOverImage = loadImage("bilder/big leif-1.png");
  theLeifGameOverImage2 = loadImage("bilder/big leif-2.png");
  mountainImage = loadImage("bilder/moon background-1.png");
  rockImage1 = loadImage("bilder/rock1.png");
  rockImage2 = loadImage("bilder/rock2.png");
  rockImage3 = loadImage("bilder/rock3.png");
  groundImage = loadImage("bilder/ground.JPG");
  dashImage = loadImage("bilder/Dash.png");
  explosionImage = loadImage("bilder/explosion.png");
  GameOverImage = loadImage("bilder/GAME OVER.png");

  leifDirectionSound = new SoundFile(this, "ljud/leifDirectionChange.wav");
  thrustStartSound = new SoundFile(this, "ljud/thrustStart.wav");
  explosionSound = new SoundFile(this, "ljud/explosion.wav");
  leifLaughSound = new SoundFile(this, "ljud/leifLaugh.wav");

  // Create all objects
  theEagle = new Lander();
  theLeif = new Leif();
  thePlanet = new Planet();
  rocks = new Rock[numRocks];
  theDash = new Dashboard();
  for (int i = 0; i < numRocks; i++) {
    if (i % 3 == 0) {
      rocks[i] = new Rock(random(0, width), random(float(height - 150), float(height)), rockImage1);
    } else if (i % 3 == 1) {
      rocks[i] = new Rock(random(0, width), random(float(height - 150), float(height)), rockImage2);
    } else {
      rocks[i] = new Rock(random(0, width), random(float(height - 150), float(height)), rockImage3);
    }
  }
}

void draw() {

  // Game state
  if (state == 1) {

    // Update objects
    thePlanet.update();
    theDash.update();
    for (int i = 0; i < numRocks; i++) {
      rocks[i].update();
    }
    theEagle.update();
    theLeif.update();

    // Check for collision with Leif
    collisionCheck();
  }


  // State for collision with Leif
  if (state == 2) { 
    gameOverLeif();
  }



  // Landing state
  if (state == 3) {

    if (abs(theEagle.velocity.x) > minLandSpeed || abs(theEagle.velocity.y) > minLandSpeed) {
      gameOverSpeedLanding();
      noLoop();
    } else if (checkCollisionRocks()) {
      gameOverRockyLanding();
      noLoop();
    } else {
      gameOverWin();
      noLoop();
    }
  }
}
