assfaceoff:							; assignment (asstab entry 22): players not in the face off wait until
									; sflags bit 8 clears, then clear $18AA and leave through assexit
	lda.w pfalock,x
	bne .rtl
	lda.w sflags
	bit.w #$0100
	beq .1
.rtl:								; return
	rtl
.1:									; LCBoxesClosed = 0, go to assexit
	stz.w LCBoxesClosed
	jmp.w assexit
