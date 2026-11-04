SPAgbutterfly:						; per direction (facedir & 7, * 2): the goalie's butterfly save
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgbutterfly,4,SPFgbutterfly,4,SPFgskate+29,20,SPFgskate+29,-4
.d1:								; direction 1
	dw SPFgbutterfly,4,SPFgbutterfly,4,SPFgskate+29,20,SPFgskate+29,-4
.d2:								; direction 2
	dw SPFgbutterfly,4,SPFgbutterfly,4,SPFgskate+29,20,SPFgskate+29,-4
.d3:								; direction 3
	dw SPFgbutterfly+1,4,SPFgbutterfly+1,4,SPFgskate+31,20,SPFgskate+31,-4
.d4:								; direction 4
	dw SPFgbutterfly+1,4,SPFgbutterfly+1,4,SPFgskate+11,20,SPFgskate+11,-4
.d5:								; direction 5
	dw SPFgbutterfly+1,4,SPFgbutterfly+1,4,SPFgskate+31,20,SPFgskate+31,-4
.d6:								; direction 6
	dw SPFgbutterfly+1,4,SPFgbutterfly+1,4,SPFgskate+31,20,SPFgskate+31,-4
.d7:								; direction 7
	dw SPFgbutterfly,4,SPFgbutterfly,4,SPFgskate+31,20,SPFgskate+31,-4
