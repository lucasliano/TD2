EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 3
Title "Sistema de Alarma"
Date "2021-07-23"
Rev "v1.1"
Comp "Proyecto Técnicas Digitales II - Grupo N°4"
Comment1 "Liaño, Lucas"
Comment2 "Golob, Lautaro"
Comment3 "Crisafio, Gabriel"
Comment4 "Dieguez, Manuel"
$EndDescr
$Comp
L Device:C C?
U 1 1 61001D23
P 4150 3600
AR Path="/60FAC4BE/61001D23" Ref="C?"  Part="1" 
AR Path="/60FFCFF1/61001D23" Ref="C2"  Part="1" 
F 0 "C2" H 4265 3646 50  0000 L CNN
F 1 "4.7uF" H 4265 3555 50  0000 L CNN
F 2 "" H 4188 3450 50  0001 C CNN
F 3 "~" H 4150 3600 50  0001 C CNN
	1    4150 3600
	1    0    0    -1  
$EndComp
NoConn ~ 3950 3400
Wire Wire Line
	2900 3950 2900 3800
Wire Wire Line
	2900 3400 2900 3500
Wire Wire Line
	3150 3400 2900 3400
$Comp
L Device:C C?
U 1 1 61001D36
P 2600 3550
AR Path="/60FAC4BE/61001D36" Ref="C?"  Part="1" 
AR Path="/60FFCFF1/61001D36" Ref="C1"  Part="1" 
F 0 "C1" H 2400 3550 50  0000 L CNN
F 1 "4.7uF" H 2350 3450 50  0000 L CNN
F 2 "" H 2638 3400 50  0001 C CNN
F 3 "~" H 2600 3550 50  0001 C CNN
	1    2600 3550
	1    0    0    -1  
$EndComp
$Comp
L Battery_Management:MCP73831-2-OT U?
U 1 1 61001D43
P 3550 3300
AR Path="/60FAC4BE/61001D43" Ref="U?"  Part="1" 
AR Path="/60FFCFF1/61001D43" Ref="U2"  Part="1" 
F 0 "U2" H 3800 3650 50  0000 C CNN
F 1 "MCP73831-2-OT" H 3900 3550 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:SOT-23-5" H 3600 3050 50  0001 L CIN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20001984g.pdf" H 3400 3250 50  0001 C CNN
F 4 "MCP73831T-3ACI/OT" H 3550 3300 50  0001 C CNN "Part Number"
F 5 "579-MCP73831T-3ACIOT" H 3550 3300 50  0001 C CNN "Mouser Number"
F 6 "https://ar.mouser.com/ProductDetail/Microchip-Technology/MCP73831T-3ACI-OT?qs=%2Fha2pyFadugMVps6%252BY90u4foyWDqEDR11NlkRgzami6SSA92Q69oSamOMHPYr%252BP%252B" H 3550 3300 50  0001 C CNN "Mouser Link"
	1    3550 3300
	1    0    0    -1  
$EndComp
$Comp
L Regulator_Switching:TPS61200DRC U?
U 1 1 61001D4C
P 7450 3800
AR Path="/60FAC4BE/61001D4C" Ref="U?"  Part="1" 
AR Path="/60FFCFF1/61001D4C" Ref="U3"  Part="1" 
F 0 "U3" H 7450 4267 50  0000 C CNN
F 1 "TPS61200DRC" H 7450 4176 50  0000 C CNN
F 2 "Package_SON:Texas_S-PVSON-N10_ThermalVias" H 7450 3350 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tps61200.pdf" H 7450 3800 50  0001 C CNN
F 4 "https://ar.mouser.com/ProductDetail/Texas-Instruments/TPS61200DRCR?qs=KS%252B%252BetD%2FUt%252BgESRRnVo8Yg%3D%3D" H 7450 3800 50  0001 C CNN "Mouser Link"
F 5 "595-TPS61200DRCR" H 7450 3800 50  0001 C CNN "Mouser Number"
F 6 "TPS61200DRCR " H 7450 3800 50  0001 C CNN "Part Number"
	1    7450 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	1800 3450 1800 3350
