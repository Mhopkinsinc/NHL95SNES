SPAgsprawll:						; per direction (facedir & 7, * 2): the goalie's sprawl to the left
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie+8,4,SPFGoalie+8,4,SPFGoalie+8,20,SPFGoalie+8,-4
.d1:								; direction 1
	dw SPFGoalie+9,4,SPFGoalie+9,4,SPFGoalie+9,20,SPFGoalie+9,-4
.d2:								; direction 2
	dw SPFGoalie+10,4,SPFGoalie+10,4,SPFGoalie+10,20,SPFGoalie+10,-4
.d3:								; direction 3
	dw SPFGoalie+11,4,SPFGoalie+11,4,SPFGoalie+11,20,SPFGoalie+11,-4
.d4:								; direction 4
	dw SPFGoalie+12,4,SPFGoalie+12,4,SPFGoalie+12,20,SPFGoalie+12,-4
.d5:								; direction 5
	dw SPFGoalie+13,4,SPFGoalie+13,4,SPFGoalie+13,20,SPFGoalie+13,-4
.d6:								; direction 6
	dw SPFGoalie+14,4,SPFGoalie+14,4,SPFGoalie+14,20,SPFGoalie+14,-4
.d7:								; direction 7
	dw SPFGoalie+15,4,SPFGoalie+15,4,SPFGoalie+15,20,SPFGoalie+15,-4
