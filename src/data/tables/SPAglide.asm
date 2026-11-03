SPAglide:							; per direction (facedir & 7, * 2): gliding
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFglide,-8
.d1:								; direction 1
	dw SPFglide+1,-8
.d2:								; direction 2
	dw SPFglide+2,-8
.d3:								; direction 3
	dw SPFglide+3,-8
.d4:								; direction 4
	dw SPFglide+4,-8
.d5:								; direction 5
	dw SPFglide+5,-8
.d6:								; direction 6
	dw SPFglide+6,-8
.d7:								; direction 7
	dw SPFglide+7,-8
