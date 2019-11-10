def traverse(elements):
    for e in elements:
        if type(e) is str:
            yield e
        else:
            yield from traverse(e)


class GCode(object):
    FEED_RATE_XY = None
    FEED_RATE_Z = None

    Z_UP = None
    Z_DOWN = None

    SPINDLE_DWELL_TIME = 3

    def program(self, *contents):
        return (
            self.header(),
            *contents,
        )

    def with_spindle(self, *what):
        return (
            self.mill_up(),
            self.spindle_start(),
            self.spindle_wait(),
            *what,
            '',
            self.spindle_stop(),
        )

    def header(self):
        return (
            'G21 (Metric Mode)',
            'G90 (Absolute Coordinates)',
        )

    def spindle_start(self):
        return 'M03 (Start spindle)'

    def spindle_wait(self):
        return f'G04 P{self.SPINDLE_DWELL_TIME} (Wait for spindle)'

    def spindle_stop(self):
        return 'M05 (Stop spindle)'

    def mill_up(self):
        return f'G01 Z{self.Z_UP} (mill up)'

    def mill_down(self):
        return f'G01 Z{self.Z_DOWN} F{self.FEED_RATE_Z} (mill down)'

    def grid(self, name, f, xstart, xstop, xstep, ystart, ystop, ystep, *args, **kwargs):
        return (
            '',
            f'({name})',
            (f(x, y, *args, **kwargs) for x in range(xstart, xstop, xstep) for y in range(ystart, ystop, ystep)),
        )

    def fill_rect_x(self, xstart, ystart, xstop, ystop, ystep):
        return (
            '',
            f'(fill_rect_x at xstart={xstart}, ystart={ystart}, xstop={xstop}, ystop={ystop}, ystep={ystep})',
            (
                (
                    self.position(xstart if i % 2 == 0 else xstop, ystart + i*ystep),
                    self.mill_down(),
                    self.line_to(xstop if i % 2 == 0 else xstart, ystart + i*ystep),
                    self.mill_up(),
                ) for i in range(int((ystop - ystart) / ystep))
            )
        )

    def fill_rect_y(self, xstart, ystart, xstop, ystop, xstep):
        return (
            '',
            f'(fill_rect_y at xstart={xstart}, ystart={ystart}, xstop={xstop}, ystop={ystop}, xstep={xstep})',
            (
                (
                    self.position(xstart + i*xstep, ystart if i % 2 == 0 else ystop),
                    self.mill_down(),
                    self.line_to(xstart + i*xstep, ystop if i % 2 == 0 else ystart),
                    self.mill_up(),
                ) for i in range(int((xstop - xstart) / xstep))
            )
        )

    def circle(self, x, y, d):
        return (
            '',
            f'(circle at x={x}, y={y}, d={d})',
            self.position(x - d/2, y),
            self.mill_down(),
            self.clockwise_arc_to(x, y + d/2, d/2, 0),
            self.clockwise_arc_to(x + d/2, y, 0, -d/2),
            self.clockwise_arc_to(x, y - d/2, -d/2, 0),
            self.clockwise_arc_to(x - d/2, y, 0, d/2),
            self.mill_up(),
        )

    def round_rect(self, x, y, width, height, r):
        return (
            '',
            f'(round_rect at x={x}, y={y}, width={width}, height={height}, r={r})',
            self.position(x - width/2, y + height/2 - r),
            self.mill_down(),
            self.clockwise_arc_to(x - width/2 + r, y + height/2, r, 0),
            self.line_to(x + width/2 - r, y + height/2),
            self.clockwise_arc_to(x + width/2, y + height/2 - r, 0, -r),
            self.line_to(x + width/2, y - height/2 + r),
            self.clockwise_arc_to(x + width/2 - r, y - height/2, -r, 0),
            self.line_to(x - width/2 + r, y - height/2),
            self.clockwise_arc_to(x - width/2, y - height/2 + r, 0, r),
            self.line_to(x - width/2, y + height/2 - r),
            self.mill_up(),
        )

    def position(self, x, y):
        return f'G00 X{x} Y{y}'

    def line_to(self, x, y):
        return f'G01 X{x} Y{y} F{self.FEED_RATE_XY}'

    def clockwise_arc_to(self, x, y, i, j):
        return f'G02 X{x} Y{y} I{i} J{j} F{self.FEED_RATE_XY}'
