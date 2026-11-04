SPAcelebrate:						; per direction (facedir & 7, * 2): the goal celebration
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFcelebrate,5,SPFcelebrate+1,6,SPFcelebrate+1,6,SPFcelebrate,12,SPFcelebrate+1,40,SPFcelebrate+1,-15
.d1:								; direction 1
	dw SPFcelebrate+2,5,SPFcelebrate+3,6,SPFcelebrate+3,6,SPFcelebrate+2,12,SPFcelebrate+3,40,SPFcelebrate+3
	dw -15
.d2:								; direction 2
	dw SPFcelebrate+4,5,SPFcelebrate+5,6,SPFcelebrate+5,6,SPFcelebrate+4,12,SPFcelebrate+5,40,SPFcelebrate+5
	dw -15
.d3:								; direction 3
	dw SPFcelebrate+6,5,SPFcelebrate+7,6,SPFcelebrate+7,6,SPFcelebrate+6,12,SPFcelebrate+7,40,SPFcelebrate+7
	dw -15
.d4:								; direction 4
	dw SPFcelebrate+8,5,SPFcelebrate+9,6,SPFcelebrate+9,6,SPFcelebrate+8,12,SPFcelebrate+9,40,SPFcelebrate+9
	dw -15
.d5:								; direction 5
	dw SPFcelebrate+10,5,SPFcelebrate+11,6,SPFcelebrate+11,6,SPFcelebrate+10,12,SPFcelebrate+11,40
	dw SPFcelebrate+11,-15
.d6:								; direction 6
	dw SPFcelebrate+12,5,SPFcelebrate+13,6,SPFcelebrate+13,6,SPFcelebrate+12,12,SPFcelebrate+13,40
	dw SPFcelebrate+13,-15
.d7:								; direction 7
	dw SPFcelebrate+14,5,SPFcelebrate+15,6,SPFcelebrate+15,6,SPFcelebrate+14,12,SPFcelebrate+15,40
	dw SPFcelebrate+15,-15
