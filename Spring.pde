class Spring {
  Node a1;
  Node a2;
  float restLength;
  float k; //Coeficiente de elasticidad

  Spring(Node a1, Node a2, float restLength, float k ) {
    this.a1=a1;
    this.a2=a2;
    this.restLength=restLength;
    this.k=k;
  }

  void display(){
    //stroke(random(255),random(255),random(255));
    stroke(255);
    strokeWeight(0.5);
    line(a1.posX,a1.posY,a2.posX,a2.posY);
  }
  
  void update(){
    PVector pos1 = new PVector(a1.posX,a1.posY);
    PVector pos2 = new PVector(a2.posX,a2.posY); 
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
