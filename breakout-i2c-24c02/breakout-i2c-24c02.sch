EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Memory_EEPROM:24LC02 U1
U 1 1 6272687C
P 5000 3825
F 0 "U1" H 5000 4306 50  0000 C CNN
F 1 "24LC02" H 5000 4215 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W7.62mm" H 5000 3825 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/21709c.pdf" H 5000 3825 50  0001 C CNN
	1    5000 3825
	1    0    0    -1  
$EndComp
$Comp
L Connector:Conn_01x04_Male J1
U 1 1 62729011
P 3300 3800
F 0 "J1" H 3408 4081 50  0000 C CNN
F 1 "Conn_01x04_Male" H 3408 3990 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x04_P2.54mm_Horizontal" H 3300 3800 50  0001 C CNN
F 3 "~" H 3300 3800 50  0001 C CNN
	1    3300 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	3500 3700 3875 3700
Wire Wire Line
	3500 3800 3875 3800
Wire Wire Line
	3500 3900 3875 3900
Wire Wire Line
	3500 4000 3875 4000
Wire Wire Line
	5000 3525 5300 3525
Wire Wire Line
	5000 4125 5300 4125
Wire Wire Line
	5400 3725 5750 3725
Wire Wire Line
	5400 3825 5750 3825
Text Label 3875 3700 0    50   ~ 0
GND
Text Label 3875 3800 0    50   ~ 0
VCC
Text Label 3875 3900 0    50   ~ 0
SDA
Text Label 3875 4000 0    50   ~ 0
SCL
Text Label 5475 3725 0    50   ~ 0
SDA
Text Label 5475 3825 0    50   ~ 0
SCL
Text Label 5050 4125 0    50   ~ 0
GND
Text Label 5300 3525 0    50   ~ 0
VCC
$EndSCHEMATC
