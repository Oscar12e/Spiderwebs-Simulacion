import controlP5.*;

ControlP5 cp5;
ArrayList<Carnada> carnadas;

void setup() {
  size(500, 500);
  background(0);
  initControls();
  carnadas = new ArrayList();
}

void initControls() {
  cp5 = new ControlP5(this);
  cp5.addSlider("Gravedad")
    .setPosition(5, 5)
    .setSize(100, 15)
    .setRange(0, 20)
    .setValue(10);

  cp5.addSlider("Viento")
    .setPosition(5, 25)
    .setSize(100, 15)
    .setRange(0, 20)
    .setValue(10);
}

void draw() {
  background(0);
  for (Carnada c : carnadas) {
    c.display();
    c.update();
  }
}

void mousePressed() {
  Carnada c = new Carnada(mouseX, mouseY);
  carnadas.add(c);
}
