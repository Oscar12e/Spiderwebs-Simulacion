
enum knitting { 
  start, place_anchors, base, reinforcing, finished
}

/** Class Spider
 Creadora de la telaraña, el proceso va dictado por una serie de procesos
 indicados en el enum knitting
 **/
class Spider extends Agent { //Agregado herencia a Agent
  boolean arrived = false;
  knitting current;
  //float maxSpeed=4;
  //PVector acc; Ya se encuentra en el Agent
  SpiderWeb spiderWeb;
  Node goal;
  int level = 0;
  int rowIndex = 0;


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
    switch (current) {
    case finished:
      return;
    case start:
      startProcess();
      break;
    case place_anchors:
      placingAnchors();
      break;
    case base:
      placingBase();
      break;
    case reinforcing:
      placingReinforcement();
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

  void startProcess() {
    float dif = PVector.dist(spiderWeb.centerNode.pos, pos); 
    if (dif < 0.5) {

      goal = this.spiderWeb.anchors.get(1);
      current = knitting.place_anchors;
    }

    arrive(this.spiderWeb.centerNode.pos);

    super.update();
  }

  void placingAnchors() {
    if (spiderWeb.anchorsPlaced == 18) {
      current = knitting.base;
    }

    spiderWeb.placingAnchors();
  }

  void placingBase() {
    if (level == spiderWeb.levels && rowIndex == 0) { //Si estoy en el ultimo nivel
      print("\nA");
      current = knitting.reinforcing;
      arrived = false;
      return; //Go backwards with a better thread
    }

    if (rowIndex == 0 && !arrived) { //Suba un nivel
      print("\nB");
      int nextRow;
      int diff = spiderWeb.levels - level;
      if (diff > 4){
        nextRow = level + 4;
      } else if (diff == 0) {
        level = spiderWeb.levels;
        return;
      } else {
        nextRow = level + diff;
      }
    
      
      
      ArrayList<Node> row = spiderWeb.nodes[nextRow];
      PVector destiny = row.get(0).pos;

      float dif = PVector.dist(destiny, pos); 
      if (dif < 0.5) {
        level+=4;
        arrived = true;
        print("\nO");
      }
      print("\ndif"+dif);
      arrive(destiny);
    } else if (!arrived) {
      float dif = PVector.dist(goal.pos, pos); 
      if (dif < 0.5) {
        arrived = true;
      } else {
        arrive(goal.pos);
      }
    } else {
      print("\nC");

      ArrayList<Node> row = spiderWeb.nodes[level];
      Node n1 = row.get(rowIndex);
      rowIndex = (rowIndex + 4) % row.size();
      Node n2 = row.get(rowIndex);
      spiderWeb.springs.add(new Spring(n1, n2));

      goal = n2;
      arrived = false;
    }

    super.update();
  }
  
  void placingReinforcement() {
    if (level ==0) { //Trabajo terminado
      print("\nA");
      current = knitting.finished;
      return; //Go backwards with a better thread
    }

    if (rowIndex == 0 && !arrived) { //Suba un nivel
      print("\nB");

      ArrayList<Node> row = spiderWeb.nodes[level-1];
      PVector destiny = row.get(0).pos;

      float dif = PVector.dist(destiny, pos); 
      if (dif < 0.5) {
        level-=1;
        arrived = true;
        print("\nO");
      }
      print("\ndif"+dif);
      arrive(destiny);
    } else if (!arrived) {
      float dif = PVector.dist(goal.pos, pos); 
      if (dif < 0.5) {
        arrived = true;
      } else {
        arrive(goal.pos);
      }
    } else {
      print("\nC");

      ArrayList<Node> row = spiderWeb.nodes[level];
      Node n1 = row.get(rowIndex);
      rowIndex = (rowIndex + 5) % row.size();
      Node n2 = row.get(rowIndex);
      spiderWeb.springs.add(new Spring(n1, n2));

      goal = n2;
      arrived = false;
    }

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
