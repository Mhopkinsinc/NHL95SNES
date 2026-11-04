SPAgcover:							; per direction (facedir & 7, * 2): the goalie covering the puck
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgbutterfly,6,SPFgbutterfly,6,SPFgdive+2,90,SPFgbutterfly,6,SPFgbutterfly,6,SPFgbutterfly,-4
.d1:								; direction 1
	dw SPFgbutterfly,6,SPFgbutterfly,6,SPFgdive+2,90,SPFgbutterfly,6,SPFgbutterfly,6,SPFgbutterfly,-4
.d2:								; direction 2
	dw SPFgbutterfly,6,SPFgbutterfly,6,SPFgdive+2,90,SPFgbutterfly,6,SPFgbutterfly,6,SPFgbutterfly,-4
.d3:								; direction 3
	dw SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgdive+14,90,SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgbutterfly+1
	dw -4
.d4:								; direction 4
	dw SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgdive+14,90,SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgbutterfly+1
	dw -4
.d5:								; direction 5
	dw SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgdive+14,90,SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgbutterfly+1
	dw -4
.d6:								; direction 6
	dw SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgdive+14,90,SPFgbutterfly+1,6,SPFgbutterfly+1,6,SPFgbutterfly+1
	dw -4
.d7:								; direction 7
	dw SPFgbutterfly,6,SPFgbutterfly,6,SPFgdive+2,90,SPFgbutterfly,6,SPFgbutterfly,6,SPFgbutterfly,-4