Wire Wire Line
	1850 3850 1500 3850
Wire Wire Line
	1850 3550 1850 3850
Wire Wire Line
	1800 3550 1850 3550
$Comp
L Connector:USB_B_Micro J?
U 1 1 61001D56
P 1500 3350
AR Path="/60FAC4BE/61001D56" Ref="J?"  Part="1" 
AR Path="/60FFCFF1/61001D56" Ref="J8"  Part="1" 
F 0 "J8" H 1557 3817 50  0000 C CNN
F 1 "USB_B_Micro" H 1557 3726 50  0000 C CNN
F 2 "" H 1650 3300 50  0001 C CNN
F 3 "~" H 1650 3300 50  0001 C CNN
	1    1500 3350
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 61001D5C
P 1500 3950
AR Path="/60FAC4BE/61001D5C" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/61001D5C" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 1500 3700 50  0001 C CNN
F 1 "Earth" H 1500 3800 50  0001 C CNN
F 2 "" H 1500 3950 50  0001 C CNN
F 3 "~" H 1500 3950 50  0001 C CNN
	1    1500 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 3750 1500 3850
Connection ~ 1500 3850
Wire Wire Line
	1500 3850 1500 3950
Wire Wire Line
	1400 3850 1500 3850
Wire Wire Line
	1400 3750 1400 3850
$Comp
L power:Earth #PWR?
U 1 1 61001D67
P 2000 2750
AR Path="/60FAC4BE/61001D67" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/61001D67" Ref="#PWR0102"  Part="1" 
F 0 "#PWR0102" H 2000 2500 50  0001 C CNN
F 1 "Earth" H 2000 2600 50  0001 C CNN
F 2 "" H 2000 2750 50  0001 C CNN
F 3 "~" H 2000 2750 50  0001 C CNN
	1    2000 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	2000 2650 2000 2750
Wire Wire Line
	1800 2650 2000 2650
Connection ~ 2000 2650
Wire Wire Line
	2000 2550 2000 2650
Wire Wire Line
	1800 2550 2000 2550
$Comp
L Connector:Barrel_Jack_Switch J?
U 1 1 61001D72
P 1500 2550
AR Path="/60FAC4BE/61001D72" Ref="J?"  Part="1" 
AR Path="/60FFCFF1/61001D72" Ref="J7"  Part="1" 
F 0 "J7" H 1557 2867 50  0000 C CNN
F 1 "Barrel_Jack" H 1557 2776 50  0000 C CNN
F 2 "" H 1550 2510 50  0001 C CNN
F 3 "~" H 1550 2510 50  0001 C CNN
	1    1500 2550
	1    0    0    -1  
$EndComp
Wire Wire Line
	3550 3000 3550 2800
Wire Wire Line
	3950 3200 4150 3200
Wire Wire Line
	4150 3200 4150 3450
Wire Wire Line
	3550 3850 3550 3600
Wire Wire Line
	4150 3750 4150 3850
Connection ~ 4150 3850
Wire Wire Line
	4150 3850 3550 3850
Wire Wire Line
	4150 3850 4150 3950
