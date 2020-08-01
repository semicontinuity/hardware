from gcode import *

DM=0.8
DE=3.2

def milling_program(gcode):
    return gcode.program(
        gcode.with_spindle(
            gcode.cylinder(x=-37.5, y=0, d=8-DM, zstep=0.4, from_z=0, to_z=-DE),
            gcode.pyramidoid(xstart=-37.5-1.5+DM/2, xstop=-37.5+1.5-DM/2, ystart=-8.1, ystop=-7.9, xstep=0, ystep=0, zstep=0.4, from_z=0, to_z=-2.4),

            gcode.cylinder(x=-12.5, y=0, d=8-DM, zstep=0.4, from_z=0, to_z=-DE),
            gcode.pyramidoid(xstart=-12.5-1.5+DM/2, xstop=-12.5+1.5-DM/2, ystart=-8.1, ystop=-7.9, xstep=0, ystep=0, zstep=0.4, from_z=0, to_z=-2.4),

            gcode.cylinder(x=+12.5, y=0, d=8-DM, zstep=0.4, from_z=0, to_z=-DE),
            gcode.pyramidoid(xstart=+12.5-1.5+DM/2, xstop=+12.5+1.5-DM/2, ystart=-8.1, ystop=-7.9, xstep=0, ystep=0, zstep=0.4, from_z=0, to_z=-2.4),

            gcode.cylinder(x=+37.5, y=0, d=8-DM, zstep=0.4, from_z=0, to_z=-DE),
            gcode.pyramidoid(xstart=+37.5-1.5+DM/2, xstop=+37.5+1.5-DM/2, ystart=-8.1, ystop=-7.9, xstep=0, ystep=0, zstep=0.4, from_z=0, to_z=-2.4),

            gcode.pyramidoid(xstart=-50-DM/2, xstop=50+DM/2, ystart=-10-DM/2, ystop=+10+DM/2, xstep=0, ystep=0, zstep=0.4, from_z=0, to_z=-DE)
        )
    )


def gcode():
    gcode = GCode()
    gcode.SPINDLE_SPEED = 1000
    gcode.FEED_RATE_XY = 720
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
