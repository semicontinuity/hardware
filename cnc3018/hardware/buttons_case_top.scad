//!OpenSCAD
CASE_THICKNESS = 1.6;
CASE_THICKNESS_TOP = 1.6;

INNER_WIDTH = 75;
INNER_DEPTH = 20;
INNER_HEIGHT = 10;
BOTTOM_PLATE_HEIGHT = 2;
PCB_HEIGHT = 1.6;

CASE_WIDTH = INNER_WIDTH + 2*CASE_THICKNESS;
CASE_DEPTH = INNER_DEPTH + 2*CASE_THICKNESS;
CASE_HEIGHT = BOTTOM_PLATE_HEIGHT + INNER_HEIGHT + CASE_THICKNESS_TOP;

CAVITY_WIDTH = INNER_WIDTH;
CAVITY_DEPTH = INNER_DEPTH;
CAVITY_HEIGHT = BOTTOM_PLATE_HEIGHT + INNER_HEIGHT;

CUTOUT_C_X = INNER_WIDTH + CASE_THICKNESS/2;
CUTOUT_C_Y = INNER_DEPTH / 2;
CUTOUT_C_Z = 0;
CUTOUT_C_WIDTH = CASE_THICKNESS;
CUTOUT_C_DEPTH = 4*2.54 + 2*0.2;
CUTOUT_C_HEIGHT = BOTTOM_PLATE_HEIGHT + PCB_HEIGHT + 6 + 0.2;

HOLE1_X = 14;
HOLE1_Y = INNER_DEPTH / 2;

HOLE2_X = 31;
HOLE2_Y = INNER_DEPTH / 2;

HOLE3_X = 48;
HOLE3_Y = INNER_DEPTH / 2;

HOLE_DIAMETER = 12;


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
  translate([-CASE_THICKNESS, -CASE_THICKNESS, 0])
  box(CASE_WIDTH/2, CASE_DEPTH/2, 0, CASE_WIDTH, CASE_DEPTH, CASE_HEIGHT);
}

module cavity() {
  box(CAVITY_WIDTH/2, CAVITY_DEPTH/2, 0, CAVITY_WIDTH, CAVITY_DEPTH, CAVITY_HEIGHT);
}
              
module cutout_connector() {
  box(CUTOUT_C_X, CUTOUT_C_Y, CUTOUT_C_Z, CUTOUT_C_WIDTH, CUTOUT_C_DEPTH, CUTOUT_C_HEIGHT);
}

module hole(height) {
  translate([0, 0, height/2]) cylinder(r=HOLE_DIAMETER/2, h=height, center=true, $fn=72);
}

module holes() {
  translate([HOLE1_X, HOLE1_Y, 0]) hole(CASE_HEIGHT);
  translate([HOLE2_X, HOLE2_Y, 0]) hole(CASE_HEIGHT);
  translate([HOLE3_X, HOLE3_Y, 0]) hole(CASE_HEIGHT);
}

module case_base() {
    difference() {
        outer_shape();
        cavity();
        cutout_connector();
        holes();
    }
}

difference() {    
    rotate([180,0,0]) translate([0, 0, -CASE_HEIGHT]) case_base();
}
