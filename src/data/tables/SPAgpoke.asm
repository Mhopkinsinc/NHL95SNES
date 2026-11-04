SPAgpoke:							; per direction (facedir & 7, * 2): the goalie's poke check
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFgskate,4,SPFgdive,15,SPFgskate,-6
.d1:								; direction 1
	dw SPFgskate+3,4,SPFgdive+3,15,SPFgskate+3,-6
.d2:								; direction 2
	dw SPFgskate+6,4,SPFgdive+6,15,SPFgskate+6,-6
.d3:								; direction 3
	dw SPFgskate+9,4,SPFgdive+9,15,SPFgskate+9,-6
.d4:								; direction 4
	dw SPFgskate+12,4,SPFgdive+12,15,SPFgskate+12,-6
.d5:								; direction 5
	dw SPFgskate+15,4,SPFgdive+15,15,SPFgskate+15,-6
.d6:								; direction 6
	dw SPFgskate+18,4,SPFgdive+18,15,SPFgskate+18,-6
.d7:								; direction 7
	dw SPFgskate+21,4,SPFgdive+21,15,SPFgskate+21,-6
