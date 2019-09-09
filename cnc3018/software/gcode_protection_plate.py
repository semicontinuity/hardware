from gcode import *
               

def milling_program():
    return program(
        with_spindle(
            grid('holes', round_rect, xstart=10, xstop=300, xstep=20, ystart=22, ystop=180, ystep=45, width=10-2, height=5-2, r=2.5)
        )
    )

def main():
    for e in traverse(milling_program()):
        print(e)

if __name__ == '__main__':
    main()
