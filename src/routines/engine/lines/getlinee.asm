getlinee:							; returns the average skater energy of line A for team a2
	pei ($8F)
	phx
	inc a
	asl a
	asl a
	asl a
	adc.w #HomeRoster
	ldy.b a2
	beq .1
	adc.w #$043E
.1:									; X = A, r2 = 0, Y = a2, A = tmap,y, ...
	tax
	stz.b r2
	ldy.b a2
	lda.w tmap,y
	dec a
	sta.b r1
.loop:								; loop: d4 = A, A = X, A + d4, Y = A, ...
	sta.b d4
	txa
	clc
	adc.b d4
	tay
	lda.w $006C,y
	and.w #$00FF
	asl a
	ldy.b a2
	beq .2
	adc.w #$0034
.2:									; Y = A, A = tmpde-2,y, A + r2, r2 = A, ...
	tay
	lda.w tmpde-2,y
	clc
	adc.b r2
	sta.b r2
	lda.b d4
	dec a
	bne .loop
	jsl.l Div16x8U
	lda.b r0
	plx
	ply
	sty.b d4
	rts
