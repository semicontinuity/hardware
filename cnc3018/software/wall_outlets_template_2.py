import math
from gcode import *

D=70.5
DM=2
DE=2

W=234
H=114

def gcode():
    gcode = GCode()
    gcode.SPINDLE_SPEED = 1000
    gcode.FEED_RATE_XY = 720
    gcode.FEED_RATE_Z = 60
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 1
    gcode.Z_DOWN = -2
    gcode.Z_FROM = 1
    gcode.Z_TO = -1.5
    gcode.Z_STEP = 2.5
    return gcode


g_code = gcode()


def ornament(x, y):
    return (
        g_code.circle(x=x, y=y, d=D),
    )


def milling_program():
    return g_code.program(
        g_code.with_spindle(
            g_code.deep_line(-71/2 - 5, +15, -71/2 + 5, +15),
            g_code.deep_line(-71/2 - 5, -15, -71/2 + 5, -15),
            g_code.deep_line( 71/2 - 5, +15,  71/2 + 5, +15),
            g_code.deep_line( 71/2 - 5, -15,  71/2 + 5, -15),

            g_code.grid('ornaments', ornament, xstart=-71.0, xstop=71.0 + 71.0, xstep=71.0, ystart=0, ystop=1, ystep=1),

            g_code.cylinder(-W/2 + 10, -H/2 + 10, 4-DM, g_code.Z_FROM, g_code.Z_TO, g_code.Z_STEP),
            g_code.cylinder(-W/2 + 10,  H/2 - 10, 4-DM, g_code.Z_FROM, g_code.Z_TO, g_code.Z_STEP),
            g_code.cylinder( W/2 - 10, -H/2 + 10, 4-DM, g_code.Z_FROM, g_code.Z_TO, g_code.Z_STEP),
            g_code.cylinder( W/2 - 10,  H/2 - 10, 4-DM, g_code.Z_FROM, g_code.Z_TO, g_code.Z_STEP),
        )
    )


def main():
    for e in traverse(milling_program()):
        print(e)


if __name__ == '__main__':
    main()