$Comp
L power:Earth #PWR?
U 1 1 6100E867
P 2600 3950
AR Path="/60FAC4BE/6100E867" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/6100E867" Ref="#PWR0103"  Part="1" 
F 0 "#PWR0103" H 2600 3700 50  0001 C CNN
F 1 "Earth" H 2600 3800 50  0001 C CNN
F 2 "" H 2600 3950 50  0001 C CNN
F 3 "~" H 2600 3950 50  0001 C CNN
	1    2600 3950
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 6100EABA
P 2900 3950
AR Path="/60FAC4BE/6100EABA" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/6100EABA" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 2900 3700 50  0001 C CNN
F 1 "Earth" H 2900 3800 50  0001 C CNN
F 2 "" H 2900 3950 50  0001 C CNN
F 3 "~" H 2900 3950 50  0001 C CNN
	1    2900 3950
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 6100EE3B
P 4150 3950
AR Path="/60FAC4BE/6100EE3B" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/6100EE3B" Ref="#PWR0105"  Part="1" 
F 0 "#PWR0105" H 4150 3700 50  0001 C CNN
F 1 "Earth" H 4150 3800 50  0001 C CNN
F 2 "" H 4150 3950 50  0001 C CNN
F 3 "~" H 4150 3950 50  0001 C CNN
	1    4150 3950
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 61011C34
P 4850 2750
AR Path="/60FAC4BE/61011C34" Ref="R?"  Part="1" 
AR Path="/60FFCFF1/61011C34" Ref="R4"  Part="1" 
F 0 "R4" H 4918 2796 50  0000 L CNN
F 1 "10k" H 4918 2705 50  0000 L CNN
F 2 "" V 4890 2740 50  0001 C CNN
F 3 "~" H 4850 2750 50  0001 C CNN
	1    4850 2750
	1    0    0    -1  
$EndComp
Wire Wire Line
	7850 3700 7950 3700
Connection ~ 8900 3700
Wire Wire Line
	7850 4000 7950 4000
Wire Wire Line
	7950 4000 7950 3700
Connection ~ 7950 3700
Wire Wire Line
	7950 3700 8450 3700
Wire Wire Line
	7850 3800 8050 3800
Wire Wire Line
	8050 3800 8050 4100
Wire Wire Line
	8450 3700 8450 4100
Wire Wire Line
	7850 3600 7950 3600
Wire Wire Line
	7950 3600 7950 3200
Wire Wire Line
	7050 3600 6950 3600
Wire Wire Line
	6950 3600 6950 3700
Wire Wire Line
	6950 3800 7050 3800
Wire Wire Line
	7050 3700 6950 3700
Connection ~ 6950 3700
Wire Wire Line
	6950 3700 6950 3800
Wire Wire Line
	6950 3600 6950 3200
Connection ~ 6950 3600
Wire Wire Line
	4850 2600 4850 2450
$Comp
L Device:Q_PMOS_GDS Q1
U 1 1 61025D08
P 5650 3100
F 0 "Q1" V 5550 2950 50  0000 C CNN
F 1 "DMP3098LSS" V 5550 3400 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-252-2" H 5850 3200 50  0001 C CNN
F 3 "https://ar.mouser.com/datasheet/2/196/Infineon-SPD04P10P-DS-v01_06-en-1227707.pdf" H 5650 3100 50  0001 C CNN
F 4 "https://ar.mouser.com/ProductDetail/Infineon-Technologies/SPD04P10P-G?qs=mzcOS1kGbgeKX8dCYD458w%3D%3D" H 5650 3100 50  0001 C CNN "Mouser Link"
F 5 "726-SPD04P10PG " H 5650 3100 50  0001 C CNN "Mouser Number"
F 6 "SPD04P10P G" H 5650 3100 50  0001 C CNN "Part Number"
	1    5650 3100
	0    1    1    0   
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 61029C39
P 4850 2900
AR Path="/60FAC4BE/61029C39" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/61029C39" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 4850 2650 50  0001 C CNN
F 1 "Earth" H 4850 2750 50  0001 C CNN
F 2 "" H 4850 2900 50  0001 C CNN
F 3 "~" H 4850 2900 50  0001 C CNN
	1    4850 2900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6102A0E3
P 8050 4250
AR Path="/60FAC4BE/6102A0E3" Ref="C?"  Part="1" 
AR Path="/60FFCFF1/6102A0E3" Ref="C4"  Part="1" 
F 0 "C4" H 8165 4296 50  0000 L CNN
F 1 "1uF" H 8165 4205 50  0000 L CNN
F 2 "" H 8088 4100 50  0001 C CNN
F 3 "~" H 8050 4250 50  0001 C CNN
	1    8050 4250
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 6102A554
P 8450 4250
AR Path="/60FAC4BE/6102A554" Ref="C?"  Part="1" 
AR Path="/60FFCFF1/6102A554" Ref="C5"  Part="1" 
F 0 "C5" H 8565 4296 50  0000 L CNN
F 1 "22uF-X5R(check!)" H 8565 4205 50  0000 L CNN
F 2 "" H 8488 4100 50  0001 C CNN
F 3 "~" H 8450 4250 50  0001 C CNN
	1    8450 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	7350 4300 7350 4500
