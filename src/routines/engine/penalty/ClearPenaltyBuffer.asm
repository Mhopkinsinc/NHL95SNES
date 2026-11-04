ClearPenaltyBuffer:					; clears the 32 words of PenBuf
	phx
	ldx.w #$003E
.loop:								; loop: PenBuf,x = 0, X - 1, X - 1, if the result >= 0 go to .loop, ...
	stz.w PenBuf,x
	dex
	dex
	bpl .loop
	plx
	rtl
