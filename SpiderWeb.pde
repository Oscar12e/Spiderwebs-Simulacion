class SpiderWeb {
  float radius;            
  Node centerNode;         //Referencia al centro de la red
  int levels = 32;         //as spirals
  ArrayList<Spring> springs;       //All of them
  ArrayList<Node> nodes[];
  ArrayList<Node> anchors;
  

  int anchorsPlaced = 0; //Two are already placed

  SpiderWeb(float x, float y, float z, float radio) {
    this.centerNode = new Node(x, y);
    this.radius = radio;
    this.nodes = new ArrayList[levels];
    this.anchors = new ArrayList();
    this.springs = new ArrayList();
    createNodes();
    createAnchors();
  }

  SpiderWeb(float x, float y, float z) {
    this(x, y, z, 100);
  }

  void createNodes() {
    //Esta creado del centro hacia afuera

    //Caso especial del centro
    //Mejor de los casos seria quitarlo del todo :/
    for (int l = 0; l < levels; l++) {

      int numPoints =  (l+1)  * 20 ;

      float angle=TWO_PI/(float) numPoints;
      ArrayList<Node> rowNodes = new ArrayList();
      //float rowRadius = l  * 25;
      float rowRadius = l  * 6.25;

      ArrayList<Integer> indexes = new ArrayList();

      for (int p = 0; p < 20; p++) {
        indexes.add( l * p + p );
      }

      for (int i = 0; i < numPoints; i++) {
        float x = centerNode.pos.x + rowRadius*sin(angle*i);
        float y = centerNode.pos.y + rowRadius * cos(angle*i);

        if (indexes.contains(i)) {
          rowNodes.add(new Node(x, y));
        } else {
          float nx = randomGaussian() * 0.9 + x;
          float ny = randomGaussian() * 1.2 + y;
          rowNodes.add(new Node(nx, ny));
        }
      }

      nodes[l] = rowNodes;
    }
  }

  void createAnchors() {
    //At last we create the anchors
    int numPoints = 20;
    float angle=TWO_PI/(float) numPoints;
    float rowRadius = levels * 6.25 + 25;

    for (int i = 0; i < numPoints; i++) {
      float x = centerNode.pos.x + rowRadius*sin(angle*i);
      float y = centerNode.pos.y + rowRadius * cos(angle*i);
      Node n = new Node(x, y);
      n.fixed = true;
      anchors.add(n);
    }

    for (int i = 0; i < 1; i++) {
      Node n1 = anchors.get( i );
      Node n2 = anchors.get( (anchors.size() / 2) + i );

      //springs.add(new Spring(n1, n2));
    }

    placeAnchorThread(anchors.get( 0 ), 0);
    placeAnchorThread(anchors.get( (anchors.size() / 2) ), (anchors.size() / 2));
  }


  //Tan solo existe para tener referencia a los springs y los nodos

  void display() {
    for (int l = 0; l < levels; l++) {
      for (Node node : nodes[l]) {
        //node.display();
      }
    }

    for (Spring s : springs) {
      s.display();
    }

    for (Node a : anchors) {
      a.display();
    }
  }

  void placingAnchors() {
    int placingOn = anchorsPlaced + 1;

    Node node = anchors.get(placingOn);

    placeAnchorThread(node, placingOn);
    anchorsPlaced++;

    return;
  }

  void placeAnchorThread(Node anchor, int pos) {
    Node first = centerNode;
    Node second;

    for (int l = 0; l < levels; l++) {
      int levelSize = nodes[l].size();
      int index = (l) * pos + pos;
      //print("\n" + (l+1) + " " + pos + " = " + index + ", " + levelSize);

      if (index >= levelSize) continue;

      second = nodes[l].get(index);

      springs.add(new Spring(first, second));
      first = second;
    }

    springs.add(new Spring(first, anchor));
    //delay(1000);
  }


  void placeLongThread(Node origin, int level1, Node destiny, int level2) {
  }

  void placeBase() {
  }
}
