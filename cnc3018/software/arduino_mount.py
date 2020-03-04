from gcode import *

D = 2.6
Z = -1

A_B = 5 + 3.5
A_W = 68

OLED_H = 33.5
OLED_Y = 5 + 100 - OLED_H/2 # center
OLED_MH_W = 95
OLED_MH_H = 28.5

#  +-------------+
#  |             |
#  |             |
#  |             |
#  |             |
#  +------0------+

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            # arduino
            gcode.cylinder(x=-A_W/2 + 15,          y=A_B + 50.5, d=D, from_z=0, to_z=Z, zstep=0.2),
            gcode.cylinder(x=-A_W/2 + 65.5,        y=A_B + 35,   d=D, from_z=0, to_z=Z, zstep=0.2),
            gcode.cylinder(x=-A_W/2 + 65.5,        y=A_B + 7,    d=D,  from_z=0, to_z=Z, zstep=0.2),
            gcode.cylinder(x=-A_W/2 + 15 - 1.3,    y=A_B + 2.5,  d=D, from_z=0, to_z=Z, zstep=0.2),

            # arduino case
#            gcode.cylinder(x=-17, y=5 + 30, d=3, from_z=0, to_z=-2, zstep=0.2),
#            gcode.cylinder(x=+17, y=5 + 30, d=3, from_z=0, to_z=-2, zstep=0.2),

            # OLED mounting holes
            gcode.cylinder(x=-OLED_MH_W/2, y = OLED_Y - OLED_MH_H/2, d=D, from_z=0, to_z=-2, zstep=0.2),
            gcode.cylinder(x=-OLED_MH_W/2, y = OLED_Y + OLED_MH_H/2, d=D, from_z=0, to_z=-2, zstep=0.2),
            gcode.cylinder(x=+OLED_MH_W/2, y = OLED_Y - OLED_MH_H/2, d=D, from_z=0, to_z=-2, zstep=0.2),
            gcode.cylinder(x=+OLED_MH_W/2, y = OLED_Y + OLED_MH_H/2, d=D, from_z=0, to_z=-2, zstep=0.2),

            # mounting holes
#            gcode.cylinder(x=-50, y = 5, d=3, from_z=0, to_z=-2, zstep=0.2),
#            gcode.cylinder(x=-50, y = 5 + 110, d=3, from_z=0, to_z=-2, zstep=0.2),
#            gcode.cylinder(x=+50, y = 5, d=3, from_z=0, to_z=-2, zstep=0.2),
            gcode.cylinder(x=+50, y = 5 + 110, d=3, from_z=0, to_z=Z, zstep=0.2),
        )
    )


def gcode():
    gcode = GCode()
    gcode.FEED_RATE_XY = 720
    gcode.FEED_RATE_Z = 60
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 1
    gcode.Z_DOWN = -1.2
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
