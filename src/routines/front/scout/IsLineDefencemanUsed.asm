IsLineDefencemanUsed:				; advances the candidate index and returns carry set if the defenceman is
									; already used
	inc.b tmp2
	ldx.b r0+2
	dex
	bmi LinePlayerNotUsed
.loop:								; loop: if A = ScratchBuf+$200,x go to LinePlayerUsed, X - 1, ...
	cmp.w ScratchBuf+$200,x
	beq LinePlayerUsed
	dex
	bpl .loop
LinePlayerNotUsed:					; carry clear: the player is not in the used list (IsLineDefencemanUsed /
									; IsLineForwardUsed)
	clc
	rts
