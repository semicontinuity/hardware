from gcode import *


def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            gcode.grid('mounting holes', gcode.circle, xstart=5, xstop=260, xstep=250, ystart=63, ystop=150, ystep=77, d=4),
            gcode.grid('holes', gcode.circle, xstart=15, xstop=250, xstep=10, ystart=15, ystop=140, ystep=10, d=2.6)
        )
    )

def gcode():
    gcode = GCode()
    gcode.FEED_RATE_XY = 30
    gcode.FEED_RATE_Z = 30
    gcode.Z_UP = 3
    gcode.Z_DOWN = -7.5
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
