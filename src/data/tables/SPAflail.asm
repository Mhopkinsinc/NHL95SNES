SPAflail:							; per direction (facedir & 7, * 2): flailing
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFskate+1,-45
.d1:								; direction 1
	dw SPFskate+9,-45
.d2:								; direction 2
	dw SPFskate+17,-45
.d3:								; direction 3
	dw SPFskate+25,-45
.d4:								; direction 4
	dw SPFskate+33,-45
.d5:								; direction 5
	dw SPFskate+41,-45
.d6:								; direction 6
	dw SPFskate+49,-45
.d7:								; direction 7
	dw SPFskate+57,-45
