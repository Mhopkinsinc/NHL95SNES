FadeDelta:							; A = the signed colour difference A * 256 / $7D (the fade's step count)
	phx
	xba
	and.w #$FF00
	php
	bpl .1
	eor.w #$FFFF
	inc a
.1:									; X = $7D, call DivAByX, if plus go to .2, A xor $FFFF, ...
	ldx.b $7D
	jsl.l DivAByX
	plp
	bpl .2
	eor.w #$FFFF
	inc a
.2:									; pull X, return
	plx
	rts
