//!OpenSCAD
CASE_THICKNESS_BOTTOM = 1.5;
CASE_THICKNESS_TOP = 1.5;
PCB_THICKNESS = 1;
CONNECTOR_HEIGHT = 6;

CASE_WIDTH = 45;
CASE_DEPTH = 25;
CASE_HEIGHT = CASE_THICKNESS_BOTTOM + PCB_THICKNESS + CONNECTOR_HEIGHT - CASE_THICKNESS_TOP;

CAVITY_WIDTH = 40;
CAVITY_DEPTH = CASE_DEPTH;
CAVITY_HEIGHT = PCB_THICKNESS + CONNECTOR_HEIGHT;

CUTOUT_P1_WIDTH = 5;
CUTOUT_P1_DEPTH = CASE_DEPTH - 2*CASE_THICKNESS;
CUTOUT_P1_HEIGHT = 0.6;
CUTOUT_P1_X = 10;
CUTOUT_P1_Y = CASE_DEPTH / 2;
CUTOUT_P1_Z = CASE_THICKNESS_BOTTOM - CUTOUT_B1_HEIGHT;

CUTOUT_P1_WIDTH = 5;
CUTOUT_P1_DEPTH = CASE_DEPTH - 2*CASE_THICKNESS;
CUTOUT_P1_HEIGHT = 0.6;
CUTOUT_P1_X = 35;
CUTOUT_P1_Y = CASE_DEPTH / 2;
CUTOUT_P1_Z = CASE_THICKNESS_BOTTOM - CUTOUT_B1_HEIGHT;

CUTOUT_C1_X = 40;
CUTOUT_C1_Y = CASE_DEPTH / 2;
CUTOUT_C1_Z = CASE_THICKNESS_BOTTOM + PCB_THICKNESS;
CUTOUT_C1_WIDTH = 10;
CUTOUT_C1_DEPTH = 4*2.54 + 2*0.2;
CUTOUT_C1_HEIGHT = CONNECTOR_HEIGHT;

CUTOUT_C2_X = 5;
CUTOUT_C2_Y = CASE_DEPTH / 2;
CUTOUT_C2_Z = CASE_THICKNESS_BOTTOM + PCB_THICKNESS;
CUTOUT_C2_WIDTH = 10;
CUTOUT_C2_DEPTH = 4*2.54 + 2*0.2;
CUTOUT_C2_HEIGHT = CONNECTOR_HEIGHT;


module box(x, y, z, w, d, h) {
  translate([x, y, z])
  linear_extrude(height = h)
  polygon(
    [
      [-w/2, -d/2],
      [+w/2, -d/2],
      [-w/2, +d/2],
      [+w/2, +d/2],
    ],
    [
      [0, 1, 3, 2],  
    ]
  );
}

module outer_shape() {
  box(
    CASE_WIDTH/2, CASE_DEPTH/2, 0,
    CASE_WIDTH, CASE_DEPTH, CASE_HEIGHT
  );
}

module cavity() {
  box(
    CASE_WIDTH/2, CASE_DEPTH/2, CASE_THICKNESS_BOTTOM,
    CAVITY_WIDTH, CAVITY_DEPTH, CAVITY_HEIGHT
  );
}


module cutout_pins() {
  box(CUTOUT_P1_X, CUTOUT_P1_Y, CUTOUT_P1_Z, CUTOUT_P1_WIDTH, CUTOUT_P1_DEPTH, CUTOUT_P1_HEIGHT);
  box(CUTOUT_P2_X, CUTOUT_P2_Y, CUTOUT_P2_Z, CUTOUT_P2_WIDTH, CUTOUT_C2_DEPTH, CUTOUT_P2_HEIGHT);
}

module cutout_connectors() {
  box(CUTOUT_C1_X, CUTOUT_C1_Y, CUTOUT_C1_Z, CUTOUT_C1_WIDTH, CUTOUT_C1_DEPTH, CUTOUT_C1_HEIGHT);
  box(CUTOUT_C2_X, CUTOUT_C2_Y, CUTOUT_C2_Z, CUTOUT_C2_WIDTH, CUTOUT_C2_DEPTH, CUTOUT_C2_HEIGHT);
}

module case_base() {
    difference() {
        outer_shape();
        cavity();
        //cutout_buttons();
        cutout_connectors();
    }
}

difference() {    
    union() { case_base();  }
}
