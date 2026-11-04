SPAflip:							; per direction (facedir & 7, * 2): flipping over
	dw .d0,.d0,.d0,.d0,.d4,.d4,.d4,.d4
	dw 0
.d0:								; directions 0-3
	dw $0312,6,SPFflip,6,SPFflip+1,6,SPFflip+2,6,SPFfallback+2,100,SPFfallback+3,8,SPFfallback+4,-8
.d4:								; directions 4-7
	dw $0319,6,SPFflip+3,6,SPFflip+4,6,SPFflip+5,6,SPFfallback+22,100,SPFfallback+23,8,SPFfallback+24,-8
