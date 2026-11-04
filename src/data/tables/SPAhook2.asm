SPAhook2:							; per direction (facedir & 7, * 2): hooked
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFhook,4,SPFhook+1,4,SPFhook,4,SPFhook+1,-4
.d1:								; direction 1
	dw SPFhook+2,4,SPFhook+3,4,SPFhook+2,4,SPFhook+3,-4
.d2:								; direction 2
	dw SPFhook+4,4,SPFhook+5,4,SPFhook+4,4,SPFhook+5,-4
.d3:								; direction 3
	dw SPFhook+6,4,SPFhook+7,4,SPFhook+6,4,SPFhook+7,-4
.d4:								; direction 4
	dw SPFhook+8,4,SPFhook+9,4,SPFhook+8,4,SPFhook+9,-4
.d5:								; direction 5
	dw SPFhook+10,4,SPFhook+11,4,SPFhook+10,4,SPFhook+11,-4
.d6:								; direction 6
	dw SPFhook+12,4,SPFhook+13,4,SPFhook+12,4,SPFhook+13,-4
.d7:								; direction 7
	dw SPFhook+14,4,SPFhook+15,4,SPFhook+14,4,SPFhook+15,-4
