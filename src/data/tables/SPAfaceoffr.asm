SPAfaceoffr:						; per direction (facedir & 7, * 2): the face off (r)
	dw .d0,.d1,.d1,.d1,.d1,.d1,.d1,.d1
	dw 0
.d0:								; direction 0
	dw SPFskatewp+2,-5
.d1:								; directions 1-7
	dw SPFskatewp+34,-5
