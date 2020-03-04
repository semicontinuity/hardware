from gcode import *

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            gcode.grid('ventilation holes', gcode.hole, xstart=-22.5, xstop=22.5 + 7.5, xstep=7.5, ystart=-45, ystop=45 + 7.5, ystep=7.5)
        )
    )


def gcode():
    gcode = GCode()
    gcode.FEED_RATE_XY = 30
    gcode.FEED_RATE_Z = 5
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 0.1
    gcode.Z_DOWN = -1
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
