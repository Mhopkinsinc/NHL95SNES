SPAhook:							; per direction (facedir & 7, * 2): hooking
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFhook+1,-30
.d1:								; direction 1
	dw SPFhook+3,-30
.d2:								; direction 2
	dw SPFhook+3,-30
.d3:								; direction 3
	dw SPFhook+5,-30
.d4:								; direction 4
	dw SPFhook+7,-30
.d5:								; direction 5
	dw SPFhook+9,-30
.d6:								; direction 6
	dw SPFhook+9,-30
.d7:								; direction 7
	dw SPFhook+11,-30
