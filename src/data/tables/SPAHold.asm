SPAHold:							; per direction (facedir & 7, * 2): holding
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFHold,-30
.d1:								; direction 1
	dw SPFHold+1,-30
.d2:								; direction 2
	dw SPFHold+2,-30
.d3:								; direction 3
	dw SPFHold+3,-30
.d4:								; direction 4
	dw SPFHold+4,-30
.d5:								; direction 5
	dw SPFHold+5,-30
.d6:								; direction 6
	dw SPFHold+6,-30
.d7:								; direction 7
	dw SPFHold+7,-30
SPAHold2:							; per direction (facedir & 7, * 2): held
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFHold,-36
.d1:								; direction 1
	dw SPFHold+1,-36
.d2:								; direction 2
	dw SPFHold+2,-36
.d3:								; direction 3
	dw SPFHold+3,-36
.d4:								; direction 4
	dw SPFHold+4,-36
.d5:								; direction 5
	dw SPFHold+5,-36
.d6:								; direction 6
	dw SPFHold+6,-36
.d7:								; direction 7
	dw SPFHold+7,-36
