from gcode import *

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            gcode.grid('holes', gcode.round_rect, xstart=10, xstop=300, xstep=20, ystart=22, ystop=23, ystep=45, width=12-2, height=8-2, r=3)
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
