CASE_THICKNESS = 2;

CASE_INNER_WIDTH = 50;
CASE_INNER_DEPTH = 40;

SPACE_BELOW_PCB = 2.4;
PCB_THICKNESS = 1.6;
POWER_CONNECTOR_HEIGHT = 0;
POWER_CONNECTORS_OPENING_WIDTH = 20;

PCB_TOP_Y       = CASE_THICKNESS + SPACE_BELOW_PCB + PCB_THICKNESS;
CASE_HEIGHT     = PCB_TOP_Y + POWER_CONNECTOR_HEIGHT;
STANDOFF_HEIGHT = PCB_THICKNESS + SPACE_BELOW_PCB;

M3_SCREW_SUNK_DEPTH = 1.7;
M3_SCREW_HEAD_DIAMETER = 6;
M3_SCREW_DIAMETER = 3;


module outer_shape() {
  linear_extrude(height = CASE_HEIGHT)
  polygon(
    [
      [0                - CASE_THICKNESS, 0                - CASE_THICKNESS],
      [CASE_INNER_WIDTH + CASE_THICKNESS, 0                - CASE_THICKNESS],
      [0                - CASE_THICKNESS, CASE_INNER_DEPTH + CASE_THICKNESS],
      [CASE_INNER_WIDTH + CASE_THICKNESS, CASE_INNER_DEPTH + CASE_THICKNESS],
    ],
    [
      [0, 1, 3, 2],  
    ]
  );
}

module inner_space() {
  translate([0,0,CASE_THICKNESS])
  linear_extrude(height = CASE_HEIGHT)
  polygon(
    [
      [0,                0],
      [CASE_INNER_WIDTH, 0],
      [0,                CASE_INNER_DEPTH],
      [CASE_INNER_WIDTH, CASE_INNER_DEPTH],
    ],
    [
      [0, 1, 3, 2],  
    ]
  );
}

module power_connectors_opening(height) {    
    translate([0, 0, height/2])
    cube([POWER_CONNECTORS_OPENING_WIDTH, CASE_THICKNESS, height], center=true);
}

module standoff(height) {
    translate([0, 0, height/2])
    cube([5, 5, height], center= true);
}

module standoff_hole(height) {
    
    union() {
        translate([0, 0, height/2]) cylinder(r=M3_SCREW_DIAMETER/2, h=height,center=true, $fn=72);
       
        translate([0, 0, M3_SCREW_SUNK_DEPTH/2]) cylinder(
            h = M3_SCREW_SUNK_DEPTH,
            r1 = M3_SCREW_HEAD_DIAMETER/2,
            r2 = M3_SCREW_DIAMETER/2,
            center = true,
            $fn=72
        );
    }
}

module case_base() {
    difference() {
        outer_shape();
        inner_space();
    }
}

module standoffs() {
        translate([2.5,                    2.5,                    0]) standoff(STANDOFF_HEIGHT);
        translate([CASE_INNER_WIDTH - 2.5, 2.5,                    0]) standoff(STANDOFF_HEIGHT);
        translate([2.5,                    CASE_INNER_DEPTH - 2.5, 0]) standoff(STANDOFF_HEIGHT);
        translate([CASE_INNER_WIDTH - 2.5, CASE_INNER_DEPTH - 2.5, 0]) standoff(STANDOFF_HEIGHT);    
}

module standoffs_holes() {
        translate([2.5,                    2.5,                    0]) standoff_hole(STANDOFF_HEIGHT);
        translate([CASE_INNER_WIDTH - 2.5, 2.5,                    0]) standoff_hole(STANDOFF_HEIGHT);
        translate([2.5,                    CASE_INNER_DEPTH - 2.5, 0]) standoff_hole(STANDOFF_HEIGHT);
        translate([CASE_INNER_WIDTH - 2.5, CASE_INNER_DEPTH- 2.5,  0]) standoff_hole(STANDOFF_HEIGHT);
}

difference() {    
    union() { case_base(); standoffs(); }    
    union() {
        standoffs_holes();
        
        translate([25, -CASE_THICKNESS/2, PCB_TOP_Y]) power_connectors_opening(CASE_HEIGHT - PCB_TOP_Y);
    }
}
