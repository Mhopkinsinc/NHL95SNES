SPAinjury1:							; per direction (facedir & 7, * 2): the injury
	dw .d0,.d0,.d0,.d3,.d3,.d3,.d3,.d0
	dw 0
.d0:								; directions 0-2 and 7
	dw SPFinjury1,10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1
	dw 10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,10
	dw SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,10,SPFinjury1+1,10,SPFinjury1+2,10,SPFinjury1,-1000
.d3:								; directions 3-6
	dw SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10,SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10
	dw SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10,SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10
	dw SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10,SPFinjury1+3,10,SPFinjury1+4,10,SPFinjury1+5,10
	dw SPFinjury1+3,-1000
