from lcd import LcdV8Curses
from lcd_graphics import LcdGraphics

with LcdV8Curses(84, 6) as lcd:
    g = LcdGraphics(lcd)
#    g.set_color(LcdGraphics.COLOR_ON)
#    g.fill_rect(0, 0, 84, 48)
#    g.set_color(LcdGraphics.COLOR_OFF)
#    g.fill_rect(1, 1, 82, 46)
    g.set_color(LcdGraphics.COLOR_ON)
    g.fill_text('Hello!', 0, 0)
    lcd.flush_all()
    while True:
        c = lcd.getch()
        if c == ord('q'): break
