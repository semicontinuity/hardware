from zebra import *

DPI=200

def label():
    return Document(
        contents=VBox(
            contents=[
                spacer(),
                header('AUX2: DB9M (p.1: top left user side)'),
                spacer(),
                tr('1', 'EXT GND'),
                tr('2', 'RESUME'),
                tr('3', 'HOLD'),
                tr('4', 'ABORT'),
                tr('5', 'PROBE'),
                tr('6', 'EXT GND'),
                tr('7', 'EXT VCC'),
                tr('8', 'AUX OUT'),
                tr('9', 'COOLANT'),
            ]
        )
    )

L_WIDTH=0.2*DPI
R_WIDTH=1.8*DPI
WIDTH=L_WIDTH+R_WIDTH

SPACER_HEIGHT=2

HBOX_HEIGHT=28

def header(text):
    return HBox(width=WIDTH, contents=[
        Text(height=HBOX_HEIGHT, width=WIDTH, text=text)
    ])


def spacer():
    return HBox(width=WIDTH, height=SPACER_HEIGHT)


def tr(first, second):
    return HBox(border=True, width=WIDTH, contents=[
        HBox(border=True, height=HBOX_HEIGHT, width=L_WIDTH, contents=[
            Text(height=12, width=L_WIDTH, text=first, font_family='0')
        ]),
        HBox(border=True, height=HBOX_HEIGHT, width=R_WIDTH, contents=[
            Text(height=12, width=R_WIDTH, text=second, font_family='0')
        ])
    ])


def main():
    values = zpl(label())
    print(values)


if __name__ == '__main__':
    main()
