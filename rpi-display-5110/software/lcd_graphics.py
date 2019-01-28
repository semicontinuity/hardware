from __future__ import print_function
import sys

def eprint(*args, **kwargs):
    print(*args, file=sys.stderr, **kwargs)

import font

class LcdGraphics(object):
    COLOR_ON = 0
    COLOR_OFF = 1

    class CombinerBitSet(object):

        @staticmethod
        def blt_left_shift(src, srcStart, srcOffset, length, shift, mask, peek_f, write_f):
            finalSrcOffset = srcOffset + length
            for i in xrange(srcStart + srcOffset, srcStart + finalSrcOffset):
                write_f(peek_f() | ((src[i] << shift) & mask))

        @staticmethod
        def blt_right_shift(src, srcStart, srcOffset, length, shift, mask, peek_f, write_f):
            finalSrcOffset = srcOffset + length
            for i in xrange(srcStart + srcOffset, srcStart + finalSrcOffset):
                write_f(peek_f() | ((src[i] >> shift) & mask))


    class CombinerBitReset(object):

        @staticmethod
        def blt_left_shift(src, srcStart, srcOffset, length, shift, mask, peek_f, write_f):
            finalSrcOffset = srcOffset + length
            for i in xrange(srcStart + srcOffset, srcStart + finalSrcOffset):
                write_f(0xFF & (peek_f() & ~((src[i] << shift) & mask)))

        @staticmethod
        def blt_left_shift(src, srcStart, srcOffset, length, shift, mask, peek_f, write_f):
            finalSrcOffset = srcOffset + length
            for i in xrange(srcStart + srcOffset, srcStart + finalSrcOffset):
                write_f(0xFF & (peek_f() & ~ ((src[i] << shift) & mask)))


    def __init__(self, lcd):
        self.lcd = lcd
        self.current_color = LcdGraphics.COLOR_OFF
        self.current_font = font.FONT_V8_6P

    def set_color(self, color):
        self.current_color = color

    @staticmethod
    def mask(topBit, bottomBit):
        return 0xFF & (0xFF >> (8 - bottomBit) & (0xFF << topBit))

    def fill(self, position, width, value):
        self.lcd.seek(position)
        for i in xrange(0, width):
            self.lcd.write(value)

    def and_with(self, position, width, mask):
        self.lcd.seek(position)
        for i in xrange(0, width):
            self.lcd.write(self.lcd.peek() & mask)

    def or_with(self, position, width, mask):
        self.lcd.seek(position)
        for i in xrange(0, width):
            self.lcd.write(self.lcd.peek() | mask)

    def fill_rect(self, x, y, width, height):
        row = y >> 3
        position = (row * self.lcd.width_pixels) + x

        topRowOffset = row << 3

        # Optionally paint "first" row
        # If y is not divisible by 8, the first row is painted specially
        # Also the first row can be the last one (all pixels touched lie within one row)
        # The bit mask should be specially calculated.
        startOffsetInTopRow = y - topRowOffset
        endOffsetInTopRow = startOffsetInTopRow + height
        if startOffsetInTopRow > 0 or endOffsetInTopRow <= 7:
            if self.current_color == LcdGraphics.COLOR_ON:
                mask = 0xFF << startOffsetInTopRow
                if endOffsetInTopRow <= 7:
                    mask &= 0xFF >> (8 - endOffsetInTopRow)
                self.or_with(position, width, mask & 0xFF)
            else:
                mask = 0xFF << startOffsetInTopRow
                if endOffsetInTopRow <= 7:
                    mask &= (0xFF >> (8 - endOffsetInTopRow))
                self.and_with(position, width, ~mask & 0xFF)
            row += 1
            position += self.lcd.width_pixels

        # Paint "middle" rows - those completely filled
        # For this rows, appropriate bytes are simply filled with 0xFF or 0x00
        endRow = (y + height) >> 3
        while row < endRow:
            self.fill(position, width, 0x00 if self.current_color == LcdGraphics.COLOR_OFF else 0xFF)
            row += 1
            position += self.lcd.width_pixels
    

        # Optionally paint "last" row
        # The bit mask should be specially calculated, depending on remainingHeight
        remainingHeight = y + height - (row << 3)
        if remainingHeight > 0:
            if self.current_color == LcdGraphics.COLOR_ON:
                self.or_with(position, width, 0xFF >> (8 - remainingHeight))
            else:
                self.and_with(position, width, 0xFF & ~(0xFF >> (8 - remainingHeight)))


    def fill_text(self, text, x, y):
        combiner = LcdGraphics.CombinerBitReset if self.current_color == LcdGraphics.COLOR_OFF else LcdGraphics.CombinerBitSet
        fontHeight = self.current_font["height"]
        srcStride = self.current_font["width"] * ((self.current_font["height"] + 7) >> 3)
        eprint("srcStride", srcStride)
        for c in text:
            index = ord(c) - self.current_font["first_glyph"]
            eprint('index', index)
            width = self.current_font["widths"][index]
            eprint('width', width)
            self.bit_blt(
                self.current_font["glyphs"],
                srcStride * index,
                srcStride,
                width,
                fontHeight,
                x,
                y,
                0,
                0,
                combiner,
                0)

            x += width


    def bit_blt(
        self,
        src,
        srcStart,
        srcStride,
        width,
        height,
        dstX,
        dstY,
        srcX,
        srcY,
        combiner,
        srcInitialOffset):

        dstRow = dstY >> 3
        finalDstRow = (dstY + height - 1) >> 3
        dstOffset = dstRow * self.lcd.width_pixels + dstX
        srcRow = srcY >> 3
        srcOffset = srcRow * srcStride + srcX + srcInitialOffset

        # TODO optimize and make clear (e.g. with (x & 0xF8))
        diff = (dstY - (dstRow << 3)) - (srcY - (srcRow << 3))
        pivotBit = diff if diff > 0 else diff + 8
        topShift = 8 - diff if diff > 0 else -diff
        bottomShift = diff if diff > 0 else 8 + diff

        while dstRow <= finalDstRow:
            # TODO optimize and make clear (e.g. with (x & 0xF8))
            topBit = (dstY - (dstRow << 3)) if (dstY - (dstRow << 3)) > 0 else 0
            # TODO optimize and make clear(e.g. with (x & 0xF8))
            bottomBit = ((dstY + height) - (dstRow << 3)) if ((dstY + height) - (dstRow << 3)) < 8 else 8

            if (pivotBit == 0 or topBit < pivotBit) and topShift < 8:
                self.lcd.seek(dstOffset)
                combiner.blt_right_shift(
                    src, srcStart, srcOffset,
                    width,
                    topShift,
                    LcdGraphics.mask(topBit, min(bottomBit, pivotBit)),
                    self.lcd.peek,
                    self.lcd.write
                )
                srcOffset += srcStride

            if bottomBit > pivotBit and pivotBit != 0:
                self.lcd.seek(dstOffset)
                combiner.blt_left_shift(
                    src, srcStart, srcOffset,
                    width,
                    bottomShift,
                    LcdGraphics.mask(max(topBit, pivotBit), bottomBit),
                    self.lcd.peek,
                    self.lcd.write
                )

            dstOffset += self.lcd.width_pixels
            dstRow += 1

