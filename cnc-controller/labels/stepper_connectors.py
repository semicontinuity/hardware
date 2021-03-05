from zebra import *

DPI=200

def label():
    return Document(
        contents=VBox(
            contents=[
                spacer(),
                header('Stepper connectors pinout'),

                spacer(),
                header('A'),
                columns(
                  height=0.3*DPI,
                  first=VBox(
                    contents=[
                      half_tr('1', 'A+'),
                      half_tr('2', 'A-'),
                    ]
                  ),
                  second=VBox(
                    contents=[
                      half_tr('3', 'B+'),
                      half_tr('4', 'B-'),
                    ]
                  )
                ),

                spacer(),
                header('B'),
                columns(
                  height=0.3*DPI,
                  first=VBox(
                    contents=[
                      half_tr('1', 'A+'),
                      half_tr('2', 'A-'),
                    ]
                  ),
                  second=VBox(
                    contents=[
                      half_tr('3', 'B+'),
                      half_tr('4', 'B-'),
                    ]
                  )
                ),

                spacer(),
                header('C'),
                columns(
                  height=0.3*DPI,
                  first=VBox(
                    contents=[
                      half_tr('1', 'A+'),
                      half_tr('2', 'A-'),
                    ]
                  ),
                  second=VBox(
                    contents=[
                      half_tr('3', 'B+'),
                      half_tr('4', 'B-'),
                    ]
                  ),
                )
            ]
        )
    )

WIDTH=2.0*DPI

CELL_WIDTH=1.0*DPI

C1_WIDTH=1.0*DPI
CS_WIDTH=0.1*DPI
C2_WIDTH=1.0*DPI

HALF_TR_L_WIDTH=0.2*DPI
HALF_TR_R_WIDTH=0.8*DPI
HALF_TR_WIDTH=HALF_TR_L_WIDTH + HALF_TR_R_WIDTH

SPACER_HEIGHT=2

HBOX_HEIGHT=28


def header(text):
    return HBox(width=WIDTH, contents=[
        Text(height=HBOX_HEIGHT, width=WIDTH, text=text)
    ])


def spacer():
    return HBox(width=WIDTH, height=SPACER_HEIGHT)

def columns_spacer():
    return VBox(width=CS_WIDTH)

def half_tr(first, second):
    return HBox(border=True, width=HALF_TR_WIDTH, contents=[
        HBox(border=True, height=HBOX_HEIGHT, width=HALF_TR_L_WIDTH, contents=[
            Text(height=12, width=HALF_TR_L_WIDTH, text=first, font_family='0')
        ]),
        HBox(border=True, height=HBOX_HEIGHT, width=HALF_TR_R_WIDTH, contents=[
            Text(height=12, width=HALF_TR_R_WIDTH, text=second, font_family='0')
        ])
    ])

def cell(text):
    return HBox(border=True, height=HBOX_HEIGHT, width=CELL_WIDTH, contents=[
            Text(height=12, width=CELL_WIDTH, text=text, font_family='0')
    ])

def columns(height, first, second):
    return HBox(height=height, contents=[
        first,
        second
    ])


def main():
    values = zpl(label())
    print(values)


if __name__ == '__main__':
    main()
