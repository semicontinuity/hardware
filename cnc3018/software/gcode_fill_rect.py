from gcode import *
               

def milling_program():
    return program(
        with_spindle(
            fill_rect_y(xstart=0, xstop=5, xstep=0.1, ystart=0, ystop=27)
        )
    )

def main():
    for e in traverse(milling_program()):
        print(e)

if __name__ == '__main__':
    main()
