SPApump2:							; per direction (facedir & 7, * 2): the second fist pump
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFpump2+1,8,SPFpump2,8,SPFpump2+1,-18
.d1:								; direction 1
	dw SPFpump2+3,8,SPFpump2+2,8,SPFpump2+3,-18
.d2:								; direction 2
	dw SPFpump2+5,8,SPFpump2+4,8,SPFpump2+5,-18
.d3:								; direction 3
	dw SPFpump2+7,8,SPFpump2+6,8,SPFpump2+7,-18
.d4:								; direction 4
	dw SPFpump2+9,8,SPFpump2+8,8,SPFpump2+9,-18
.d5:								; direction 5
	dw SPFpump2+11,8,SPFpump2+10,8,SPFpump2+11,-18
.d6:								; direction 6
	dw SPFpump2+13,8,SPFpump2+12,8,SPFpump2+13,-18
.d7:								; direction 7
	dw SPFpump2+15,8,SPFpump2+14,8,SPFpump2+15,-18
