SPAcatch:							; per direction (facedir & 7, * 2): catching the puck
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFcatch,6,SPFcatch+1,-6
.d1:								; direction 1
	dw SPFcatch+2,6,SPFcatch+3,-6
.d2:								; direction 2
	dw SPFcatch+4,6,SPFcatch+5,-6
.d3:								; direction 3
	dw SPFcatch+6,6,SPFcatch+7,-6
.d4:								; direction 4
	dw SPFcatch+8,6,SPFcatch+9,-6
.d5:								; direction 5
	dw SPFcatch+10,6,SPFcatch+11,-6
.d6:								; direction 6
	dw SPFcatch+12,6,SPFcatch+13,-6
.d7:								; direction 7
	dw SPFcatch+14,6,SPFcatch+15,-6
