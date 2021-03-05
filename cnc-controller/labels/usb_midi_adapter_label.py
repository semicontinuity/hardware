from zebra import *

DPI=200

def label():
    return Document(
        contents=VBox(
            contents=[
              split_tr(['OUT', 'MIDI 1', 'IN', 'IN']),
              split_tr(['OUT', 'MIDI 2', 'IN', 'OUT']),
              split_tr(['OUT', 'MIDI 3', 'IN', 'PAD']),
              spacer(),
              block('USB MIDI Adapter'),
              spacer(),
              split_tr(['OUT', 'OUT', 'OUT', 'OUT']),
              split_tr(['IN', 'IN', 'IN', 'IN']),
              split_tr(['OUT', 'MIDI 1', 'IN', 'IN']),
              split_tr(['OUT', 'MIDI 2', 'IN', 'OUT']),
            ]
        )
    )

WIDTH=2.0*DPI

CELL_WIDTH=1.5*DPI

C1_WIDTH=1.0*DPI
CS_WIDTH=0.1*DPI
C2_WIDTH=1.0*DPI

split_tr_L_WIDTH=0.5*DPI
split_tr_M_WIDTH=0.5*DPI
split_tr_R_WIDTH=0.5*DPI
split_tr_WIDTH=split_tr_L_WIDTH + split_tr_M_WIDTH + split_tr_R_WIDTH

SPACER_HEIGHT=2

HBOX_HEIGHT=28


def header(text):
    return HBox(width=WIDTH, contents=[
        Text(height=HBOX_HEIGHT, width=WIDTH, text=text)
    ])


def spacer():
    return HBox(width=WIDTH, height=HBOX_HEIGHT)

def columns_spacer():
    return VBox(width=CS_WIDTH)

def split_tr(elements):
    return HBox(border=True, width=split_tr_WIDTH, contents=[
        HBox(border=True, height=HBOX_HEIGHT, width=split_tr_L_WIDTH, contents=[
            Text(height=12, width=split_tr_L_WIDTH, text=element, font_family='0', text_align='C')
        ]) for element in elements
    ])

def cell(text):
    return HBox(border=True, height=3*HBOX_HEIGHT, width=CELL_WIDTH, contents=[
            Text(height=12, width=CELL_WIDTH, text=text, font_family='0', text_align='C')
    ])

def block(text):
    return Text(height=12, width=CELL_WIDTH, text=text, font_family='0', text_align='C')

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
