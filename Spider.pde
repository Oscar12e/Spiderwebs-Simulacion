
enum knitting { 
  start, place_anchors, base, reinforcing, finished
}

/** Class Spider
 Creadora de la telaraña, el proceso va dictado por una serie de procesos
 indicados en el enum knitting
 **/
class Spider extends Agent { //Agregado herencia a Agent
  boolean arrived =false;
  knitting current;
  //float maxSpeed=4;
  //PVector acc; Ya se encuentra en el Agent
  SpiderWeb spiderWeb;
  //Node initialNode,finalNode,downNode; Toda la informacion a los nodos se puede manejar en la red

  Spider() {
    this(0, 0);

    //pos = new PVector(initialNode.posX, initialNode.posY);
    //vel= new PVector(x2,y2);   //Nos da un vector con dirección aleatoria
    //vel= PVector.random2D();
    //acc=new PVector(0,0);
  }

  Spider(float x, float y) {
    super(x, y, 10);
    current = knitting.start;
    this.pos = super.pos;
    super.acc = new PVector(0, 0, 0);
  }

  /*
  Cumple una funcion similar a la de un next
  administra cual es el siguiente paso a realizar para la ara;a
  */
  void update() {
    switch (current){
      case finished:
        return;
      case start:
        startProcess();
        break;
    }
    /*
    vel.add(acc);
    vel.limit(maxSpeed);
    pos.add(vel); //Esto es lo mismo que: pos.x += vel.x & pos.y += vel.y
    acc.mult(0);
    //pos.x = (pos.x + width) % width;
    //pos.y= (pos.y + height) % height;*/
  }



  void display() {
    stroke(255);
    strokeWeight(15);
    point(pos.x, pos.y);
    //strokeWeight(0.5);
    //line(posX,posY,pos.x,pos.y);
  }
  
  void startProcess(){
    print("\nSpider: "+pos);
    float dif = PVector.dist(spiderWeb.centerNode.pos, pos); 
    if (dif < 1){
      current = knitting.finished;
    }
    print("\nSpider dif: "+dif);
    
    
    seek(this.spiderWeb.centerNode.pos);
    
    super.update();
  
  }
  /* Se encuentra en Agent
   void applyForce(PVector f){
   acc.add(f);  //Se le suman las fuerzas y se van acumulando    
   }
   
   void follow(Node node1,Node node2){
   PVector actualPos = new PVector(node1.posX,node1.posY);  
   PVector arrivalPos= new PVector(node2.posX,node2.posY);
   PVector dif = PVector.sub(arrivalPos,actualPos);
   dif.setMag(500);
   applyForce(dif);
   }
   */


  /*
  void initialTravel(){
   if (pos.x >= finalNode.posX) {
   arrived=true;
   }
   if(!arrived) {
   strokeWeight(0.5);
   line(initialNode.posX,initialNode.posY,pos.x,pos.y);
   follow(initialNode,finalNode);}
   else {
   follow(finalNode,initialNode);      
   }
   }*/
}
