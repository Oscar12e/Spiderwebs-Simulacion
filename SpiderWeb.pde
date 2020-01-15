class SpiderWeb {
  float radius;            
  Node centerNode;         //Referencia al centro de la red
  int levels = 10;
  ArrayList springs;
  ArrayList<Node> nodes[];
  
  SpiderWeb(float x, float y, float radio) {
    this.centerNode = new Node(x, y);
    this.radius = radio;
    this.nodes = new ArrayList[levels];
    createNodes();
  }

  SpiderWeb(float x, float y) {
    this(x, y, 100);
  }

  void createNodes() {
    //Esta creado del centro hacia afuera
    //Caso especial del centro
    ArrayList<Node> center = new ArrayList();
    center.add(centerNode);
    nodes[0] = center;
    
    //int pointsTimes = 1;
    for (int l = 1; l < levels; l++) {
      
      int numPoints = l == levels - 1? 10 : l  * 10;
      
   
      //if (l%3 == 0) pointsTimes+= 2;
      
      float angle=TWO_PI/(float) numPoints;
      ArrayList<Node> rowNodes = new ArrayList();
      //float rowRadius = l * 15;
      float rowRadius = l == levels - 1? l * 25 + 25 : l  * 25;

      for (int i = 0; i < numPoints; i++) {
        float x = centerNode.pos.x + rowRadius*sin(angle*i);
        float y = centerNode.pos.y + rowRadius * cos(angle*i);
        rowNodes.add(new Node(x, y));
      }
      
      nodes[l] = rowNodes;
    }
  }
  //Tan solo existe para tener referencia a los springs y los nodos
  
  
  
  void display(){
    for (int l = 0; l < levels; l++){
      for (Node node : nodes[l]){
        node.display();
      }
    }
  }
}
