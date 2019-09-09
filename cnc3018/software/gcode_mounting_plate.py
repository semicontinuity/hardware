from gcode import *
               

def milling_program():
    return program(
        with_spindle(
            grid('mounting holes', circle, xstart=5, xstop=260, xstep=250, ystart=63, ystop=150, ystep=77, d=4),
            grid('holes', circle, xstart=15, xstop=250, xstep=10, ystart=15, ystop=140, ystep=10, d=3)
        )
    )

def main():
    for e in traverse(milling_program()):
        print(e)

if __name__ == '__main__':
    main()
