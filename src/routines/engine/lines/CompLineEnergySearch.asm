CompLineEnergySearch:				; scans the score-dependent line order for sufficient energy and stores
									; the chosen line
	lda.w #$0002
	sta.b d1
	lda.w #EnergySearchLines>>16
	sta.b a0+2
	lda.w #EnergySearchLines&$FFFF
	sta.b a0
	lda.w gsp
	cmp.w #$0002
	bne .loop
	ldy.b a2
	lda.w tmscore,y
	ldy.b a1
	cmp.w tmscore,y
	beq .loop
	php
	lda.w #EnergySearchLines>>16
	sta.b a0+2
	lda.w #(EnergySearchLines+6)&$FFFF
	sta.b a0
	plp
	bpl .loop
	lda.w #EnergySearchLines>>16
	sta.b a0+2
	lda.w #(EnergySearchLines+12)&$FFFF
	sta.b a0
.loop:								; loop: A = [a0], a0 + 1, a0 + 1, call getlinee, ...
	lda.b [a0]
	inc.b a0
	inc.b a0
	jsr.w getlinee
	cmp.w #$0F34
	bcs .1
	dec.b d1
	bpl .loop
.1:									; a0 - 1, a0 - 1, Y = a2, tmline,y = [a0], ...
	dec.b a0
	dec.b a0
	ldy.b a2
	lda.b [a0]
	sta.w tmline,y
	jmp.w CompLineReturn
