class Node extends Agent {
  
  
  Node(float posX, float posY, float posZ ){
    super(posX, posY, posZ,  3);
    mass = constrain(randomGaussian() * 5 + 250, 1, 10000);
    this.pos = super.pos;
  }
  
  void update(){}
  
  void display(){
    stroke(0,255,0);
    stroke(255);
    if (fixed) strokeWeight(8);
    else strokeWeight(5);
    
    point(pos.x,pos.y);
  }
  
  
}
