from gcode import *

RM=1

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            gcode.pyramidoid(xstart=-114-RM, xstop=107+RM, ystart=-96.5-RM, ystop=48+RM, xstep=0, ystep=0, zstep=0.2, from_z=0, to_z=-3.2)
        )
    )


def gcode():
    gcode = GCode()
    gcode.FEED_RATE_XY = 960
    gcode.FEED_RATE_Z = 60
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 1
    gcode.Z_DOWN = -3.2
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
