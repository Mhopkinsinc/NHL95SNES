puckbody:							; called from other segments
	lda.w puckz
	cmp.w #$0008
	bpl .1
	lda.b d0
	and.w #$000F
	beq .1
	jmp.w puckstick
.1:									; call a2touchpuck, A = puckvx, Y = puckvy, call ApproxLength, ...
	jsl.l a2touchpuck
	lda.w puckvx
	ldy.w puckvy
	jsl.l ApproxLength
	and.w #$7F00
	sta.b tmp0
	xba
	tsb.b tmp0
	ldy.w puckz
	cmp.w #$000E
	bmi .2
	lda.w #$000D
	bra .3
.2:									; A = $0011
	lda.w #$0011
.3:									; call StartSoundVolume, puckvz = 0, Y = a2, nopuck,y = $0008, ...
	jsl.l StartSoundVolume
	stz.w puckvz
	ldy.b a2
	lda.w #$0008
	sta.w nopuck,y
	lda.w Xpos,x
	sec
	sbc.w Xpos,y
	sta.b d0
	lda.w Ypos,x
	sec
	sbc.w Ypos,y
	sta.b d1
	bne .4
	tya
	jsl.l GetFrameHot
.4:									; d2 = Xvel,x, d3 = Yvel,x, A 8-bit, Xvel+1,x = d0, ...
	lda.w Xvel,x
	sta.b d2
	lda.w Yvel,x
	sta.b d3
	sep #$20
	lda.b d0
	sta.w Xvel+1,x
	lda.b d1
	sta.w Yvel+1,x
	rep #$30
	jsl.l puckflip
	lda.w puckz
	cmp.w #$0008
	bmi .rtl
	lda.b d2
	tax
	jsl.l Mul16S
	lda.b r2+2
	sta.b d2+2
	lda.b r2
	sta.b d2
	lda.b d3
	tax
	jsl.l Mul16S
	ldx.b a3
	lda.b r2
	clc
	adc.b d2
	sta.b d2
	lda.b r2+2
	adc.b d2+2
	sta.b d2+2
	cmp.w #$0900
	bcc .5
	lda.w puckz
	cmp.w #$000C
	bmi .rtl
	jmp.w FallDown
.rtl:								; return
	rtl
.5:									; Y = a2, if pfalock,y is not 0 go to .rtl, A + 1, pf2aip,y = A, ...
	ldy.b a2
	lda.w pfalock,y
	bne .rtl
	inc a
	sta.w pf2aip,y
	lda.w #SPAcatch&$FFFF
	ldx.b a2
	jsl.l SetSPAFromA
	ldx.b a3
	rtl