Wire Wire Line
	7350 4500 7450 4500
Wire Wire Line
	7550 4500 7550 4300
Wire Wire Line
	7450 4300 7450 4500
Connection ~ 7450 4500
Wire Wire Line
	7450 4500 7550 4500
Wire Wire Line
	7450 4500 7450 4650
Wire Wire Line
	8050 4400 8050 4650
Wire Wire Line
	5850 3200 6050 3200
$Comp
L Device:R_US R?
U 1 1 6103E633
P 6450 3650
AR Path="/60FAC4BE/6103E633" Ref="R?"  Part="1" 
AR Path="/60FFCFF1/6103E633" Ref="R5"  Part="1" 
F 0 "R5" H 6518 3696 50  0000 L CNN
F 1 "2M" H 6518 3605 50  0000 L CNN
F 2 "" V 6490 3640 50  0001 C CNN
F 3 "~" H 6450 3650 50  0001 C CNN
	1    6450 3650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R?
U 1 1 6103EE78
P 6450 4150
AR Path="/60FAC4BE/6103EE78" Ref="R?"  Part="1" 
AR Path="/60FFCFF1/6103EE78" Ref="R6"  Part="1" 
F 0 "R6" H 6518 4196 50  0000 L CNN
F 1 "140k 1%" H 6518 4105 50  0000 L CNN
F 2 "" V 6490 4140 50  0001 C CNN
F 3 "https://ar.mouser.com/datasheet/2/54/crxxxxx-1858361.pdf" H 6450 4150 50  0001 C CNN
F 4 "https://ar.mouser.com/ProductDetail/Bourns/CR0603-FX-1403ELF?qs=sGAEpiMZZMtlubZbdhIBIJoX7P5Bll7agXTMqD6Yn9M%3D" H 6450 4150 50  0001 C CNN "Mouser Link"
F 5 "652-CR0603FX-1403ELF " H 6450 4150 50  0001 C CNN "Mouser Number"
F 6 "CR0603-FX-1403ELF " H 6450 4150 50  0001 C CNN "Part Number"
	1    6450 4150
	1    0    0    -1  
$EndComp
Wire Wire Line
	6450 3200 6450 3500
Connection ~ 6450 3200
Wire Wire Line
	6450 3200 6950 3200
Wire Wire Line
	6450 3800 6450 3900
Wire Wire Line
	6450 4300 6450 4650
Wire Wire Line
	6450 3900 7050 3900
Connection ~ 6450 3900
Wire Wire Line
	6450 3900 6450 4000
$Comp
L Device:C C?
U 1 1 61045CAF
P 6050 3900
AR Path="/60FAC4BE/61045CAF" Ref="C?"  Part="1" 
AR Path="/60FFCFF1/61045CAF" Ref="C3"  Part="1" 
F 0 "C3" H 6165 3946 50  0000 L CNN
F 1 "4.7uF-X5R(check!)" H 5600 3800 50  0000 L CNN
F 2 "" H 6088 3750 50  0001 C CNN
F 3 "~" H 6050 3900 50  0001 C CNN
	1    6050 3900
	1    0    0    -1  
$EndComp
Wire Wire Line
	6050 3200 6050 3750
Connection ~ 6050 3200
Wire Wire Line
	6050 3200 6450 3200
Wire Wire Line
	6050 4050 6050 4650
