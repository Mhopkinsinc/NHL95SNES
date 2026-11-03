getlchoice:							; A = the line for line choice A of team a2 by the man advantage
									; (LineChoiceTable, sign extended; -1 none); X and Y kept
	phx
	pha
	lda.b a2
	tax
	eor.w #$0002
	tay
	lda.w tmap,y
	sec
	sbc.w tmap,x
	beq .2
	bmi .1
	lda.w #$002A
	bra .2
.1:									; A = $0015
	lda.w #$0015
.2:									; A + $01,s, $01,s = A, Y = a2, A = tmline,y, ...
	clc
	adc.b $01,s
	sta.b $01,s
	ldy.b a2
	lda.w tmline,y
	asl a
	adc.w tmline,y
	adc.b $01,s
	tax
	ply
	lda.l LineChoiceTable,x
	plx
	and.w #$00FF
	bit.w #$0080
	beq .rts
	ora.w #$FF00
.rts:								; return
	rts
