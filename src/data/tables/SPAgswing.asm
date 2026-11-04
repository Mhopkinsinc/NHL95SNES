SPAgswing:							; per direction (facedir & 7, * 2): the goalie's stick swing
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgstack+24,5,SPFgstack+25,8,SPFgstack+24,-16
.d1:								; direction 1
	dw SPFgstack+26,5,SPFgstack+27,8,SPFgstack+26,-16
.d2:								; direction 2
	dw SPFgstack+28,5,SPFgstack+29,8,SPFgstack+28,-16
.d3:								; direction 3
	dw SPFgstack+30,5,SPFgstack+31,8,SPFgstack+30,-16
.d4:								; direction 4
	dw SPFgstack+32,5,SPFgstack+33,8,SPFgstack+32,-16
.d5:								; direction 5
	dw SPFgstack+34,5,SPFgstack+35,8,SPFgstack+34,-16
.d6:								; direction 6
	dw SPFgstack+36,5,SPFgstack+37,8,SPFgstack+36,-16
.d7:								; direction 7
	dw SPFgstack+38,5,SPFgstack+39,8,SPFgstack+38,-16
