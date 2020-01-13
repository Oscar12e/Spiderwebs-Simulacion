class Spider {
  boolean arrived;
  PVector posicion, velocidad;
  float maxSpeed=4;
  PVector acc;
  Node initialNode,finalNode,downNode;

  Spider(Node initialNode, Node finalNode, Node downNode) {
    this.initialNode=initialNode;
    this.finalNode=finalNode;
    this.downNode=downNode;
    arrived=false;
    posicion = new PVector(initialNode.posX, initialNode.posY);
    //velocidad= new PVector(x2,y2);   //Nos da un vector con dirección aleatoria
    velocidad= PVector.random2D();
    acc=new PVector(0,0);
  }
  void update() {
    
      velocidad.add(acc);
      velocidad.limit(maxSpeed);
      posicion.add(velocidad); //Esto es lo mismo que: pos.x += vel.x & pos.y += vel.y
      acc.mult(0);
      //posicion.x = (posicion.x + width) % width;
      //posicion.y= (posicion.y + height) % height;
   
  }

  void display() {
    stroke(255);
    strokeWeight(5);
    point(posicion.x, posicion.y);
    //strokeWeight(0.5);
    //line(posX,posY,posicion.x,posicion.y);
  }
  
  void applyForce(PVector f){
    acc.add(f);  //Se le suman las fuerzas y se van acumulando    
  }
  
  void initialTravel(){
    if (posicion.x >= finalNode.posX) {
      arrived=true;
    }
    if(!arrived) {
      strokeWeight(0.5);
      line(initialNode.posX,initialNode.posY,posicion.x,posicion.y);
      follow(initialNode,finalNode);}
    else {
      follow(finalNode,initialNode);      
    }
  }
  
  void follow(Node node1,Node node2){
    PVector actualPos = new PVector(node1.posX,node1.posY);  
    PVector arrivalPos= new PVector(node2.posX,node2.posY);
    PVector dif = PVector.sub(arrivalPos,actualPos);
    dif.setMag(500);
    applyForce(dif);
  }
}
