class Leif {

  PVector position;
  PVector velocity;
  PVector acceleration;
  
  float speed = 2.5;

  Leif() {
    position = new PVector(600, 0);
    velocity = new PVector(-0.3, 0.3);
    acceleration = new PVector(0, 0);
  }

  void display() {
    pushMatrix();
    translate(position.x, position.y);
    image(theLeifImage, 0, 0);
    popMatrix();
  }

  void update() {      // körs varje frame

    position.add(velocity);
    velocity.add(acceleration);

    display();

    if (position.x < 0) {
      velocity.x = velocity.x * -1;
    }

    if (position.y < 0) {
      velocity.y = velocity.y * -1;
    }

    if (position.y > height-40) {
      velocity.y = velocity.y * -1;
    }

    if (position.x > width-50) {
      velocity.x = velocity.x * -1;
    }

    if (frameCount % 200 == 0) {
      velocity = PVector.sub(theEagle.position, position);
      velocity.setMag(speed);

    }
  }
}
