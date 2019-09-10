FEED_RATE_XY = 100
FEED_RATE_Z = 30

Z_UP = 2
Z_DOWN = -1.8

SPINDLE_DWELL_TIME = 3


def traverse(elements):
    for e in elements:
        if type(e) is str:
            yield e
        else:
            yield from traverse(e)


def program(*contents):
    return (
        header(),
        *contents,
    )


def with_spindle(*what):
    return (
        mill_up(),
        spindle_start(),
        spindle_wait(),
        *what,
        '',
        spindle_stop(),
    )


def header():
    return (
        'G21 (Metric Mode)',
        'G90 (Absolute Coordinates)',
    )    


def spindle_start():
    return 'M03 (Start spindle)'


def spindle_wait():
    return f'G04 P{SPINDLE_DWELL_TIME} (Wait for spindle)'


def spindle_stop():
    return 'M05 (Stop spindle)'


def mill_up():
    return f'G01 Z{Z_UP} (mill up)'


def mill_down():
    return f'G01 Z{Z_DOWN} F{FEED_RATE_Z} (mill down)'


def grid(name, f, xstart, xstop, xstep, ystart, ystop, ystep, *args, **kwargs):
    return (
        '',
        f'({name})',
        (f(x, y, *args, **kwargs) for x in range(xstart, xstop, xstep) for y in range(ystart, ystop, ystep)),
    )
    

def fill_rect_x(xstart, ystart, xstop, ystop, ystep):
    return (
        '',
        f'(fill_rect_x at xstart={xstart}, ystart={ystart}, xstop={xstop}, ystop={ystop}, ystep={ystep})',
        (
            (
                position(xstart if i % 2 == 0 else xstop, ystart + i*ystep),
                mill_down(),
                line_to(xstop if i % 2 == 0 else xstart, ystart + i*ystep),
                mill_up(),
            ) for i in range(int((ystop - ystart) / ystep))
        )
    )


def fill_rect_y(xstart, ystart, xstop, ystop, xstep):
    return (
        '',
        f'(fill_rect_y at xstart={xstart}, ystart={ystart}, xstop={xstop}, ystop={ystop}, xstep={xstep})',
        (
            (
                position(xstart + i*xstep, ystart if i % 2 == 0 else ystop),
                mill_down(),
                line_to(xstart + i*xstep, ystop if i % 2 == 0 else ystart),
                mill_up(),
            ) for i in range(int((xstop - xstart) / xstep))
        )
    )


def circle(x, y, d):
    return (
        '',
        f'(circle at x={x}, y={y}, d={d})',
        position(x - d/2, y),
        mill_down(),
        clockwise_arc_to(x, y + d/2, d/2, 0),
        clockwise_arc_to(x + d/2, y, 0, -d/2),
        clockwise_arc_to(x, y - d/2, -d/2, 0),
        clockwise_arc_to(x - d/2, y, 0, d/2),
        mill_up(),
    )


def round_rect(x, y, width, height, r):
    return (
        '',
        f'(round_rect at x={x}, y={y}, width={width}, height={height}, r={r})',
        position(x - width/2, y + height/2 - r),
        mill_down(),
        clockwise_arc_to(x - width/2 + r, y + height/2, r, 0),
        line_to(x + width/2 - r, y + height/2),
        clockwise_arc_to(x + width/2, y + height/2 - r, 0, -r),
        line_to(x + width/2, y - height/2 + r),
        clockwise_arc_to(x + width/2 - r, y - height/2, -r, 0),
        line_to(x - width/2 + r, y - height/2),
        clockwise_arc_to(x - width/2, y - height/2 + r, 0, r),
        line_to(x - width/2, y + height/2 - r),
        mill_up(),
    )


def position(x, y):
    return f'G00 X{x} Y{y}'


def line_to(x, y):
    return f'G01 X{x} Y{y} F{FEED_RATE_XY}'


def clockwise_arc_to(x, y, i, j):
    return f'G02 X{x} Y{y} I{i} J{j} F{FEED_RATE_XY}'
