import math


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
    Z_THRESHOLD = None
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
            self.spindle_speed(self.SPINDLE_SPEED if self.SPINDLE_SPEED else 500),
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

    def spindle_speed(self, speed):
        return f'S{speed} (Set spindle speed)'

    def spindle_start(self):
        return 'M03 (Start spindle)'

    def spindle_wait(self):
        return f'G04 P{self.SPINDLE_DWELL_TIME} (Wait for spindle)'

    def spindle_stop(self):
        return 'M05 (Stop spindle)'

    def float_range(self, start, stop, step):
        pos = start
        while pos < stop:
            yield pos
            pos += step

    def grid(self, name, f, xstart, xstop, xstep, ystart, ystop, ystep, *args, **kwargs):
        return (
            '',
            f'({name})',
            (f(x, y, *args, **kwargs) for x in self.float_range(xstart, xstop, xstep) for y in self.float_range(ystart, ystop, ystep))
#            (f(x, y, *args, **kwargs) for x in range(xstart, xstop, xstep) for y in range(ystart, ystop, ystep)),
        )

    def deep_line(self, x_from, y_from, x_to, y_to, z_step=None, z_from=None, z_to=None):
        if z_from is None: z_from = self.Z_FROM
        if z_to   is None: z_to   = self.Z_DOWN
        if z_step is None: z_step = self.Z_STEP
        return (
            '',
            f'(deep_line at x_from={x_from}, y_from={y_from}, x_to={x_to}, y_to={y_to})',
            (
                (
                    self.position(x_from if i % 2 == 0 else x_to, y_from if i % 2 == 0 else y_to),
                    self.mill_down(z_from - (i+1) * z_step),
                    self.line_to(x_to if i % 2 == 0 else x_from, y_to if i % 2 == 0 else y_from),
                ) for i in range(int((z_from - z_to) / z_step))
            ),
            self.mill_up(),
        )

    def rect(self, xstart, ystart, xstop, ystop, from_z=None, to_z=None, z_step=None):
        if from_z is None: from_z = self.Z_FROM
        if to_z is None: to_z = self.Z_DOWN
        if z_step is None: z_step = self.Z_STEP
        return (
            '',
            f'(rect at xstart={xstart}, ystart={ystart}, xstop={xstop}, ystop={ystop})',
            self.position(xstart, ystart),
            self.position_z(),
            (
                (
                    '',
                    f'(rect layer {k+1})',
                    self.mill_down(from_z - (k+1) * z_step),
                    self.line_to(xstop, ystart),
                    self.line_to(xstop, ystop),
                    self.line_to(xstart, ystop),
                    self.line_to(xstart, ystart),
                ) for k in range(int((from_z - to_z) / z_step))
            ),
            '',
            self.mill_up(),
        )

    def pyramidoid(self, xstart, ystart, xstop, ystop, xstep, ystep, zstep, from_z, to_z):
        return (
            '',
            f'(pyramidoid at xstart={xstart}, ystart={ystart}, xstop={xstop}, ystop={ystop}, ystep={ystep})',
            self.position(xstart, ystart),
            self.position_z(),
            (
                (
                    '',
                    f'(pyramidoid layer {k+1})',
                    self.line_to(xstart + k*xstep, ystart + k*ystep),
                    self.mill_down(from_z - (k+1) * zstep),
                    self.line_to(xstop - k*xstep, ystart + k*ystep),
                    self.line_to(xstop - k*xstep, ystop - k*ystep),
                    self.line_to(xstart + k*xstep, ystop - k*ystep),
                    self.line_to(xstart + k*xstep, ystart + k*ystep),
                ) for k in range(int((from_z - to_z) / zstep))
            ),
            '',
            self.mill_up(),
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

    def counter_clockwise_arc(self, x, y, d, a, b):
        sin_a = math.sin(a)
        cos_a = math.cos(a)
        sin_b = math.sin(b)
        cos_b = math.cos(b)
        return (
            '',
            f'(arc at x={x}, y={y}, d={d}, a={a}, b={b})',
            self.position(x + d/2*cos_a, y + d/2*sin_a),
            self.mill_down(),
            self.counter_clockwise_arc_to(x + d/2*cos_b, y + d/2*sin_b, -d/2*cos_a, -d/2*sin_a),
            self.mill_up(),
        )

    def cylinder(self, x, y, d, from_z, to_z, zstep):
        return (
            '',
            f'(cylinder at x={x}, y={y}, from_z={from_z}, to_z={to_z}, zstep={zstep})',
            self.position(x - d/2, y),
            self.position_z(),
            (
                (
                    '',
                    f'(cylinder layer {k})',
                    self.mill_down(from_z -(k+1) * zstep),
                    self.clockwise_arc_to(x, y + d/2, d/2, 0),
                    self.clockwise_arc_to(x + d/2, y, 0, -d/2),
                    self.clockwise_arc_to(x, y - d/2, -d/2, 0),
                    self.clockwise_arc_to(x - d/2, y, 0, d/2),
                ) for k in range(int((from_z - to_z) / zstep))
            ),
            '',
            self.mill_up(),
        )

    def cut_cone(self, x, y, d, to_z, xystep, zstep):
        return (
            '',
            f'(cut_cone at x={x}, y={y}, xystep={xystep}, zstep={zstep})',
            self.position(x - d/2 + xystep, y),
            self.position_z(),
            (
                (
                    '',
                    f'(cut_cone layer {k})',
                    self.line_to(x - (d/2 - xystep*(k+1)), y),
                    self.mill_down(-(k+1) * zstep),
                    self.clockwise_arc_to(x, y + d/2 - xystep*(k+1), d/2 - xystep*(k+1), 0),
                    self.clockwise_arc_to(x + d/2 - xystep*(k+1), y, 0, -(d/2 - xystep*(k+1))),
                    self.clockwise_arc_to(x, y - (d/2 - xystep*(k+1)), -(d/2 - xystep*(k+1)), 0),
                    self.clockwise_arc_to(x - (d/2 - xystep*(k+1)), y, 0, d/2 - xystep*(k+1)),
                ) for k in range(int((-to_z) / zstep))
            ),
            '',
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

    def hole(self, x, y):
        return (
            '',
            f'(hole at x={x}, y={y})',
            self.position(x, y),
            self.mill_down(),
            self.mill_up(),
        )

    def position(self, x, y):
        return f'G00 X{x:.4f} Y{y:.4f}'

    def position_z(self):
        return f'G00 Z{self.Z_THRESHOLD:.4f} (fast z positioning)'

    def line_to(self, x, y):
        return f'G01 X{x:.4f} Y{y:.4f} F{self.FEED_RATE_XY:.4f}'

    def clockwise_arc_to(self, x, y, i, j):
        return f'G02 X{x:.4f} Y{y:.4f} I{i:.4f} J{j:.4f} F{self.FEED_RATE_XY:.4f}'

    def counter_clockwise_arc_to(self, x, y, i, j):
        return f'G03 X{x:.4f} Y{y:.4f} I{i:.4f} J{j:.4f} F{self.FEED_RATE_XY:.4f}'

    def mill_up(self):
        return (
            f'G01 Z{self.Z_THRESHOLD:.4f} F{self.FEED_RATE_Z:.4f} (mill up)',
            f'G00 Z{self.Z_UP:.4f} (fast mill up)'
        )

    def mill_down(self, z=None):
        return f'G01 Z{(z if z else self.Z_DOWN):.4f} F{self.FEED_RATE_Z:.4f} (mill down)'
