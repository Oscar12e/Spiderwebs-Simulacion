class Node{
  float posX, posY;
  float mass;
  PVector acc;
  
  Node(float posX, float posY){
    this.posX=posX;
    this.posY=posY;
    acc=new PVector(0,0);
    mass=constrain(randomGaussian() * 5 + 250, 1, 10000);
  }
  
  void update(){}
  
  void display(){
    stroke(0,255,0);
    strokeWeight(2);
    point(posX,posY);
  }
  
  void applyForce(PVector f) {
    PVector force = f.copy(); //Crea una copia del vector para no modificar el vector original 
    force.div(mass);
    acc.add(force);  //Se le suman las fuerzas y se van acumulando
  }
}
