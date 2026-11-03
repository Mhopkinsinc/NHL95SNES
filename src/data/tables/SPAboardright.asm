SPAboardright:						; per direction (facedir & 7, * 2): checked into the boards from the right
	dw .d0,.d0,.d2,.d2,.d4,.d4,.d6,.d6
	dw 0
.d0:								; directions 0, 1
	dw SPFboardright,6,SPFboardright+1,6,SPFboardright+2,6,SPFboardright+3,75,SPFfallfwd+4,6,SPFfallfwd+5,-6
.d2:								; directions 2, 3
	dw SPFboardright+4,6,SPFboardright+5,6,SPFboardright+6,6,SPFboardright+7,75,SPFfallback+14,6,SPFfallfwd+40
	dw 6,SPFfallfwd+41,-6
.d4:								; directions 4, 5
	dw SPFboardright+8,6,SPFboardright+9,6,SPFboardright+10,6,SPFboardright+11,75,SPFfallfwd+28,6
	dw SPFfallfwd+29,-6
.d6:								; directions 6, 7
	dw SPFboardright+12,6,SPFboardright+13,6,SPFboardright+14,6,SPFboardright+15,75,SPFfallback+34,6
	dw SPFfallfwd+16,6,SPFfallfwd+17,-6
