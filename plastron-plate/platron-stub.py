from gcode import *

WIDTH=249.6
HEIGHT=47.6
THICK=8
RM=1.5

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            'E',
            gcode.deep_line(-WIDTH/2 - RM, -HEIGHT/2 - RM, -WIDTH/2 - RM, +HEIGHT/2 + RM),
            'W',
            gcode.deep_line(+WIDTH/2 + RM, -HEIGHT/2 - RM, +WIDTH/2 + RM, +HEIGHT/2 + RM),

            'N',
            gcode.deep_line(-WIDTH/2 - RM, +HEIGHT/2 + RM, +WIDTH/2 + RM, +HEIGHT/2 + RM),
            'S',
            gcode.deep_line(-WIDTH/2 - RM, -HEIGHT/2 - RM, +WIDTH/2 + RM, -HEIGHT/2 - RM),

        )
    )

def gcode():
    gcode = GCode()
    gcode.SPINDLE_SPEED = 1000
    gcode.FEED_RATE_XY = 120
    gcode.FEED_RATE_Z = 60
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 1
    gcode.Z_FROM = 0
    gcode.Z_DOWN = -THICK-1
    gcode.Z_STEP = 0.02
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
