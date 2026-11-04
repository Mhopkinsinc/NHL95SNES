SPAgskate:							; per direction (facedir & 7, * 2): the goalie skating
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 1
.d0:								; direction 0
	dw SPFgskate,10,SPFgskate+1,10,SPFgskate+2,10,SPFgskate+3,-15
.d1:								; direction 1
	dw SPFgskate+4,10,SPFgskate+5,10,SPFgskate+6,10,SPFgskate+7,-15
.d2:								; direction 2
	dw SPFgskate+8,10,SPFgskate+9,10,SPFgskate+10,10,SPFgskate+11,-15
.d3:								; direction 3
	dw SPFgskate+12,10,SPFgskate+13,10,SPFgskate+14,10,SPFgskate+15,-15
.d4:								; direction 4
	dw SPFgskate+16,10,SPFgskate+17,10,SPFgskate+18,10,SPFgskate+19,-15
.d5:								; direction 5
	dw SPFgskate+20,10,SPFgskate+21,10,SPFgskate+22,10,SPFgskate+23,-15
.d6:								; direction 6
	dw SPFgskate+24,10,SPFgskate+25,10,SPFgskate+26,10,SPFgskate+27,-15
.d7:								; direction 7
	dw SPFgskate+28,10,SPFgskate+29,10,SPFgskate+30,10,SPFgskate+31,-15
