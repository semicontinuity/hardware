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

    def float_range(self, start, stop=None, step=None):
        if stop is None:
          yield start
        else:
          pos = start
          while pos < stop:
            yield pos
            pos += step

    def grid(self, name, element, xstart=0, xstop=None, xstep=None, ystart=0, ystop=None, ystep=None, *args, **kwargs):
        return (
            '',
            f'({name})',
            (element(x, y, *args, **kwargs) for x in self.float_range(xstart, xstop, xstep) for y in self.float_range(ystart, ystop, ystep))
        )

    def pyramidoid_at(self, x, y, width, height, x_step, y_step, z_step=None, z_from=None, z_to=None, center=False):
        if center:
            x -= width/2
            y -= height/2
        return self.pyramidoid(x, x + width, y, y + height, x_step, y_step, z_step, z_from, z_to)

    def pyramidoid(self, x_from, x_to, y_from, y_to, x_step, y_step, z_step=None, z_from=None, z_to=None):
        if z_from is None: z_from = self.Z_FROM
        if z_to   is None: z_to   = self.Z_DOWN
        if z_step is None: z_step = self.Z_STEP
        return (
            '',
            f'(pyramidoid at x_from={x_from}, y_from={y_from}, x_to={x_to}, y_to={y_to})',
            self.position(x_from, y_from),
            self.position_z(),
            (
                (
                    '',
                    f'(pyramidoid layer {k+1})',
                    self.line_to(x_from + k*x_step, y_from + k*y_step),
                    self.mill_down(z_from - (k+1) * z_step),
                    self.line_to(x_to   - k*x_step, y_from + k*y_step),
                    self.line_to(x_to   - k*x_step, y_to   - k*y_step),
                    self.line_to(x_from + k*x_step, y_to   - k*y_step),
                    self.line_to(x_from + k*x_step, y_from + k*y_step),
                ) for k in range(int((z_from - z_to) / z_step))
            ),
            '',
            self.mill_up(),
        )

    def deep_rect_at(self, x, y, width, height, z_from=None, z_to=None, z_step=None, center=False):
        if center:
            x -= width/2
            y -= height/2
        return self.deep_rect(x, y, x + width, y + height, z_from, z_to, z_step)

    def deep_rect(self, x_from, y_from, x_to, y_to, z_from=None, z_to=None, z_step=None):
        if z_from is None: z_from = self.Z_FROM
        if z_to   is None: z_to   = self.Z_DOWN
        if z_step is None: z_step = self.Z_STEP
        return (
            '',
            f'(deep_rect at x_from={x_from}, y_from={y_to}, x_to={x_to}, y_to={y_to})',
            self.position(x_from, y_from),
            self.position_z(),
            (
                (
                    '',
                    f'(rect layer {k+1})',
                    self.mill_down(z_from - (k+1) * z_step),
                    self.line_to(x_to, y_from),
                    self.line_to(x_to, y_to),
                    self.line_to(x_from, y_to),
                    self.line_to(x_from, y_from),
                ) for k in range(int((z_from - z_to) / z_step))
            ),
            '',
            self.mill_up(),
        )

    def deep_rect_depth_first_at(self, x, y, width, height, z_from=None, z_to=None, z_step=None, center=False):
        if center:
            x -= width/2
            y -= height/2
        return self.deep_rect_deph_first(x, y, x + width, y + height, z_from, z_to, z_step)

    def deep_rect_depth_first(self, x_from, y_from, x_to, y_to, z_from=None, z_to=None, z_step=None, order=None):
        if z_from is None: z_from = self.Z_FROM
        if z_to   is None: z_to   = self.Z_DOWN
        if z_step is None: z_step = self.Z_STEP

        strokes = {
            'S': self.deep_line(x_from, y_from, x_to  , y_from),
            'E': self.deep_line(x_to  , y_from, x_to  , y_to),
            'N': self.deep_line(x_to  , y_to  , x_from, y_to),
            'W': self.deep_line(x_from, y_to  , x_from, y_from),
        }
        if order is None:
            order = list(strokes.keys())

        return (
            '',
            f'(deep_rect_depth_first at x_from={x_from}, y_from={y_to}, x_to={x_to}, y_to={y_to})',
            self.position(x_from, y_from),
            self.position_z(),
            (
              (
                '',
                f'(deep_rect_depth_first at x_from={x_from}, y_from={y_to}, x_to={x_to}, y_to={y_to} side={side})',
                strokes[side],
              ) for side in order
            ),
            self.mill_up(),
        )

    def deep_round_rect_at(self, x, y, width, height, r, z_step=None, z_from=None, z_to=None, center=False):
        if center:
            x -= width/2
            y -= height/2
        return self.deep_round_pyramidoid('deep_round_rect', x, y, x + width, y + height, 0, r, z_step, z_from, z_to)

    def deep_round_pyramidoid_at(self, x, y, width, height, xy_step, r, z_step=None, z_from=None, z_to=None, center=False):
        if center:
            x -= width/2
            y -= height/2
        return self.deep_round_pyramidoid('deep_round_pyramidoid', x, y, x + width, y + height, xy_step, r, z_step, z_from, z_to)

    def deep_round_pyramidoid(self, name, x_from, y_from, x_to, y_to, xy_step, r, z_step=None, z_from=None, z_to=None):
        if z_from is None: z_from = self.Z_FROM
        if z_to   is None: z_to   = self.Z_DOWN
        if z_step is None: z_step = self.Z_STEP
        return (
            '',
            f'({name} at x_from={x_from}, y_from={y_from}, x_to={x_to}, y_to={y_to}, z_from={z_from}, z_to={z_to})',
            self.position(x_from, y_to - r),
            self.position_z(),
            (
                (
                    '',
                    f'({name} layer {k+1})',
                    self.line_to(         x_from + k*xy_step, y_to    - r),
                    self.mill_down(z_from - (k+1) * z_step),
                    self.clockwise_arc_to(x_from             + r, y_to   - k*xy_step    ,  r - k*xy_step,  0            ),
                    self.line_to(         x_to               - r, y_to   - k*xy_step                                    ),
                    self.clockwise_arc_to(x_to - k*xy_step      , y_to               - r, 0             , -r + k*xy_step),
                    self.line_to(         x_to - k*xy_step      , y_from             + r                                ),
                    self.clockwise_arc_to(x_to               - r, y_from + k*xy_step    , -r + k*xy_step,  0            ),
                    self.line_to(         x_from             + r, y_from + k*xy_step                                    ),
                    self.clockwise_arc_to(x_from + k*xy_step    , y_from             + r,  0            ,  r - k*xy_step),
                    self.line_to(         x_from + k*xy_step    , y_to               - r                                )
                ) for k in range(int((z_from - z_to) / z_step))
            ),
            '',
            self.mill_up(),
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

    def deep_hexagone(self, x, y, d, z_from=None, z_to=None, z_step=None):
        if z_from is None: z_from = self.Z_FROM
        if z_to   is None: z_to   = self.Z_DOWN
        if z_step is None: z_step = self.Z_STEP

        return (
            '',
            f'(deep_hexagone at x={x}, y={y}, d={d})',
            self.position(x - d/2, y),
            self.position_z(),
            (
                (
                    '',
                    f'(deep_hegagone layer {k})',
                    self.mill_down(z_from -(k+1) * z_step),
                    self.line_to(x - d/4, y - d*math.sqrt(3)/4),
                    self.line_to(x + d/4, y - d*math.sqrt(3)/4),
                    self.line_to(x + d/2, y),
                    self.line_to(x + d/4, y + d*math.sqrt(3)/4),
                    self.line_to(x - d/4, y + d*math.sqrt(3)/4),
                    self.line_to(x - d/2, y),
                ) for k in range(int((z_from - z_to) / z_step))
            ),
            '()',
            self.mill_up(),
        )

    def cylinder(self, x, y, d, z_from=None, z_to=None, z_step=None):
        if z_from is None: z_from = self.Z_FROM
        if z_to   is None: z_to   = self.Z_DOWN
        if z_step is None: z_step = self.Z_STEP

        return (
            '',
            f'(cylinder at x={x}, y={y}, z_from={z_from}, z_to={z_to}, z_step={z_step})',
            self.position(x - d/2, y),
            self.position_z(),
            (
                (
                    '',
                    f'(cylinder layer {k})',
                    self.mill_down(z_from -(k+1) * z_step),
                    self.clockwise_arc_to(x, y + d/2, d/2, 0),
                    self.clockwise_arc_to(x + d/2, y, 0, -d/2),
                    self.clockwise_arc_to(x, y - d/2, -d/2, 0),
                    self.clockwise_arc_to(x - d/2, y, 0, d/2),
                ) for k in range(int((z_from - z_to) / z_step))
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

    def round_rect_at(self, x, y, width, height, r, center=False):
        if center:
            x -= width/2
            y -= height/2
        return (
            '',
            f'(round_rect at x={x}, y={y}, width={width}, height={height}, r={r})',
            self.round_rect(x, y, x + width, y + width, r)
        )

    def round_rect_bounded_by(self, x_from, y_from, x_to, y_to, r):
        return (
            '',
            f'(round_rect at x_from={x_from}, y_from={y_from}, x_to={width}, y_to={y_to}, r={r})',
            self.round_rect(x_from, y_from, x_to, y_to, r)
        )

    def round_rect(self, x_from, y_from, x_to, y_to, r):
        return (
            self.position(x_from, y_to - r),
            self.mill_down(),
            self.clockwise_arc_to(x_from + r, y_to, r, 0),
            self.line_to(x_to - r, y_to),
            self.clockwise_arc_to(x_to, y_to - r, 0, -r),
            self.line_to(x_to, y_from + r),
            self.clockwise_arc_to(x_to - r, y_from, -r, 0),
            self.line_to(x_from + r, y_from),
            self.clockwise_arc_to(x_from, y_from + r, 0, r),
            self.line_to(x_from, y_to - r),
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

    def mill_up(self):
        return (
            f'G01 Z{self.Z_THRESHOLD:.4f} F{self.FEED_RATE_Z:.4f} (mill up)',
            f'G00 Z{self.Z_UP:.4f} (fast mill up)'
        )

    def mill_down(self, z=None):
        return f'G01 Z{(z if z else self.Z_DOWN):.4f} F{self.FEED_RATE_Z:.4f} (mill down)'
