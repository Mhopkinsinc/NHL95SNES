SPAboardleft:						; per direction (facedir & 7, * 2): checked into the boards from the left
	dw .d0,.d0,.d2,.d2,.d4,.d4,.d6,.d6
	dw 0
.d0:								; directions 0, 1
	dw SPFboardleft,6,SPFboardleft+1,6,SPFboardleft+2,6,SPFboardleft+3,75,SPFfallfwd+4,6,SPFfallfwd+5,-6
.d2:								; directions 2, 3
	dw SPFboardleft+4,6,SPFboardleft+5,6,SPFboardleft+6,6,SPFboardright+7,75,SPFfallback+14,6,SPFfallfwd+40,6
	dw SPFfallfwd+41,-6
.d4:								; directions 4, 5
	dw SPFboardleft+7,6,SPFboardleft+8,6,SPFboardleft+9,6,SPFboardleft+10,75,SPFfallfwd+28,6,SPFfallfwd+29,-6
.d6:								; directions 6, 7
	dw SPFboardleft+11,6,SPFboardleft+12,6,SPFboardleft+13,6,SPFboardright+15,75,SPFfallback+34,6
	dw SPFfallfwd+16,6,SPFfallfwd+17,-6
