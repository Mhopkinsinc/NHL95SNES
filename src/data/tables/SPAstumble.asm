SPAstumble:							; per direction (facedir & 7, * 2): stumbling
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFstumble,6,SPFstumble+1,6,SPFstumble+1,8,SPFstumble+2,6,SPFstumble+3,-6
.d1:								; direction 1
	dw SPFstumble+4,6,SPFstumble+5,6,SPFstumble+5,8,SPFstumble+6,6,SPFstumble+7,-6
.d2:								; direction 2
	dw SPFstumble+8,6,SPFstumble+9,6,SPFstumble+9,8,SPFstumble+10,6,SPFstumble+11,-6
.d3:								; direction 3
	dw SPFstumble+12,6,SPFstumble+13,6,SPFstumble+13,8,SPFstumble+14,6,SPFstumble+15,-6
.d4:								; direction 4
	dw SPFstumble+16,6,SPFstumble+17,6,SPFstumble+17,8,SPFstumble+18,6,SPFstumble+19,-6
.d5:								; direction 5
	dw SPFstumble+20,6,SPFstumble+21,6,SPFstumble+21,8,SPFstumble+22,6,SPFstumble+23,-6
.d6:								; direction 6
	dw SPFstumble+24,6,SPFstumble+25,6,SPFstumble+25,8,SPFstumble+26,6,SPFstumble+27,-6
.d7:								; direction 7
	dw SPFstumble+28,6,SPFstumble+29,6,SPFstumble+29,8,SPFstumble+30,6,SPFstumble+31,-6
