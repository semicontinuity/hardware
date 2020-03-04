from gcode import *

DM=1.5

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            gcode.cylinder(x=-10, y=0, d=15.8-DM, from_z=0, to_z=-2, zstep=0.2),
            gcode.cylinder(x=10, y=0, d=15.8-DM,  from_z=0, to_z=-2, zstep=0.2),
        )
    )


def gcode():
    gcode = GCode()
    gcode.FEED_RATE_XY = 720
    gcode.FEED_RATE_Z = 60
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 1
    gcode.Z_DOWN = -2
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
