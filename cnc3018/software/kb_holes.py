from gcode import *

RM=1

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            gcode.cylinder(x=-78.5, y=-12.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=-59.5, y=-12.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=-40.5, y=-12.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=-21.5, y=-12.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=-78.5, y=-87.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=-59.5, y=-87.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=-40.5, y=-87.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=-21.5, y=-87.5, d=8-RM, zstep=0.2),

            gcode.cylinder(x=78.5, y=-12.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=59.5, y=-12.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=40.5, y=-12.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=21.5, y=-12.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=78.5, y=-87.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=59.5, y=-87.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=40.5, y=-87.5, d=8-RM, zstep=0.2),
            gcode.cylinder(x=21.5, y=-87.5, d=8-RM, zstep=0.2),

            gcode.pyramidoid(xstart=-88+RM, xstop=-12-RM, ystart=-47+RM, ystop=-28-RM, xstep=0, ystep=0, zstep=0.2),
            gcode.pyramidoid(xstart=-88+RM, xstop=-12-RM, ystart=-72+RM, ystop=-53-RM, xstep=0, ystep=0, zstep=0.2),
            gcode.pyramidoid(xstart=12+RM, xstop=88-RM, ystart=-47+RM, ystop=-28-RM, xstep=0, ystep=0, zstep=0.2),
            gcode.pyramidoid(xstart=12+RM, xstop=88-RM, ystart=-72+RM, ystop=-53-RM, xstep=0, ystep=0, zstep=0.2),
        )
    )


def gcode():
    gcode = GCode()
    gcode.FEED_RATE_XY = 720
    gcode.FEED_RATE_Z = 60
    gcode.Z_UP = 3
    gcode.Z_THRESHOLD = 1
    gcode.Z_DOWN = -4
    return gcode


def main():
    for e in traverse(milling_program(gcode())):
        print(e)


if __name__ == '__main__':
    main()
