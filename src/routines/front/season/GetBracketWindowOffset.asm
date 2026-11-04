GetBracketWindowOffset:				; reads signed horizontal and vertical animation offsets and indexes the
									; selected cell
	lda.l BracketWindowPath,x
	tax
	ora.w #$FF00
	bit.w #$0080
	bne .1
	and.w #$00FF
.1:									; tmp0 = A, A = X, A or $FF00, if a $0080 bit set go to .2, ...
	sta.b tmp0
	txa
	xba
	ora.w #$FF00
	bit.w #$0080
	bne .2
	and.w #$00FF
.2:									; tmp1 = A, A = Y, A * 2, X = A, ...
	sta.b tmp1
	tya
	asl a
	tax
	rts
