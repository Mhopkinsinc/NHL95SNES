SPAgdive:							; per direction (facedir & 7, * 2): the goalie's dive
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgdive,8,SPFgdive+2,48,SPFgdive,-8
.d1:								; direction 1
	dw SPFgdive+3,8,SPFgdive+5,48,SPFgdive+3,-8
.d2:								; direction 2
	dw SPFgdive+6,8,SPFgdive+8,48,SPFgdive+6,-8
.d3:								; direction 3
	dw SPFgdive+9,8,SPFgdive+11,48,SPFgdive+9,-8
.d4:								; direction 4
	dw SPFgdive+12,8,SPFgdive+14,48,SPFgdive+12,-8
.d5:								; direction 5
	dw SPFgdive+15,8,SPFgdive+17,48,SPFgdive+15,-8
.d6:								; direction 6
	dw SPFgdive+18,8,SPFgdive+20,48,SPFgdive+18,-8
.d7:								; direction 7
	dw SPFgdive+21,8,SPFgdive+23,48,SPFgdive+21,-8