$Comp
L power:Earth #PWR?
U 1 1 6104C10B
P 6050 4650
AR Path="/60FAC4BE/6104C10B" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/6104C10B" Ref="#PWR0107"  Part="1" 
F 0 "#PWR0107" H 6050 4400 50  0001 C CNN
F 1 "Earth" H 6050 4500 50  0001 C CNN
F 2 "" H 6050 4650 50  0001 C CNN
F 3 "~" H 6050 4650 50  0001 C CNN
	1    6050 4650
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 6104C5AD
P 6450 4650
AR Path="/60FAC4BE/6104C5AD" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/6104C5AD" Ref="#PWR0108"  Part="1" 
F 0 "#PWR0108" H 6450 4400 50  0001 C CNN
F 1 "Earth" H 6450 4500 50  0001 C CNN
F 2 "" H 6450 4650 50  0001 C CNN
F 3 "~" H 6450 4650 50  0001 C CNN
	1    6450 4650
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 6104C90C
P 7450 4650
AR Path="/60FAC4BE/6104C90C" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/6104C90C" Ref="#PWR0109"  Part="1" 
F 0 "#PWR0109" H 7450 4400 50  0001 C CNN
F 1 "Earth" H 7450 4500 50  0001 C CNN
F 2 "" H 7450 4650 50  0001 C CNN
F 3 "~" H 7450 4650 50  0001 C CNN
	1    7450 4650
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 6104CC5D
P 8050 4650
AR Path="/60FAC4BE/6104CC5D" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/6104CC5D" Ref="#PWR0110"  Part="1" 
F 0 "#PWR0110" H 8050 4400 50  0001 C CNN
F 1 "Earth" H 8050 4500 50  0001 C CNN
F 2 "" H 8050 4650 50  0001 C CNN
F 3 "~" H 8050 4650 50  0001 C CNN
	1    8050 4650
	1    0    0    -1  
$EndComp
$Comp
L power:Earth #PWR?
U 1 1 6104D029
P 8450 4650
AR Path="/60FAC4BE/6104D029" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/6104D029" Ref="#PWR0111"  Part="1" 
F 0 "#PWR0111" H 8450 4400 50  0001 C CNN
F 1 "Earth" H 8450 4500 50  0001 C CNN
F 2 "" H 8450 4650 50  0001 C CNN
F 3 "~" H 8450 4650 50  0001 C CNN
	1    8450 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:L L1
U 1 1 6104D802
P 7450 3200
F 0 "L1" V 7640 3200 50  0000 C CNN
F 1 "2.2uH - LPS3015" V 7549 3200 50  0000 C CNN
F 2 "" H 7450 3200 50  0001 C CNN
F 3 "https://ar.mouser.com/datasheet/2/597/lps3015-270734.pdf" H 7450 3200 50  0001 C CNN
F 4 "https://ar.mouser.com/ProductDetail/Coilcraft/LPS3015-222MRC?qs=%2Fha2pyFadugRL3Hwdx6eWNf%252BzgW1pt7Lm0mAJpPqCgs%3D" H 7450 3200 50  0001 C CNN "Mouser Link"
F 5 "994-LPS3015-222MRC " H 7450 3200 50  0001 C CNN "Mouser Number"
F 6 "LPS3015-222MRC " H 7450 3200 50  0001 C CNN "Part Number"
	1    7450 3200
	0    -1   -1   0   
$EndComp
Wire Wire Line
	6950 3200 7300 3200
Connection ~ 6950 3200
Wire Wire Line
	7600 3200 7950 3200
Wire Wire Line
	8450 4400 8450 4650
$Comp
L Device:D_Schottky D3
U 1 1 6106C095
P 6150 2450
F 0 "D3" H 6150 2233 50  0000 C CNN
F 1 "CDBU0130L - 350mV" H 6150 2324 50  0000 C CNN
F 2 "" H 6150 2450 50  0001 C CNN
F 3 "https://ar.mouser.com/datasheet/2/80/CDBU0130L_HF_RevA748574-2490037.pdf" H 6150 2450 50  0001 C CNN
F 4 "https://ar.mouser.com/ProductDetail/Comchip-Technology/CDBU0130L?qs=tw%252BuQ%2FB6PO2Mup5%252Bk7mubQ%3D%3D" H 6150 2450 50  0001 C CNN "Mouser Link"
F 5 "750-CDBU0130L " H 6150 2450 50  0001 C CNN "Mouser Number"
F 6 "CDBU0130L " H 6150 2450 50  0001 C CNN "Part Number"
	1    6150 2450
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 2900 5650 2450
Connection ~ 5650 2450
Wire Wire Line
	5650 2450 6000 2450
