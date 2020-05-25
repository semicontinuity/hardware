from gcode import *

WIDTH=200
HEIGHT=40
RM=1

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            # BNC connector
            gcode.cylinder(x=20,      y=0, d=16.2-RM, zstep=0.2),

            # X stepper connector
            gcode.cylinder(x=20 + 22, y=0, d=16.2-RM, zstep=0.2),
            # Y stepper connector
            gcode.cylinder(x=20 + 44, y=0, d=16.2-RM, zstep=0.2),
            # Z stepper connector
            gcode.cylinder(x=20 + 66, y=0, d=16.2-RM, zstep=0.2),

            # dimensions
            gcode.pyramidoid(xstart=0-RM, xstop=WIDTH-RM, ystart=-HEIGHT/2-RM, ystop=HEIGHT/2 + RM, xstep=0, ystep=0, zstep=0.2),
        )
    )


def gcode():
    gcode = GCode()
    gcode.FEED_RATE_XY = 360
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
