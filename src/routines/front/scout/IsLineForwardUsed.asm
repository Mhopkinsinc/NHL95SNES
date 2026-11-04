IsLineForwardUsed:					; advances the candidate index and returns carry set if the forward is
									; already used
	inc.b tmp2
	ldx.b r0
	dex
	bmi LinePlayerNotUsed
.loop:								; loop: if A = ScratchBuf+$1C0,x go to LinePlayerUsed, X - 1, ...
	cmp.w ScratchBuf+$1C0,x
	beq LinePlayerUsed
	dex
	bpl .loop
	clc
	rts
