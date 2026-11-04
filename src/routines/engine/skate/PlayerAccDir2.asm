PlayerAccDir2:						; playeracc toward direction 2 (right), one step (PlayerAccOneFrame)
	lda.l PlayerAccStepX,x
	sta.b d0
	ldx.b curobj
	lda.w Wallsin,x
	beq .1
	eor.b d0
	bpl .1
	lda.w Xvel,x
	bra .2
.1:									; A = Xvel,x, A + AccelStraight,x
	lda.w Xvel,x
	adc.w AccelStraight,x
.2:									; d0 = A, A and $00FF, A * 2, X = A, ...
	sta.b d0
	xba
	and.w #$00FF
	asl a
	tax
	lda.l SignedSquareTable,x
	tay
	ldx.b curobj
	lda.w Yvel+1,x
	and.w #$00FF
	asl a
	tax
	tya
	adc.l SignedSquareTable,x
	sta.b d3
	ldx.b curobj
	pei ($7F)
	jsl.l getpde
	lda.w OptLine
	cmp.w #$0002
	bne .3
	lda.w #$1000
	sta.b d0
.3:									; A = legspd,x, A * 2, X = A, A = d0, ...
	lda.w legspd,x
	asl a
	tax
	lda.b d0
	lsr a
	adc.w #$0800
	jsr (ScaleSkatingSpeeds,x)
	xba
	lsr a
	lsr a
	and.w #$003C
	tax
	lda.l MaxSpeed,x
	sta.b d2
	lda.l MaxSpeed+2,x
	sta.b d2+2
	ldx.b curobj
	lda.w position,x
	bne .4
	lda.w playerpad,x
	bmi .4
	lda.w goalieflags,x
	bit.w #$0004
	bne .4
	lda.b d2+2
	lsr a
	lsr a
	eor.w #$FFFF
	inc a
	adc.b d2+2
	sta.b d2+2
.4:									; pull A, if carry clear go to .5, Xvel,x = A
	lda.b d2+2
	cmp.b d3
	pla
	bcc .5
	sta.w Xvel,x
.5:									; if OptLine = 0 go to .rtl, A = seed, ...
	lda.w OptLine
	beq .rtl
	lda.w seed
	and.w #$003F
	bne .rtl
	jsl.l getpde
	lda.b d0
	sec
	sbc.w #$0021
	sta.b d0
	cmp.w #$0C00
	bmi .6
	lda.w endurance,x
	sta.b d2
	clc
	adc.b d0
	sta.b d0
.6:									; go to setpde
	jml.l setpde
.rtl:								; return
	rtl
