AdvanceStringPtr:					; no caller found (not traced)
	bra .1
.loop:								; loop: A = a1, A + [a1], a1 = A
	lda.b a1
	clc
	adc.b [a1]
	sta.b a1
.1:									; d0 - 1, if the result >= 0 go to .loop, return
	dec.b d0
	bpl .loop
	rtl
