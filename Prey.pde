class Prey extends Agent{
  boolean stuck; //Stuck on the web
  
  Prey(float x, float y){
    super(x, y, random(200, 700), random(150, 200));
    //super.mass = random(40, 50);
  }
  
  void update(){ //Hacer que se mueva de forma aleatoria en el espacio
    super.vel.add(acc);
    super.pos.add(vel);
    super.vel.limit(maxSpeed);
    super.acc.mult(0);
    
    applyFriction();
    applyDrag();
  }
  
  void display(){
    pushMatrix();
    stroke(#3BFC80);
    strokeWeight(sqrt(this.mass));
    point(pos.x, pos.y, pos.z);
    popMatrix();
  }
  
  
}
