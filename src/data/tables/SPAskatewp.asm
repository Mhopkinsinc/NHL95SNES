SPAskatewp:							; per direction (facedir & 7, * 2): skating with the puck
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskatewp+1,10,SPFskatewp+2,10,SPFskatewp+5,10,SPFskatewp+6,10,SPFskatewp+7,-15
.d1:								; direction 1
	dw SPFskatewp+9,10,SPFskatewp+10,10,SPFskatewp+13,10,SPFskatewp+14,10,SPFskatewp+15,-15
.d2:								; direction 2
	dw SPFskatewp+17,10,SPFskatewp+18,10,SPFskatewp+21,10,SPFskatewp+22,10,SPFskatewp+23,-15
.d3:								; direction 3
	dw SPFskatewp+25,10,SPFskatewp+26,10,SPFskatewp+29,10,SPFskatewp+30,10,SPFskatewp+31,-15
.d4:								; direction 4
	dw SPFskatewp+33,10,SPFskatewp+34,10,SPFskatewp+37,10,SPFskatewp+38,10,SPFskatewp+39,-15
.d5:								; direction 5
	dw SPFskatewp+41,10,SPFskatewp+42,10,SPFskatewp+45,10,SPFskatewp+46,10,SPFskatewp+47,-15
.d6:								; direction 6
	dw SPFskatewp+49,10,SPFskatewp+50,10,SPFskatewp+53,10,SPFskatewp+54,10,SPFskatewp+55,-15
.d7:								; direction 7
	dw SPFskatewp+57,10,SPFskatewp+58,10,SPFskatewp+61,10,SPFskatewp+62,10,SPFskatewp+63,-15
