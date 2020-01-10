//For Cp5 issues, not clean code I know
float rlh = 60; //float rest lenght
float k = 0.3;

public class Spring {
  Agent a1;
  Agent a2;

  Spring(Agent a1, Agent a2) {
    this.a1 = a1;
    this.a2 = a2;
  }

  void update() {    
    PVector diff =  PVector.sub(a2.pos, a1.pos);
    float dist = diff.mag();
    diff.normalize();
    float x = dist - rlh;
    diff.mult(-k * x);
    if (!a2.fixed) a2.applyForce(diff);
    diff.mult(-1);
    if (!a1.fixed) a1.applyForce(diff);
  }

  public void display() {
    stroke(#3BFC80);
    strokeWeight(1);
    line(a1.pos.x, a1.pos.y, a1.pos.z, a2.pos.x, a2.pos.y, a2.pos.z);
  }
}
