SPAboardfront:						; per direction (facedir & 7, * 2): checked into the boards from the front
	dw .d0,.d0,.d2,.d2,.d4,.d4,.d6,.d6
	dw 0
.d0:								; directions 0, 1
	dw SPFboardfront,6,SPFboardfront+1,6,SPFboardfront+2,6,SPFboardfront+3,75,SPFfallback+4,6,SPFfallfwd+28,6
	dw SPFfallfwd+29,-6
.d2:								; directions 2, 3
	dw SPFboardfront+4,6,SPFboardfront+5,6,SPFboardfront+6,6,SPFboardfront+7,75,SPFfallfwd+16,6,SPFfallfwd+17
	dw -6
.d4:								; directions 4, 5
	dw SPFboardfront+8,6,SPFboardfront+9,6,SPFboardfront+10,6,SPFboardfront+11,75,SPFfallback+24,6
	dw SPFfallfwd+4,6,SPFfallfwd+5,-6
.d6:								; directions 6, 7
	dw SPFboardfront+12,6,SPFboardfront+13,6,SPFboardfront+14,6,SPFboardfront+15,75,SPFfallfwd+40,6
	dw SPFfallfwd+41,-6
