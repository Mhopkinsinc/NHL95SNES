SPApflip:							; per direction (facedir & 7, * 2): the puck flip
	dw .d0,.d0,.d0,.d0,.d4,.d4,.d4,.d4
	dw 1
.d0:								; directions 0-3
	dw SPFpuck+1,3,SPFpuck+2,3,SPFpuck+3,3,SPFpuck+4,3,SPFpuck+5,3,SPFpuck+6,3,SPFpuck+7,3,SPFpuck+8,3
	dw SPFpuck+9,3,SPFpuck+10,-1
.d4:								; directions 4-7
	dw SPFpuck+1,-4096
