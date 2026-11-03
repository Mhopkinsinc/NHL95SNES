CompLineEvenStrength:				; chooses an even strength line by team, control mode, period, score and
									; energy
	ldy.b a2
	beq .1
	jmp.w CompLineEnergySearch
.1:									; if OptLine is not $0002 go to .2, if c1playernum,y < 0 go to .2, ...
	lda.w OptLine
	cmp.w #$0002
	bne .2
	lda.w c1playernum,y
	bmi .2
	jmp.w CompLineEnergySearch
.2:									; d1 = $0002, a0 = EvenStrengthLines, if gsp is not $0002 go to .3, ...
	lda.w #$0002
	sta.b d1
	lda.w #EvenStrengthLines>>16
	sta.b a0+2
	lda.w #EvenStrengthLines&$FFFF
	sta.b a0
	lda.w gsp
	cmp.w #$0002
	bne .3
	lda.w tmscore,y
	ldy.b a1
	cmp.w tmscore,y
	beq .3
	php
	lda.w #EvenStrengthLines>>16
	sta.b a0+2
	lda.w #(EvenStrengthLines+14)&$FFFF
	sta.b a0
	plp
	bpl .3
	lda.w #EvenStrengthLines>>16
	sta.b a0+2
	lda.w #(EvenStrengthLines+28)&$FFFF
	sta.b a0
.3:									; Y = a1, A = tmline,y, A * 2, d1 = A, ...
	ldy.b a1
	lda.w tmline,y
	asl a
	sta.b d1
	tay
	lda.b [a0],y
	jsr.w getlinee
	cmp.w #$0C01
	bcc CompLineEnergySearch
	ldy.b d1
	lda.b [a0],y
	ldy.b a2
	sta.w tmline,y
	jmp.w CompLineReturn
