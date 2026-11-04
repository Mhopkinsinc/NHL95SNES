SPAskate:							; per direction (facedir & 7, * 2): skating
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskate+1,10,SPFskate+2,10,SPFskate+5,10,SPFskate+6,10,SPFskate+7,-15
.d1:								; direction 1
	dw SPFskate+9,10,SPFskate+10,10,SPFskate+13,10,SPFskate+14,10,SPFskate+15,-15
.d2:								; direction 2
	dw SPFskate+17,10,SPFskate+18,10,SPFskate+21,10,SPFskate+22,10,SPFskate+23,-15
.d3:								; direction 3
	dw SPFskate+25,10,SPFskate+26,10,SPFskate+29,10,SPFskate+30,10,SPFskate+31,-15
.d4:								; direction 4
	dw SPFskate+33,10,SPFskate+34,10,SPFskate+37,10,SPFskate+38,10,SPFskate+39,-15
.d5:								; direction 5
	dw SPFskate+41,10,SPFskate+42,10,SPFskate+45,10,SPFskate+46,10,SPFskate+47,-15
.d6:								; direction 6
	dw SPFskate+49,10,SPFskate+50,10,SPFskate+53,10,SPFskate+54,10,SPFskate+55,-15
.d7:								; direction 7
	dw SPFskate+57,10,SPFskate+58,10,SPFskate+61,10,SPFskate+62,10,SPFskate+63,-15
