class Carnada {
  PVector pos;
  PVector vel;
  PVector acc;

  float maxForce = 10;
  float maxSpeed = 5;
  float mass; 
  float size; 
  color c;

  float friction;
  float drag;
  Carnada(float x, float y, float mass, float friction, float drag) {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
    c = color(random(255), random(255), random(255));
    this.mass = mass;
    this.drag = drag;
    size = sqrt(mass);
    this.friction = friction;
  }

  Carnada(float x, float y) {
    this(x, y, random(30, 40), 0, 0);
  }

  void update() {

    vel.add(acc);
    pos.add(vel);
    vel.limit(maxSpeed); //limit recibe el número que queremos reducir
    acc.mult(0);

    applyFriction();
    applyDrag();
  }

  void applyFriction() {
    PVector fric = vel.copy();
    fric.normalize();
    fric.mult(-friction);
    applyForce(fric);
  }

  void applyDrag()
  {
    PVector dragForce = vel.copy();
    float v2 = dragForce.magSq();
    dragForce.normalize();
    dragForce.mult(v2);
    dragForce.mult(-drag);
    applyForce(dragForce);
  }

  void applyForce(PVector f)
  {
    PVector force = f.copy();
    force.div(mass);
    acc.add(force);
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, mass/2, mass/2);
  }
}
