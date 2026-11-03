SPApassf:							; per direction (facedir & 7, * 2): the forehand pass
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFswing+3,4,SPFswing+4,4,SPFswing+3,-20
.d1:								; direction 1
	dw SPFswing+8,4,SPFswing+9,4,SPFswing+8,-20
.d2:								; direction 2
	dw SPFswing+14,4,SPFswing+15,4,SPFswing+14,-20
.d3:								; direction 3
	dw SPFswing+21,4,SPFswing+22,4,SPFswing+21,-20
.d4:								; direction 4
	dw SPFswing+27,4,SPFswing+28,4,SPFswing+27,-20
.d5:								; direction 5
	dw SPFswing+33,4,SPFswing+34,4,SPFswing+33,-20
.d6:								; direction 6
	dw SPFswing+39,4,SPFswing+40,4,SPFswing+39,-20
.d7:								; direction 7
	dw SPFswing+45,4,SPFswing+46,4,SPFswing+45,-20
