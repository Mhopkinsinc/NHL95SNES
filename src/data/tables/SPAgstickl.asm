SPAgstickl:							; per direction (facedir & 7, * 2): the goalie's stick save to the left
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFGoalie+24,-32
.d1:								; direction 1
	dw SPFGoalie+25,-32
.d2:								; direction 2
	dw SPFGoalie+26,-32
.d3:								; direction 3
	dw SPFGoalie+27,-32
.d4:								; direction 4
	dw SPFGoalie+28,-32
.d5:								; direction 5
	dw SPFGoalie+29,-32
.d6:								; direction 6
	dw SPFGoalie+30,-32
.d7:								; direction 7
	dw SPFGoalie+31,-32
