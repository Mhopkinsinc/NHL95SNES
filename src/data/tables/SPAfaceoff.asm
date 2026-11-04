SPAfaceoff:							; per direction (facedir & 7, * 2): the face off
	dw .d0,.d1,.d1,.d1,.d1,.d1,.d1,.d1
	dw 0
.d0:								; direction 0
	dw SPFsweep,2,SPFsweep+1,10,SPFskatewp+2,-6
.d1:								; directions 1-7
	dw SPFsweep+8,2,SPFsweep+9,10,SPFskatewp+34,-6
