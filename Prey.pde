class Prey extends Agent{
  boolean stuck; //Stuck on the web
  
  Prey(float x, float y){
    super(x, y);
    super.mass = random(30, 40);
  }
  
  void update(){ //Hacer que se mueva de forma aleatoria en el espacio
    
  }
  
  void display(){
    pushMatrix();
    
    stroke(#3BFC80);
    strokeWeight(this.size);
    point(pos.x, pos.y, pos.z);
    popMatrix();
  }
  
  
}
