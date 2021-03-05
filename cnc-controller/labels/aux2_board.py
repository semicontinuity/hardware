from zebra import *

DPI=200

def label():
    return Document(
        contents=VBox(
            contents=[

                header('VCC + GND'),
                spacer(),

                header('GND + VCC'),
                spacer(),

                tr('GND', ''),
                tr('IN1', 'RESUME'),
                tr('IN2', 'HOLD'),
                tr('IN3', 'ABORT'),

                spacer(),

                tr('IN4', 'PROBE'),
                tr('OUT1', 'AUX OUT'),
                tr('OUT2', 'COOLANT'),
                tr('GND', ''),
            ]
        )
    )

L_WIDTH=0.4*DPI
R_WIDTH=1.6*DPI
WIDTH=L_WIDTH+R_WIDTH

SPACER_HEIGHT=1

HBOX_HEIGHT=28

def header(text):
    return HBox(border=True, width=WIDTH, contents=[
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
