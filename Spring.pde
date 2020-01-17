class Spring {
  Node a1;
  Node a2;
  float restLength;
  float k; //Coeficiente de elasticidad
  
  //En general se cambiaron los posX y posY a: pos.x y pos.y respectivamente
  Spring(Node a1, Node a2, float restLength, float k ) {
    this.a1=a1;
    this.a2=a2;
    this.restLength=restLength;
    this.k=k;
  }
  
  Spring(Node a1, Node a2 ) {
    this(a1, a2, 60, 0.2);
  }

  void display(){
    //stroke(random(255),random(255),random(255));
    stroke(255);
    strokeWeight(0.5);
    
    line(a1.pos.x,a1.pos.y, a1.pos.z, a2.pos.x,a2.pos.y, a2.pos.z);
  }
  
  void update(){
    PVector pos1 = a1.pos.copy();// new PVector(a1.pos.x,a1.pos.y, a1.pos.z);
    PVector pos2 = a2.pos.copy();// new PVector(a2.pos.x,a2.pos.y, a2.pos.z); 
    PVector dif= PVector.sub(pos2,pos1);
    float dist= dif.mag();
    dif.normalize();
    float x = dist - restLength;
    dif.mult(-k * x);  //Formula para la elasticidad
    a2.applyForce(dif);
    dif.mult(-1);
    a1.applyForce(dif);    
  }
}
