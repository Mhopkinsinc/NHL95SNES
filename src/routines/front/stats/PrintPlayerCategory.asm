PrintPlayerCategory:				; prints the League Leaders category name: Goals, Assists, Points, or for
									; goalies Saves, Shots and the percentage
	sta.b d1
	asl a
	tax
	lda.b d1+2
	lsr a
	lda.l LeaderCategoryNames,x
	bcc .1
	lda.l GoalieCategoryNames,x
.1:									; push A, A = $D3, A + $01AA, push A, ...
	pha
	lda.b $D3
	clc
	adc.w #$01AA
	pha
	ldy.w #$0016
	phy
	jsl.l ClearRAM7E
	ply
	pla
	clc
	adc.w #$0040
	jsl.l ClearRAM7E
	plx
	ldy.w #$0007
	lda.w #$00F6
	sta.b $D1
	jsl.l PrintBoldRight
	rts
