import peasy.*;
PeasyCam cam;

ArrayList<Spring> springs;

Spider spider;
float k;

FlowField field;

ArrayList<Node> nodesEspiral;
ArrayList<Spring> springsEspiral;
ArrayList<Prey> preys; //presas

//Oscar
PVector center;
Spider spidy;
SpiderWeb spiderWeb;
ArrayList<Node> anchors;

void setup() {
  size(900, 900, P3D);
  background(0);
  cam = new PeasyCam(this, width/2, height/2, 0, width);

  field = new FlowField(50, 1);
  preys = new ArrayList();
  springsEspiral = new ArrayList();

  center = new PVector(width/2, height/2);
  spiderWeb = new SpiderWeb(center.x, center.y);
  anchors = spiderWeb.nodes[spiderWeb.levels-1];

  Node spiderStart = anchors.get(0);
  Node spiderFinish = anchors.get( int( anchors.size()/2) );

  spidy = new Spider(spiderStart.pos.x, spiderStart.pos.y);
  spidy.spiderWeb = spiderWeb;

  spider = new Spider(spiderFinish.pos.x, spiderFinish.pos.y);
  spider.spiderWeb = spiderWeb; 


  //Ir de punto a punto de las anclas
  for (int i = 0; i < anchors.size()/2; i++) {
    Node n1 = anchors.get( i );
    Node n2 = anchors.get( (anchors.size() / 2) + i );
    n1.fixed = true;
    n2.fixed = true;
    springsEspiral.add(new Spring(n1, n2));
  }

  for (int k = 0; k < spiderWeb.nodes.length; k++) {
    int n = spiderWeb.nodes[k].size();
    for (int i = 0; i < n; i++) {
      Node n1 = spiderWeb.nodes[k].get( (i-1+n)%n  );
      Node n2 = spiderWeb.nodes[k].get( (i+n)%n);
      Node n3 = spiderWeb.nodes[k].get( (i+1+n)%n);
      springsEspiral.add(new Spring(n1, n2));
      springsEspiral.add(new Spring(n2, n3));
    }
  }



  //spidy.buildWeb( new Node(center.x, center.y));
}

void draw() {
  background(0);

  stroke(255);
  
  field.update();

  spidy.spiderWeb.display();
  spidy.display();

  spider.display();

  for (Spring s : springsEspiral) s.display();

  spider.update();

  for (Prey p : preys) {
    p.display();
    p.update();
    p.arrive((new PVector(mouseX, mouseY, mouseX)).mult(-1));
  }
}

void mousePressed() {
  if (mouseButton == RIGHT) {
    Prey prey = new Prey(mouseX, mouseY);
    prey.applyForce(PVector.random3D().setMag(100));
    preys.add(prey);
  }
}
/*
void setup() {
 size(500, 500, P2D);
 background(0);
/*
 springs=new ArrayList();
 nodes=new ArrayList();
 nodesEspiral = new ArrayList();
 springsEspiral = new ArrayList();
 wall = new Wall();
 rNode = random(3, height/3); //punto definido para luego aumentarlo
 */

//spider.initialTravel(node1,node2);
//springs.add(new Spring(node1,node2,node2.posX - node1.posX, k));
//springs.add(new Spring(node1,node2,random(100,200), k));
//springs.add(new Spring(node1_2,node3,node3.posX - node1_2.posX, k));
//}



/*
void draw() {
 background(0);
 wall.display();
 for (Node node : nodes) {
 node.update();
 node.display();
 }
 for (Node node : nodesEspiral) {
 node.update();
 node.display();
 }
 if (spider != null) {
 spider.update();
 if (!spider.arrived)spider.initialTravel();
 if (spider.arrived) {
 springs.add(new Spring(leftNode, rightNode, random(100, 200), k));
 //springs.add(new Spring(leftNode,downNode,random(100,200),k));
 //springs.add(new Spring(rightNode,downNode,random(100,200),k));
 }
 spider.display();
 }
 for (Spring spring : springs) {
 spring.update();
 spring.display();
 }
 for (Spring spring : springsEspiral) {
 spring.update();
 spring.display();
 }
 }*/

/*

 void mousePressed()
 {
 if (posX  == 9999 && posY == 9999) {
 posX = mouseX; 
 posY = mouseY;
 }
 if (nodos > 39)
 iniciarEspiral(posX, posY);
 else {
 iniciarConstruccion(posX, posY);
 rNode += 20;
 }
 }
 
 void keyPressed()
 {
 if (key == ' ') {
 nodes.clear();
 springs.clear();
 spider = null;
 }
 }*/