Wire Wire Line
	6300 2450 8900 2450
Wire Wire Line
	8900 2450 8900 3700
Text Notes 1200 5300 0    50   Italic 10
ANILIZAR SI EL CIRCUITO SE PODRIA HACER SIN BATERIA CON SUPER-CAP EN Vbat
Wire Notes Line
	2750 4950 2750 1900
Wire Notes Line
	1200 1900 1200 4950
Text Notes 1250 4900 0    50   ~ 0
Wall Input Voltage\n
Text Notes 1200 5500 0    50   ~ 0
El divisor de tensión en el TPS6 está calculado para que la tensión de corte sea de 3.82V\n
Wire Notes Line
	10800 4950 10800 1900
Wire Notes Line
	10800 4950 1200 4950
Wire Notes Line
	1200 1900 10800 1900
$Comp
L Device:Jumper JP1
U 1 1 6114AE65
P 2150 2450
F 0 "JP1" H 2150 2600 50  0000 C CNN
F 1 "Jumper" H 2200 2400 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 2150 2450 50  0001 C CNN
F 3 "-" H 2150 2450 50  0001 C CNN
F 4 "-" H 2150 2450 50  0001 C CNN "Mouser Link"
F 5 "-" H 2150 2450 50  0001 C CNN "Mouser Number"
F 6 "-" H 2150 2450 50  0001 C CNN "Part Number"
	1    2150 2450
	1    0    0    -1  
$EndComp
$Comp
L Device:Jumper JP2
U 1 1 6114E350
P 2150 3150
F 0 "JP2" H 2150 3300 50  0000 C CNN
F 1 "Jumper" H 2150 3050 50  0001 C CNN
F 2 "Jumper:SolderJumper-2_P1.3mm_Open_Pad1.0x1.5mm" H 2150 3150 50  0001 C CNN
F 3 "-" H 2150 3150 50  0001 C CNN
F 4 "-" H 2150 3150 50  0001 C CNN "Mouser Link"
F 5 "-" H 2150 3150 50  0001 C CNN "Mouser Number"
F 6 "-" H 2150 3150 50  0001 C CNN "Part Number"
	1    2150 3150
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 3400 2600 3150
Wire Wire Line
	2600 2450 2450 2450
Connection ~ 2600 2450
Wire Wire Line
	3550 2800 2600 2800
Connection ~ 2600 2800
Wire Wire Line
	2600 2800 2600 2450
Wire Wire Line
	2600 3150 2450 3150
Connection ~ 2600 3150
Wire Wire Line
	2600 3150 2600 2800
Wire Wire Line
	1850 3150 1800 3150
Wire Wire Line
	1850 2450 1800 2450
Wire Wire Line
	2600 3950 2600 3700
Connection ~ 4150 3200
Text Notes 4600 4000 0    50   ~ 10
Battery Cell\n
Wire Notes Line
	5150 4050 4550 4050
Wire Notes Line
	5150 3100 5150 4050
Wire Notes Line
	4550 3100 5150 3100
Wire Notes Line
	4550 4050 4550 3100
Wire Wire Line
	4850 3750 4850 3850
Wire Wire Line
	4850 3200 4850 3450
