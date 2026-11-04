SPAburst:							; per direction (facedir & 7, * 2): the speed burst
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFburst,6,SPFburst+1,6,SPFburst+2,6,SPFburst+3,-6
.d1:								; direction 1
	dw SPFburst+8,6,SPFburst+9,6,SPFburst+10,6,SPFburst+11,-6
.d2:								; direction 2
	dw SPFburst+16,6,SPFburst+17,6,SPFburst+18,6,SPFburst+19,-6
.d3:								; direction 3
	dw SPFburst+24,6,SPFburst+25,6,SPFburst+26,6,SPFburst+27,-6
.d4:								; direction 4
	dw SPFburst+32,6,SPFburst+33,6,SPFburst+34,6,SPFburst+35,-6
.d5:								; direction 5
	dw SPFburst+40,6,SPFburst+41,6,SPFburst+42,6,SPFburst+43,-6
.d6:								; direction 6
	dw SPFburst+48,6,SPFburst+49,6,SPFburst+50,6,SPFburst+51,-6
.d7:								; direction 7
	dw SPFburst+56,6,SPFburst+57,6,SPFburst+58,6,SPFburst+59,-6
