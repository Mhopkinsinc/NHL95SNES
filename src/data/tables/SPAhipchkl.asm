SPAhipchkl:							; per direction (facedir & 7, * 2): the hip check to the left
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFshoulder2,-24
.d1:								; direction 1
	dw SPFshoulder2,-24
.d2:								; direction 2
	dw SPFshoulder2,-24
.d3:								; direction 3
	dw SPFshoulder2+2,-24
.d4:								; direction 4
	dw SPFshoulder2+2,-24
.d5:								; direction 5
	dw SPFshoulder2+2,-24
.d6:								; direction 6
	dw SPFshoulder2+2,-24
.d7:								; direction 7
	dw SPFshoulder2,-24
