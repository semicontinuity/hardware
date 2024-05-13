import math
from gcode import *

DM=2
DE=2

W=254
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
        g_code.cylinder(x, y, 4-DM, g_code.Z_FROM, g_code.Z_TO, g_code.Z_STEP),

        g_code.counter_clockwise_arc(x=x, y=y, d=71.0, a=(0   + 15.0)/180.0*math.pi, b=(0   +  75.0)/180.0*math.pi),
        g_code.counter_clockwise_arc(x=x, y=y, d=71.0, a=(90  + 15.0)/180.0*math.pi, b=(90  + 75.0)/180.0*math.pi),
        g_code.counter_clockwise_arc(x=x, y=y, d=71.0, a=(180 + 15.0)/180.0*math.pi, b=(180 + 75.0)/180.0*math.pi),
        g_code.counter_clockwise_arc(x=x, y=y, d=71.0, a=(270 + 15.0)/180.0*math.pi, b=(270 + 75.0)/180.0*math.pi),

        g_code.deep_line(x + 10, 0,  x + 25, 0),
        g_code.deep_line(x - 10, 0,  x - 25, 0),
        g_code.deep_line(x, y - 10,  x, y - 25),
        g_code.deep_line(x, y + 10,  x, y + 25),
    )


def milling_program():
    return g_code.program(
        g_code.with_spindle(
            g_code.grid('ornaments', ornament, xstart=-71.0, xstop=71.0 + 71.0, xstep=71.0, ystart=0, ystop=1, ystep=1),

            g_code.cylinder(-W/2 + 10, -H/2 + 10, 4-DM, g_code.Z_FROM, g_code.Z_TO, g_code.Z_STEP),
            g_code.cylinder(-W/2 + 10,  H/2 - 10, 4-DM, g_code.Z_FROM, g_code.Z_TO, g_code.Z_STEP),
            g_code.cylinder( W/2 - 10, -H/2 + 10, 4-DM, g_code.Z_FROM, g_code.Z_TO, g_code.Z_STEP),
            g_code.cylinder( W/2 - 10,  H/2 - 10, 4-DM, g_code.Z_FROM, g_code.Z_TO, g_code.Z_STEP),

            g_code.deep_line(-W/2, -H/2,  W/2, -H/2),
            g_code.deep_line(-W/2, -H/2, -W/2,  H/2),
            g_code.deep_line( W/2, -H/2,  W/2,  H/2),
            g_code.deep_line(-W/2,  H/2,  W/2,  H/2),
        )
    )


def main():
    for e in traverse(milling_program()):
        print(e)


if __name__ == '__main__':
    main()
