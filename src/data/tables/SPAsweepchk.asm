SPAsweepchk:						; per direction (facedir & 7, * 2): the sweep check
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFsweep+1,4,SPFsweep+3,8,SPFsweep+1,-4
.d1:								; direction 1
	dw SPFsweep+3,4,SPFsweep+5,8,SPFsweep+3,-4
.d2:								; direction 2
	dw SPFsweep+5,4,SPFsweep+7,8,SPFsweep+5,-4
.d3:								; direction 3
	dw SPFsweep+7,4,SPFsweep+9,8,SPFsweep+7,-4
.d4:								; direction 4
	dw SPFsweep+9,4,SPFsweep+11,8,SPFsweep+9,-4
.d5:								; direction 5
	dw SPFsweep+11,4,SPFsweep+13,8,SPFsweep+11,-4
.d6:								; direction 6
	dw SPFsweep+13,4,SPFsweep+15,8,SPFsweep+13,-4
.d7:								; direction 7
	dw SPFsweep+15,4,SPFfallfwd+1,8,SPFsweep+15,-4
