SPAgstackr:							; per direction (facedir & 7, * 2): the goalie's stacked pads save to the
									; right
	dw .d0,.d1,.d1,.d3,.d4,.d5,.d5,.d7
	dw 0
.d0:								; direction 0
	dw SPFgstack+12,8,SPFgstack+13,-20
.d1:								; directions 1, 2
	dw SPFgstack+14,8,SPFgstack+15,-20
.d3:								; direction 3
	dw SPFgstack+16,8,SPFgstack+17,-20
.d4:								; direction 4
	dw SPFgstack+18,8,SPFgstack+19,-20
.d5:								; directions 5, 6
	dw SPFgstack+20,8,SPFgstack+21,-20
.d7:								; direction 7
	dw SPFgstack+22,8,SPFgstack+23,-20
