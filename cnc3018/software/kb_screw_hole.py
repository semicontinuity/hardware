from gcode import *

RM=1

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            gcode.cut_cone(x=0, y=0, d=6.4-2, to_z=-1.7, xystep=0.1, zstep=0.1),
            gcode.cylinder(x=0, y=0, d=3-2, from_z=-2, to_z=-3.3, zstep=0.25),
        )
    )


def gcode():
    gcode = GCode()
    gcode.FEED_RATE_XY = 720
    gcode.FEED_RATE_Z = 60
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 1
    gcode.Z_DOWN = -3.5
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
