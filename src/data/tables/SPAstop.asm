SPAstop:							; per direction (facedir & 7, * 2): stopping
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 1
.d0:								; direction 0
	dw SPFstop,4,SPFstop+1,-30
.d1:								; direction 1
	dw SPFstop+2,4,SPFstop+3,-30
.d2:								; direction 2
	dw SPFstop+4,4,SPFstop+5,-30
.d3:								; direction 3
	dw SPFstop+6,4,SPFstop+7,-30
.d4:								; direction 4
	dw SPFstop+8,4,SPFstop+9,-30
.d5:								; direction 5
	dw SPFstop+10,4,SPFstop+11,-30
.d6:								; direction 6
	dw SPFstop+12,4,SPFstop+13,-30
.d7:								; direction 7
	dw SPFstop+14,4,SPFstop+15,-30
