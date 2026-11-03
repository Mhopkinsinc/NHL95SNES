SPAgsprawlr:						; per direction (facedir & 7, * 2): the goalie's sprawl to the right
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie,4,SPFGoalie+32,4,SPFGoalie+32,20,SPFgskate+29,-4
.d1:								; direction 1
	dw SPFGoalie+1,4,SPFGoalie+33,4,SPFGoalie+33,20,SPFgskate+29,-4
.d2:								; direction 2
	dw SPFGoalie+2,4,SPFGoalie+34,4,SPFGoalie+35,20,SPFgskate+31,-4
.d3:								; direction 3
	dw SPFGoalie+3,4,SPFGoalie+35,4,SPFGoalie+34,20,SPFgskate+31,-4
.d4:								; direction 4
	dw SPFGoalie+4,4,SPFGoalie+36,4,SPFGoalie+35,20,SPFgskate+11,-4
.d5:								; direction 5
	dw SPFGoalie+5,4,SPFGoalie+37,4,SPFGoalie+36,20,SPFgskate+31,-4
.d6:								; direction 6
	dw SPFGoalie+6,4,SPFGoalie+38,4,SPFGoalie+36,20,SPFgskate+31,-4
.d7:								; direction 7
	dw SPFGoalie+7,4,SPFGoalie+39,4,SPFGoalie+38,20,SPFgskate+29,-4
