from gcode import *

WIDTH=249.6
HEIGHT=149.6
THICK=8
RM=1.5

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            'screw openings',
            (
                (
                    gcode.cylinder(x, y, d=5-2*RM, z_from=0, z_to=-THICK - 1, z_step=0.4)
                )
                for x in [-87.5, -62.5, -37.5, -12.5, 12.5, 37.5, 62.5, 87.5] for y in [-62.5, -37.5, -12.5, 12.5, 37.5, 62.5]
            ),

            openings(gcode, -230/2),
            openings(gcode, +230/2),

            'E',
            gcode.deep_line(-WIDTH/2 - RM, -HEIGHT/2 - RM, -WIDTH/2 - RM, +HEIGHT/2 + RM),
            'W',
            gcode.deep_line(+WIDTH/2 + RM, -HEIGHT/2 - RM, +WIDTH/2 + RM, +HEIGHT/2 + RM),

            'N',
            gcode.deep_line(-WIDTH/2 - RM, +HEIGHT/2 + RM, +WIDTH/2 + RM, +HEIGHT/2 + RM),
            'S',
            gcode.deep_line(-WIDTH/2 - RM, -HEIGHT/2 - RM, +WIDTH/2 + RM, -HEIGHT/2 - RM),

        )
    )

def openings(g, center_x):
    return g.grid('openings', xstart=center_x, ystart=-62.5, xstop=center_x + 1, ystop=62.5 + 25, xstep=25, ystep=25,
          element=lambda x, y: g.deep_round_rect_at(x, y, width= 10 - 2*RM, height=5 - 2*RM, r=5/2-RM, center=True)
    )

def gcode():
    gcode = GCode()
    gcode.SPINDLE_SPEED = 1000
    gcode.FEED_RATE_XY = 120
    gcode.FEED_RATE_Z = 60
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 1
    gcode.Z_FROM = 0
    gcode.Z_DOWN = -THICK-1
    gcode.Z_STEP = 0.02
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
