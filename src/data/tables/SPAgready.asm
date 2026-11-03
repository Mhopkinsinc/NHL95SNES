SPAgready:							; per direction (facedir & 7, * 2): the goalie's ready stance
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 1
.d0:								; direction 0
	dw SPFgready,120,SPFgready+1,20,SPFgready,10,SPFgready+2,20,SPFgready,-9
.d1:								; direction 1
	dw SPFgready+3,120,SPFgready+4,20,SPFgready+3,10,SPFgready+5,20,SPFgready+3,-9
.d2:								; direction 2
	dw SPFGoalie+2,120,SPFGoalie+2,20,SPFGoalie+2,10,SPFGoalie+2,20,SPFGoalie+2,-9
.d3:								; direction 3
	dw SPFgready+6,120,SPFgready+7,20,SPFgready+6,10,SPFgready+8,20,SPFgready+6,-9
.d4:								; direction 4
	dw SPFgready+9,120,SPFgready+10,20,SPFgready+9,10,SPFgready+11,20,SPFgready+9,-9
.d5:								; direction 5
	dw SPFgready+12,120,SPFgready+13,20,SPFgready+12,10,SPFgready+14,20,SPFgready+12,-9
.d6:								; direction 6
	dw SPFGoalie+6,120,SPFGoalie+6,20,SPFGoalie+6,10,SPFGoalie+6,20,SPFGoalie+6,-9
.d7:								; direction 7
	dw SPFgready+15,120,SPFgready+16,20,SPFgready+15,10,SPFgready+17,20,SPFgready+15,-9
SPAgready2:							; per direction (facedir & 7, * 2): the goalie's second ready stance
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie,-10
.d1:								; direction 1
	dw SPFGoalie+1,-10
.d2:								; direction 2
	dw SPFGoalie+2,-10
.d3:								; direction 3
	dw SPFGoalie+3,-10
.d4:								; direction 4
	dw SPFGoalie+4,-10
.d5:								; direction 5
	dw SPFGoalie+5,-10
.d6:								; direction 6
	dw SPFGoalie+6,-10
.d7:								; direction 7
	dw SPFGoalie+7,-10
