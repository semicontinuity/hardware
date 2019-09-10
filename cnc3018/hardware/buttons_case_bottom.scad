//!OpenSCAD
CAP_THICKNESS = 1.6;
CASE_THICKNESS = 2;
CASE_THICKNESS_TOP = 2;
CASE_THICKNESS_BOTTOM = 1;

CASE_TOP_WIDTH = 75;
CASE_TOP_DEPTH = 20;
CASE_TOP_HEIGHT = CASE_THICKNESS_TOP;

CASE_BOTTOM_WIDTH = CASE_TOP_WIDTH + 2*CAP_THICKNESS;
CASE_BOTTOM_DEPTH = CASE_TOP_DEPTH + 2*CAP_THICKNESS;
CASE_BOTTOM_HEIGHT = CASE_THICKNESS_BOTTOM;

CASE_WIDTH = CASE_TOP_WIDTH;
CASE_DEPTH = CASE_TOP_DEPTH;
CASE_HEIGHT = CASE_BOTTOM_HEIGHT + CASE_TOP_HEIGHT;

CUTOUT_HEIGHT = CASE_HEIGHT - CASE_THICKNESS_BOTTOM;

CUTOUT_B1_X = 14;
CUTOUT_B1_Y = CASE_DEPTH / 2;
CUTOUT_B1_WIDTH = 12;
CUTOUT_B1_DEPTH = CASE_DEPTH - 2*CASE_THICKNESS;

CUTOUT_B2_X = 31;
CUTOUT_B2_Y = CASE_DEPTH / 2;
CUTOUT_B2_WIDTH = 12;
CUTOUT_B2_DEPTH = CASE_DEPTH - 2*CASE_THICKNESS;

CUTOUT_B3_X = 48;
CUTOUT_B3_Y = CASE_DEPTH / 2;
CUTOUT_B3_WIDTH = 12;
CUTOUT_B3_DEPTH = CASE_DEPTH - 2*CASE_THICKNESS;

CUTOUT_C_X = 66;
CUTOUT_C_Y = CASE_DEPTH / 2;
CUTOUT_C_WIDTH = 8;
CUTOUT_C_DEPTH = CASE_DEPTH - 2*CASE_THICKNESS;

HOLE1_X = 4;
HOLE1_Y = CASE_DEPTH / 2;

HOLE2_X = 58;
HOLE2_Y = CASE_DEPTH / 2;


HOLE_DIAMETER = 4;


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
    CASE_BOTTOM_WIDTH, CASE_BOTTOM_DEPTH, CASE_BOTTOM_HEIGHT
  );
  box(
    CASE_WIDTH/2, CASE_DEPTH/2, CASE_BOTTOM_HEIGHT,
    CASE_TOP_WIDTH, CASE_TOP_DEPTH, CASE_TOP_HEIGHT
  );
}

module cutout(x, y, w, d) {
  translate([x, y, CASE_THICKNESS_BOTTOM])
  linear_extrude(height = CUTOUT_HEIGHT)
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

module cutout_buttons() {
  cutout(CUTOUT_B1_X, CUTOUT_B1_Y, CUTOUT_B1_WIDTH, CUTOUT_B1_DEPTH);
  cutout(CUTOUT_B2_X, CUTOUT_B2_Y, CUTOUT_B2_WIDTH, CUTOUT_B2_DEPTH);
  cutout(CUTOUT_B3_X, CUTOUT_B3_Y, CUTOUT_B3_WIDTH, CUTOUT_B3_DEPTH);
}

module cutout_connector() {
  cutout(CUTOUT_C_X, CUTOUT_C_Y, CUTOUT_C_WIDTH, CUTOUT_C_DEPTH);
}

module hole(height) {
  translate([0, 0, height/2]) cylinder(r=HOLE_DIAMETER/2, h=height, center=true, $fn=72);
}

module holes() {
  translate([HOLE1_X, HOLE1_Y, 0]) hole(CASE_HEIGHT);
  translate([HOLE2_X, HOLE1_Y, 0]) hole(CASE_HEIGHT);
}

module case_base() {
    difference() {
        outer_shape();
        cutout_buttons();
        cutout_connector();
        holes();
    }
}

difference() {    
    union() { case_base();  }
}
