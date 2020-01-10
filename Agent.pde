/*
Clase que define el comportamiento base de todos los agentes.
Dado el alcance del proyecto, este agente no se divide en movibles y no movibles
*/
float maxSpeed = 50;
float agentsMass = 2;
float friction = 1;

abstract class Agent {
  PVector pos, vel, acc;
  float size = 3, mass, drag;
  color myColor;
  
  boolean fixed = false;

  Agent(float x, float y, float z) {
    this.pos = new PVector(x, y, z);
    this.vel = new PVector(0, 0);
    this.acc = new PVector(0, 0);

    this.size = 3 ;// randomGaussian() + 7.5;
    this.myColor = color(random(255), random(255), random(255));
  }
  
  Agent(float x, float y) {
    this(x, y, 0);
  }
  
  Agent (){
    
  }


  void update() {
    if (fixed) return;

    applyFriction();
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel);
    acc.mult(0);
  }

  void display() {
    pushMatrix();
    
    stroke(#3BFC80);
    strokeWeight(this.size);
    point(pos.x, pos.y, pos.z);
    popMatrix();
  }

  void applyForce(PVector f) {
    acc.add(f.copy().div(mass));
  }

  void applyFriction() {
    PVector fric = vel.copy();
    fric.normalize();
    fric.mult(-friction);
    applyForce(fric);
  }

}
