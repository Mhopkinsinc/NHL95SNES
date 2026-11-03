SPApassb:							; per direction (facedir & 7, * 2): the backhand pass
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswingb,4,SPFswingb+1,4,SPFswingb+2,-20
.d1:								; direction 1
	dw SPFswingb+3,4,SPFswingb+4,4,SPFswingb+5,-20
.d2:								; direction 2
	dw SPFswingb+6,4,SPFswingb+7,4,SPFswingb+8,-20
.d3:								; direction 3
	dw SPFswingb+9,4,SPFswingb+10,4,SPFswingb+11,-20
.d4:								; direction 4
	dw SPFswingb+12,4,SPFswingb+13,4,SPFswingb+14,-20
.d5:								; direction 5
	dw SPFswingb+15,4,SPFswingb+16,4,SPFswingb+17,-20
.d6:								; direction 6
	dw SPFswingb+18,4,SPFswingb+19,4,SPFswingb+20,-20
.d7:								; direction 7
	dw SPFswingb+21,4,SPFswingb+22,4,SPFswingb+23,-20
