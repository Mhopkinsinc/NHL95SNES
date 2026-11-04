BinToBCD:							; A (binary, below 10000) as BCD
	pei ($9F)
	stz.b tmp0
.loop:								; loop: if A < $0064 go to .1, A - $0064, X = A, A = tmp0, ...
	cmp.w #$0064
	bcc .1
	sbc.w #$0064
	tax
	sed
	lda.b tmp0
	adc.w #$0099
	sta.b tmp0
	cld
	txa
	bra .loop
.1:									; X = A, A = BCDTable,x, A and $00FF, A or tmp0, ...
	tax
	lda.l BCDTable,x
	and.w #$00FF
	ora.b tmp0
	plx
	stx.b tmp0
	rts
