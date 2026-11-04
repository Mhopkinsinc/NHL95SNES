RandomWord:							; A = a random word: the sum of two 16-bit shift-register generators
	lda.w seed
	beq .3
	asl a
	bcc .1
	eor.w #$1D87
.1:									; the first generator
	sta.w seed
	lda.w seed+2
	beq .4
	asl a
	bcc .2
	eor.w #$1D87
.2:									; the second generator, then the sum
	sta.w seed+2
	clc
	adc.w seed
	rtl
.3:									; seed 0: start it
	lda.w #$A5A5
	bra .1
.4:									; seed+2 0: start it
	lda.w #$B4B4
	bra .2
.t1:								; rtl
	rtl
