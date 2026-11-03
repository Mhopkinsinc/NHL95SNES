SPAfallfwd:							; per direction (facedir & 7, * 2): falling forward
	dw .d0,.d1,.d2,.d3,.d4,.d5,.d6,.d7
	dw 0
.d0:								; direction 0
	dw SPFfallfwd,6,SPFfallfwd+1,6,SPFfallfwd+2,6,SPFfallfwd+3,100,SPFfallfwd+4,8,SPFfallfwd+5,-8
.d1:								; direction 1
	dw SPFfallfwd+6,6,SPFfallfwd+7,6,SPFfallfwd+8,6,SPFfallfwd+9,100,SPFfallfwd+10,8,SPFfallfwd+11,-8
.d2:								; direction 2
	dw SPFfallfwd+12,6,SPFfallfwd+13,6,SPFfallfwd+14,6,SPFfallfwd+15,100,SPFfallfwd+16,8,SPFfallfwd+17,-8
.d3:								; direction 3
	dw SPFfallfwd+18,6,SPFfallfwd+19,6,SPFfallfwd+20,6,SPFfallfwd+21,100,SPFfallfwd+22,8,SPFfallfwd+23,-8
.d4:								; direction 4
	dw SPFfallfwd+24,6,SPFfallfwd+25,6,SPFfallfwd+26,6,SPFfallfwd+27,100,SPFfallfwd+28,8,SPFfallfwd+29,-8
.d5:								; direction 5
	dw SPFfallfwd+30,6,SPFfallfwd+31,6,SPFfallfwd+32,6,SPFfallfwd+33,100,SPFfallfwd+34,8,SPFfallfwd+35,-8
.d6:								; direction 6
	dw SPFfallfwd+36,6,SPFfallfwd+37,6,SPFfallfwd+38,6,SPFfallfwd+39,100,SPFfallfwd+40,8,SPFfallfwd+41,-8
.d7:								; direction 7
	dw SPFfallfwd+42,6,SPFfallfwd+43,6,SPFfallfwd+44,6,SPFfallfwd+45,100,SPFfallfwd+46,8,SPFfallfwd+47,-8
