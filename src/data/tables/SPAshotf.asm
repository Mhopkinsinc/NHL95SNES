SPAshotf:							; per direction (facedir & 7, * 2): the forehand shot
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswing+1,4,SPFswing,4,SPFswing+1,4,SPFswing+2,4,SPFswing+3,0,SPFswing+4,0,SPFswing+5,0,SPFswing+3,-20
.d1:								; direction 1
	dw SPFswing+7,4,SPFswing+6,4,SPFswing+7,4,SPFswing+8,4,SPFswing+9,0,SPFswing+10,0,SPFswing+11,0,SPFswing+9
	dw -20
.d2:								; direction 2
	dw SPFswing+13,4,SPFswing+12,4,SPFswing+13,4,SPFswing+14,4,SPFswing+15,0,SPFswing+16,0,SPFswing+17,0
	dw SPFswing+15,-20
.d3:								; direction 3
	dw SPFswing+19,4,SPFswing+18,4,SPFswing+19,4,SPFswing+20,4,SPFswing+21,0,SPFswing+22,0,SPFswing+23,0
	dw SPFswing+21,-20
.d4:								; direction 4
	dw SPFswing+25,4,SPFswing+24,4,SPFswing+25,4,SPFswing+26,4,SPFswing+27,0,SPFswing+28,0,SPFswing+29,0
	dw SPFswing+27,-20
.d5:								; direction 5
	dw SPFswing+31,4,SPFswing+30,4,SPFswing+31,4,SPFswing+32,4,SPFswing+33,0,SPFswing+34,0,SPFswing+35,0
	dw SPFswing+33,-20
.d6:								; direction 6
	dw SPFswing+37,4,SPFswing+36,4,SPFswing+37,4,SPFswing+38,4,SPFswing+39,0,SPFswing+40,0,SPFswing+41,0
	dw SPFswing+39,-20
.d7:								; direction 7
	dw SPFswing+43,4,SPFswing+42,4,SPFswing+43,4,SPFswing+44,4,SPFswing+45,0,SPFswing+46,0,SPFswing+47,0
	dw SPFswing+45,-20
