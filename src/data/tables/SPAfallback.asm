SPAfallback:						; per direction (facedir & 7, * 2): falling back
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFfallback,6,SPFfallback+1,6,SPFfallback+2,6,SPFfallback+3,100,SPFfallback+4,-8
.d1:								; direction 1
	dw SPFfallback+5,6,SPFfallback+6,6,SPFfallback+7,6,SPFfallback+8,100,SPFfallback+9,-8
.d2:								; direction 2
	dw SPFfallback+10,6,SPFfallback+11,6,SPFfallback+12,6,SPFfallback+13,100,SPFfallback+14,-8
.d3:								; direction 3
	dw SPFfallback+15,6,SPFfallback+16,6,SPFfallback+17,6,SPFfallback+18,100,SPFfallback+19,-8
.d4:								; direction 4
	dw SPFfallback+20,6,SPFfallback+21,6,SPFfallback+22,6,SPFfallback+23,100,SPFfallback+24,-8
.d5:								; direction 5
	dw SPFfallback+25,6,SPFfallback+26,6,SPFfallback+27,6,SPFfallback+28,100,SPFfallback+29,-8
.d6:								; direction 6
	dw SPFfallback+30,6,SPFfallback+31,6,SPFfallback+32,6,SPFfallback+33,100,SPFfallback+34,-8
.d7:								; direction 7
	dw SPFfallback+35,6,SPFfallback+36,6,SPFfallback+37,6,SPFfallback+38,100,SPFfallback+39,-8
