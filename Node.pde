class Node extends Agent {
  
  
  Node(float posX, float posY){
    super(posX, posY);
 
    mass = constrain(randomGaussian() * 5 + 250, 1, 10000);
  }
  
  void update(){}
  
  void display(){
    stroke(0,255,0);
    stroke(255);
    if (fixed) strokeWeight(8);
    else strokeWeight(2);
    
    point(pos.x,pos.y);
  }
  
  
}
