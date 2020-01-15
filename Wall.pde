class Wall {
  color c1,c2,c3;
  
  Wall(){
    c1=newColor();
    c2=newColor();
    c3=newColor();
  }
  
  void display(){
    fill(c1);
    rect(0,0,20,height);
    fill(c2);
    rect(width,0,-20,height);
    fill(c3);
    rect(0,height,width,-20);
  }
  
  color newColor(){
    return color(random(255),random(255),random(255));
  }
}
