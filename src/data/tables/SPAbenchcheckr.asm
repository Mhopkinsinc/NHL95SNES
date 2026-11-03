SPAbenchcheckr:						; per direction (facedir & 7, * 2): the bench check to the right
	dw .d0,.d0,.d2,.d2,.d2,.d2,.d0,.d0
	dw 0
.d2:								; directions 2-5
	dw SPFbenchcheck+5,10,SPFbenchcheck+6,10,SPFbenchcheck+7,10,SPFbenchcheck+8,90,SPFbenchcheck+8,-20
.d0:								; directions 0, 1 and 6, 7
	dw SPFbenchcheck+4,10,SPFbenchcheck,10,SPFbenchcheck+1,10,SPFbenchcheck+2,90,SPFbenchcheck+3,-20
