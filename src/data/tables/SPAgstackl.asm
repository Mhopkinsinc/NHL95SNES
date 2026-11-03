SPAgstackl:							; per direction (facedir & 7, * 2): the goalie's stacked pads save to the
									; left
	dw .d0,.d1,.d1,.d3,.d4,.d5,.d5,.d7
	dw 0
.d0:								; direction 0
	dw SPFgstack,8,SPFgstack+1,-20
.d1:								; directions 1, 2
	dw SPFgstack+2,8,SPFgstack+3,-20
.d3:								; direction 3
	dw SPFgstack+4,8,SPFgstack+5,-20
.d4:								; direction 4
	dw SPFgstack+6,8,SPFgstack+7,-20
.d5:								; directions 5, 6
	dw SPFgstack+8,8,SPFgstack+9,-20
.d7:								; direction 7
	dw SPFgstack+10,8,SPFgstack+11,-20