$Comp
L Device:Battery_Cell BT?
U 1 1 61001D7B
P 4850 3650
AR Path="/60FAC4BE/61001D7B" Ref="BT?"  Part="1" 
AR Path="/60FFCFF1/61001D7B" Ref="BT1"  Part="1" 
F 0 "BT1" H 4650 3600 50  0000 L CNN
F 1 "Batt" H 4900 3600 50  0000 L CNN
F 2 "" V 4850 3710 50  0001 C CNN
F 3 "http://www.batteryspace.com/prod-specs/4869.pdf" V 4850 3710 50  0001 C CNN
F 4 "https://articulo.mercadolibre.com.ar/MLA-903149783-celda-18650-lg-2200mah-con-terminal-para-soldar-37v-42v-_JM?matt_tool=88481412&matt_word=&matt_source=google&matt_campaign_id=11618987428&matt_ad_group_id=113657532672&matt_match_type=&matt_network=g&matt_device=m&matt_creative=479785004862&matt_keyword=&matt_ad_position=&matt_ad_type=pla&matt_merchant_id=334313049&matt_product_id=MLA903149783&matt_product_partition_id=758317414930&matt_target_id=aud-415044759576:pla-758317414930&gclid=EAIaIQobChMI6N6ysO338QIVsyCtBh2hBgntEAQYASABEgKf_vD_BwE" H 4850 3650 50  0001 C CNN "Mouser Link"
F 5 "-" H 4850 3650 50  0001 C CNN "Mouser Number"
F 6 "-" H 4850 3650 50  0001 C CNN "Part Number"
	1    4850 3650
	1    0    0    -1  
$EndComp
Connection ~ 4850 3200
Wire Wire Line
	4850 3200 5450 3200
Wire Wire Line
	4150 3200 4450 3200
Wire Wire Line
	4150 3850 4850 3850
Wire Notes Line
	5300 4950 5300 2750
Wire Notes Line
	8750 2750 8750 4950
Text Notes 5350 5000 0    50   ~ 0
Battery Voltage Booster 4.2V -> 5V\n\n
Text Notes 5850 2600 0    50   ~ 0
Protection Diode
Text Notes 5400 3400 0    50   ~ 0
Gate PMOSFET
Connection ~ 8450 3700
Wire Wire Line
	8450 3700 8900 3700
Text Notes 4900 2650 0    50   ~ 0
PullDown R
Connection ~ 4850 2450
Wire Wire Line
	4850 2450 5650 2450
Wire Wire Line
	2600 2450 4850 2450
Wire Notes Line
	5300 2750 8750 2750
$Comp
L Device:R_US R?
U 1 1 61001D30
P 2900 3650
AR Path="/60FAC4BE/61001D30" Ref="R?"  Part="1" 
AR Path="/60FFCFF1/61001D30" Ref="R3"  Part="1" 
F 0 "R3" H 2968 3696 50  0000 L CNN
F 1 "2k" H 2968 3605 50  0000 L CNN
F 2 "" V 2940 3640 50  0001 C CNN
F 3 "~" H 2900 3650 50  0001 C CNN
	1    2900 3650
	1    0    0    -1  
$EndComp
Text Notes 2800 5000 0    50   ~ 0
Battery Charge Module @ 500mA\n\n
$Comp
L Device:LED D4
U 1 1 6124CD6D
P 9400 4450
F 0 "D4" V 9450 4300 50  0000 R CNN
F 1 "LED_Green@2V" V 9350 4300 50  0000 R CNN
F 2 "" H 9400 4450 50  0001 C CNN
F 3 "https://ar.mouser.com/datasheet/2/445/150060VS75000-1714627.pdf" H 9400 4450 50  0001 C CNN
F 4 "https://ar.mouser.com/ProductDetail/Wurth-Elektronik/150060VS75000?qs=LlUlMxKIyB1Q1Bi5mQ%2FKLw%3D%3D" H 9400 4450 50  0001 C CNN "Mouser Link"
F 5 "710-150060VS75000 " H 9400 4450 50  0001 C CNN "Mouser Number"
F 6 "150060VS75000 " H 9400 4450 50  0001 C CNN "Part Number"
	1    9400 4450
	0    -1   -1   0   
