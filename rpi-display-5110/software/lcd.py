import curses
import curses.textpad
import time
import locale
import threading

# Emulator for monochrome LCD, with memory organized as 1x8 colums per byte (page is 8 pixels high horizolntal bar).
class LcdV8Curses(object):
    def __init__(self, width_pixels, height_pages):
        self.width_pixels = width_pixels
        self.height_pages = height_pages
        self.offset = 0
        self.buffer = bytearray(self.width_pixels * self.height_pages)
        locale.setlocale(locale.LC_ALL, 'en_US.UTF-8')

    def __enter__(self):
        self.screen = curses.initscr()
        curses.curs_set(0)
        curses.noecho()
        curses.cbreak()
        self.screen.keypad(1)
        self.pad = curses.newpad(self.height_pages * 8, self.width_pixels * 2)
        return self

    def __exit__(self, exc_type, exc_value, traceback):
        curses.endwin()

    def seek(self, offset):
        self.offset = offset

    def write(self, data):
        self.buffer[self.offset] = data
        self.offset += 1

    def peek(self):
        return self.buffer[self.offset]

    def flush_all(self):
        offset = 0
        self.pad.addstr('.' * 84*2)
        for y in range(0, self.height_pages):
            offset = y * self.width_pixels
            for x in range(0, self.width_pixels):
                for i in range(0, 8):
                    t = u'\u2588\u2588'.encode('utf_8') if (self.buffer[offset] & (1 << i)) != 0 else u'  '.encode('utf_8')
                    try:
                        self.pad.addstr(y*8 + i, x*2, t)
                    except:
                        pass
                offset = offset + 1                 
        self.screen.refresh()
        self.pad.refresh(0,0, 0,0, self.height_pages * 8, self.width_pixels * 2)
        self.screen.refresh()

    def getch(self):
        return self.screen.getch()
