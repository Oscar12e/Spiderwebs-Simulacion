class Node extends Agent{
  boolean fixed;
  
  Node(float x, float y){
    super(x, y);
    super.mass = 2;
    super.size = 5;
  }
  
  void update(){
    
  }
  
  void display(){
    pushMatrix();
    
    stroke(255);
    strokeWeight(super.size);
    point(pos.x, pos.y, pos.z);
    popMatrix();
  }
  
  
}
