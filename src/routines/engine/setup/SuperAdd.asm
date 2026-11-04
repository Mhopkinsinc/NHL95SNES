SuperAdd:							; no caller found (not traced)
	phx
	lda.l $7E23F8
	clc
	adc.b d0
	sta.l $7E23F8
	bcc .1
	ldx.w #$0002
.loop:								; loop: A = $7E23F8,x, A + 1, $7E23F8,x = A, if not zero go to .1, ...
	lda.l $7E23F8,x
	inc a
	sta.l $7E23F8,x
	bne .1
	inx
	inx
	cpx.w #$0010
	bne .loop
.1:									; pull X, return
	plx
	clc
	rtl
