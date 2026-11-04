SPAshotb:							; per direction (facedir & 7, * 2): the backhand shot
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswing,4,SPFswing,4,SPFswing+1,4,SPFswingb+2,4,SPFswingb+1,0,SPFswingb+1,0,SPFswingb,0,SPFswingb+1
	dw -20
.d1:								; direction 1
	dw SPFswing+6,4,SPFswing+6,4,SPFswing+7,4,SPFswingb+5,4,SPFswingb+4,0,SPFswingb+4,0,SPFswingb+3,0
	dw SPFswingb+4,-20
.d2:								; direction 2
	dw SPFswing+12,4,SPFswing+12,4,SPFswing+13,4,SPFswingb+8,4,SPFswingb+7,0,SPFswingb+7,0,SPFswingb+6,0
	dw SPFswingb+7,-20
.d3:								; direction 3
	dw SPFswing+18,4,SPFswing+18,4,SPFswing+19,4,SPFswingb+11,4,SPFswingb+10,0,SPFswingb+10,0,SPFswingb+9,0
	dw SPFswingb+10,-20
.d4:								; direction 4
	dw SPFswing+24,4,SPFswing+24,4,SPFswing+25,4,SPFswingb+14,4,SPFswingb+13,0,SPFswingb+13,0,SPFswingb+12,0
	dw SPFswingb+13,-20
.d5:								; direction 5
	dw SPFswing+30,4,SPFswing+30,4,SPFswing+31,4,SPFswingb+17,4,SPFswingb+16,0,SPFswingb+16,0,SPFswingb+15,0
	dw SPFswingb+16,-20
.d6:								; direction 6
	dw SPFswing+36,4,SPFswing+36,4,SPFswing+37,4,SPFswingb+20,4,SPFswingb+19,0,SPFswingb+19,0,SPFswingb+18,0
	dw SPFswingb+19,-20
.d7:								; direction 7
	dw SPFswing+42,4,SPFswing+42,4,SPFswing+43,4,SPFswingb+23,4,SPFswingb+22,0,SPFswingb+22,0,SPFswingb+21,0
	dw SPFswingb+22,-20
