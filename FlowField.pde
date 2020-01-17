class FlowField {
  PVector[][][] grid;
  float resolution;
  int rows;
  int cols;
  int depth;
  float defaultMag;
  float noiseRes = 0.05;
  float timeInc = 0.01;
  float timeOffset = 0.01;

  FlowField(float resolution, float defaultMag) {
    this.resolution = resolution;
    this.defaultMag = defaultMag;
    rows = (int)(height/resolution) + 1;
    cols = (int)(width/resolution) + 1;
    depth = (int)(height/resolution) + 1;
    initGrid();
    updateVectors();
  }

  void initGrid() {
    grid = new PVector[rows][cols][depth];
  }

  void updateVectors() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        for (int d = 0; d < depth; d++) {
          float angle = noise((float)r * noiseRes, (float)c * noiseRes, timeOffset);
          angle += map(angle, 0, 2.5, 0, 6 * PI);
          grid[r][c][d] = PVector.fromAngle(angle);
          grid[r][c][d].setMag(defaultMag);
        }
      }
    }
    timeOffset += timeInc;
  }

  void update() {
    updateVectors();
  }

  void display() {
    for (int r = 0; r < rows; r++) {
      for (int c = 0; c < cols; c++) {
        for (int d = 0; d < depth; d++) {
          displayVector(grid[r][c][d], c * resolution, r * resolution);
        }
      }
    }
  }

  void displayVector(PVector vector, float x, float y) {
    PVector v = vector.copy();
    v.setMag(resolution/2);
    pushMatrix();
    translate(x + resolution/2, y + resolution/2);
    stroke(255, 20);
    line(0, 0, v.x, v.y);
    popMatrix();
  }


  PVector getForce(float x, float y, float z) {
    if (x < 0 || x > width || y < 0 || y > height || z < 0 || z > height)
    {
      return new PVector(0, 0);
    }
    int r = (int)(y/resolution);
    int c = (int)(x/resolution);
    int d = (int)(z/resolution);
    return grid[r][c][d];
  }
}
