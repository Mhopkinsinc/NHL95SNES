linebar:							; queues an energy bar for line A at the line change row
	jsr.w getlinee
	cmp.w #$0100
	bcs .1
	lda.w #$0100
.1:									; if A < $0FFF go to .2, A = $0FFF
	cmp.w #$0FFF
	bcc .2
	lda.w #$0FFF
.2:									; d1+2 = A, A * 2, A + d1+2, d1+2 = A, ...
	sta.b d1+2
	asl a
	adc.b d1+2
	sta.b d1+2
	xba
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	tax
	lda.w #$0003
	jsl.l AllocWorkBuf2
	pha
	tay
	lda.w #$A0A0
	sta.w $0000,y
	sta.w $0001,y
	jmp (LineBarFills,x)
