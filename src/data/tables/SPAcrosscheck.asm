SPAcrosscheck:						; per direction (facedir & 7, * 2): the cross check animation: (frame,
									; time) pairs, the last time negative
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFcrosscheck,10,SPFcrosscheck,-8
.d1:								; direction 1
	dw SPFcrosscheck+1,10,SPFcrosscheck+1,-8
.d2:								; direction 2
	dw SPFcrosscheck+2,10,SPFcrosscheck+2,-8
.d3:								; direction 3
	dw SPFcrosscheck+3,10,SPFcrosscheck+3,-8
.d4:								; direction 4
	dw SPFcrosscheck+4,10,SPFcrosscheck+4,-8
.d5:								; direction 5
	dw SPFcrosscheck+5,10,SPFcrosscheck+5,-8
.d6:								; direction 6
	dw SPFcrosscheck+6,10,SPFcrosscheck+6,-8
.d7:								; direction 7
	dw SPFcrosscheck+7,10,SPFcrosscheck+7,-8
