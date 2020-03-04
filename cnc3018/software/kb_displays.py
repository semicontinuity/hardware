from gcode import *

RM=1
D=3

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            gcode.pyramidoid(xstart=-87.5-D+RM, xstop=-12.5+D-RM, ystart=17-D+RM, ystop=42+D-RM, xstep=0.1, ystep=0.1, zstep=0.1, from_z=0, to_z=-2.5),
            gcode.pyramidoid(xstart=-87.5-D+2.5+RM, xstop=-12.5+D-2.5-RM, ystart=17-D+2.5+RM, ystop=42+D-2.5-RM, xstep=0, ystep=0, zstep=0.2, from_z=-2.5, to_z=-3.5),
            gcode.pyramidoid(xstart=12.5-D+RM, xstop=87.5+D-RM, ystart=17-D+RM, ystop=42+D-RM, xstep=0.1, ystep=0.1, zstep=0.1, from_z=0, to_z=-2.5),
            gcode.pyramidoid(xstart=12.5-D+2.5+RM, xstop=87.5+D-2.5-RM, ystart=17-D+2.5+RM, ystop=42+D-2.5-RM, xstep=0, ystep=0, zstep=0.2, from_z=-2.5, to_z=-3.5),
        )
    )


def gcode():
    gcode = GCode()
    gcode.FEED_RATE_XY = 480
    gcode.FEED_RATE_Z = 60
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 1
    gcode.Z_DOWN = -3.7
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
