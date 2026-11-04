SPAboardback:						; per direction (facedir & 7, * 2): checked into the boards from behind
	dw .d0,.d0,.d2,.d2,.d4,.d4,.d6,.d6
	dw 0
.d0:								; directions 0, 1
	dw SPFboardback,6,SPFboardback+1,6,SPFboardback+2,6,SPFboardfront+3,75,SPFfallback+4,6,SPFfallfwd+28,6
	dw SPFfallfwd+29,-6
.d2:								; directions 2, 3
	dw SPFboardback+3,6,SPFboardback+4,6,SPFboardback+5,6,SPFboardback+6,75,SPFfallfwd+16,6,SPFfallfwd+17,-6
.d4:								; directions 4, 5
	dw SPFboardback+7,6,SPFboardback+8,6,SPFboardback+9,6,SPFboardfront+11,75,SPFfallback+24,6,SPFfallfwd+4,6
	dw SPFfallfwd+5,-6
.d6:								; directions 6, 7
	dw SPFboardback+10,6,SPFboardback+11,6,SPFboardback+12,6,SPFboardback+13,75,SPFfallfwd+40,6,SPFfallfwd+41
	dw -6