$EndComp
$Comp
L Device:R_US R?
U 1 1 6124D4A7
P 9400 4050
AR Path="/60FAC4BE/6124D4A7" Ref="R?"  Part="1" 
AR Path="/60FFCFF1/6124D4A7" Ref="R7"  Part="1" 
F 0 "R7" H 9550 4100 50  0000 L CNN
F 1 "150 @ 20mA" H 9550 4000 50  0000 L CNN
F 2 "" V 9440 4040 50  0001 C CNN
F 3 "https://ar.mouser.com/datasheet/2/54/crxxxxx-1858361.pdf" H 9400 4050 50  0001 C CNN
F 4 "https://ar.mouser.com/ProductDetail/Bourns/CR0603-FX-1403ELF?qs=sGAEpiMZZMtlubZbdhIBIJoX7P5Bll7agXTMqD6Yn9M%3D" H 9400 4050 50  0001 C CNN "Mouser Link"
F 5 "652-CR0603FX-1403ELF " H 9400 4050 50  0001 C CNN "Mouser Number"
F 6 "CR0603-FX-1403ELF " H 9400 4050 50  0001 C CNN "Part Number"
	1    9400 4050
	1    0    0    -1  
$EndComp
Wire Wire Line
	8900 3700 9400 3700
Wire Wire Line
	9400 3900 9400 3700
Connection ~ 9400 3700
Wire Wire Line
	9400 3700 9950 3700
Wire Wire Line
	9400 4200 9400 4300
Wire Wire Line
	9400 4600 9400 4650
$Comp
L power:Earth #PWR?
U 1 1 6126B40D
P 9400 4650
AR Path="/60FAC4BE/6126B40D" Ref="#PWR?"  Part="1" 
AR Path="/60FFCFF1/6126B40D" Ref="#PWR0112"  Part="1" 
F 0 "#PWR0112" H 9400 4400 50  0001 C CNN
F 1 "Earth" H 9400 4500 50  0001 C CNN
F 2 "" H 9400 4650 50  0001 C CNN
F 3 "~" H 9400 4650 50  0001 C CNN
	1    9400 4650
	1    0    0    -1  
$EndComp
Text Notes 9550 4650 0    50   ~ 0
Power Indicator Led
Text HLabel 9950 3700 2    50   Output ~ 0
OUTPUT_5V
Text Notes 1200 7650 0    50   ~ 10
Circuit reference: https://www.youtube.com/watch?v=GRd9uTwg7r4
Wire Wire Line
	4850 2450 4850 2100
Wire Wire Line
	4850 2100 9400 2100
Wire Wire Line
	9400 2100 9400 3300
Wire Wire Line
	9400 3300 9950 3300
Text HLabel 9950 3300 2    50   Output ~ 0
OUTPUT_MEASURE
Text Notes 1200 5650 0    50   ~ 0
La resistencia en el MCP73831 está calculada para tener una corriente de carga de 500mA
Wire Wire Line
	4450 3200 4450 2750
Wire Wire Line
	4450 2750 4200 2750
Connection ~ 4450 3200
Wire Wire Line
	4450 3200 4850 3200
Text HLabel 4200 2750 0    50   Output ~ 0
OUTPUT_BAT
$Comp
L power:PWR_FLAG #FLG0103
U 1 1 616505D3
P 6950 3200
F 0 "#FLG0103" H 6950 3275 50  0001 C CNN
F 1 "PWR_FLAG" H 6950 3373 50  0001 C CNN
F 2 "" H 6950 3200 50  0001 C CNN
F 3 "~" H 6950 3200 50  0001 C CNN
	1    6950 3200
	1    0    0    -1  
$EndComp
$Comp
L power:PWR_FLAG #FLG0101
U 1 1 616872FC
P 2600 2450
F 0 "#FLG0101" H 2600 2525 50  0001 C CNN
F 1 "PWR_FLAG" H 2600 2623 50  0001 C CNN
F 2 "" H 2600 2450 50  0001 C CNN
F 3 "~" H 2600 2450 50  0001 C CNN
	1    2600 2450
	1    0    0    -1  
$EndComp
Connection ~ 3550 2800
$EndSCHEMATC
