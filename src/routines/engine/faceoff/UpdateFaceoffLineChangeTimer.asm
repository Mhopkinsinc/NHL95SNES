UpdateFaceoffLineChangeTimer:		; line change timer d0 (0 home, $20 away) of the puck: closes the box when
									; the player closed it, else counts down by d7 and takes row 0 (lcfound)
									; when it runs out
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w temp1,y
	bmi rtsfaceoff
	lda.w temp3,y
	asl a
	sta.b d1
	tay
	stz.b a0
	stz.b a2
	lda.w pfteam,y
	beq .1
	lda.w #$0002
	sta.b a2
.1:									; push Y, Y = a2, A = tmflags,y, pull Y, ...
	phy
	ldy.b a2
	lda.w tmflags,y
	ply
	bit.w #$0008
	bne .3
	phy
	ldy.b a2
	lda.w FaceoffLCClosed,y
	beq .2
	ply
	bra .3
.2:									; A + 1, FaceoffLCClosed,y = A, pull Y, A = a3, ...
	inc a
	sta.w FaceoffLCClosed,y
	ply
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w temp1,y
	ora.w #$FF00
	sta.w temp1,y
	ldx.b a3
	jmp.w SetLCmode2
.3:									; A = a3, A + d0, Y = A, A = temp1,y, ...
	lda.b a3
	clc
	adc.b d0
	tay
	lda.w temp1,y
	sec
	sbc.b d7
	sta.w temp1,y
	bmi .4
	jmp.w rtsfaceoff
.4:									; X = a3, push X, a3 = d1, push Y, ...
	ldx.b a3
	phx
	ldx.b d1
	stx.b a3
	phy
	ldy.w #$0000
	lda.w pfteam,x
	beq .5
	ldy.w #$0002
.5:									; A = tmflags,y, pull Y, if $0008 bits clear go to .6, d2 = 0, ...
	lda.w tmflags,y
	ply
	bit.w #$0008
	beq .6
	stz.b d2
	jsl.l lcfound
	bmi .6
	jsl.l SetLCmode2
.6:									; pull X, a3 = X, return
	plx
	stx.b a3
	rtl
