import peasy.*;
PeasyCam cam;

ArrayList<Spring> springs;

Spider spider;
ArrayList<Node> nodesEspiral;
ArrayList<Spring> springsEspiral;


//Oscar
PVector center;
Spider spidy;
SpiderWeb spiderWeb;
ArrayList<Node> anchors;

void setup() {
  size(900, 900, P3D);
  background(0);
  cam = new PeasyCam(this, width/2, height/2, 0, width);
  

  center = new PVector(width/2, height/2);
  spiderWeb = new SpiderWeb(center.x, center.y, center.x); //Cambie el tercer parametro
  anchors = spiderWeb.anchors;

  Node spiderStart = anchors.get(0);
  Node spiderFinish = anchors.get( int( anchors.size()/2) );

  spidy = new Spider(spiderStart.pos.x, spiderStart.pos.y);
  spidy.spiderWeb = spiderWeb;

  spider = new Spider(spiderFinish.pos.x, spiderFinish.pos.y);
  spider.spiderWeb = spiderWeb; 

  }

  void draw() {
    background(0);

    stroke(255);

    spiderWeb.display();
    spidy.display();
    spidy.update();


    //for (Spring s : springsEspiral) s.display();
    
 
  
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
