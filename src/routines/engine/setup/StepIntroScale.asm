StepIntroScale:						; reduces the intro scale by a clamped quarter of its current value
	lda.w introM7Scale
	lsr a
	lsr a
	cmp.w #$0280
	bcc .1
	lda.w #$0280
.1:									; if A >= $0020 go to .2, A = $0020
	cmp.w #$0020
	bcs .2
	lda.w #$0020
.2:									; A - introM7Scale, A xor $FFFF, A + 1, introM7Scale = A, ...
	sec
	sbc.w introM7Scale
	eor.w #$FFFF
	inc a
	sta.w introM7Scale
	rts
