/*
Clase que define el comportamiento base de todos los agentes.
Dado el alcance del proyecto, este agente no se divide en movibles y no movibles
*/
float maxSpeed = 20;
float agentsMass = 1;
float friction = 1;
float arrivalDist = 50;

abstract class Agent {
  PVector pos, vel, acc;
  float size = 3, mass, drag;
  color myColor;
  
  boolean fixed = false;

  Agent(float x, float y, float z, float mass) {
    this.pos = new PVector(x, y, z);
    this.vel = new PVector(0, 0, 0);
    this.acc = new PVector(0, 0, 0);
    this.size = 3 ;// randomGaussian() + 7.5;
    this.mass = mass;
    this.myColor = color(random(255), random(255), random(255));
  }
  
  Agent(float x, float y, float mass) {
    this(x, y, 0, mass);
  }
  
 
  void update() {
    if (fixed) return;

    //applyFriction();
    this.vel.add(this.acc);
    this.vel.limit(maxSpeed);
    this.pos.add(this.vel);
    this.acc.mult(0);
  }

  void display() {
    pushMatrix();
    
    stroke(#3BFC80);
    strokeWeight(this.size);
    point(pos.x, pos.y, pos.z);
    popMatrix();
  }

  /*
  void applyForce(PVector f) {
    acc.add(f.copy().div(mass));
  }*/
  
  void applyForce(PVector f) {
    PVector force = f.copy();//Crea una copia del vector para no modificar el vector original 
    force.div(mass);
    acc.add(force);          //Se le suman las fuerzas y se van acumulando
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
  
  void seek(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.setMag(maxSpeed);

    PVector steering = PVector.sub(desired, vel);
    applyForce(steering);
  }

  void arrive(PVector target) {
    PVector desired = PVector.sub(target, pos);
    desired.setMag(maxSpeed);

    PVector steering = PVector.sub(desired, vel);
    applyForce(steering); 

    //print("\n"+pos);
    float d = this.pos.dist(target);

    float speed = map(d, 0, arrivalDist, 0, maxSpeed);
    vel.limit(speed);
  }

}
