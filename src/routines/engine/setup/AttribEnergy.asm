AttribEnergy:						; prints the energy of roster player d0 of team a2 as a percentage: the
									; energy / 40, at most 100 ($1000 when line changes are automatic)
	lda.b d0
	asl a
	ldx.b a2
	beq .1
	adc.w #$0034
.1:									; Y = A, A = tmpde,y, if OptLine is not $0002 go to .2, A = $1000
	tay
	lda.w tmpde,y
	ldx.w OptLine
	cpx.w #$0002
	bne .2
	lda.w #$1000
.2:									; r2 = A, r1 = $0028, call Div16x8U, if r0 < $0065 go to .3, ...
	sta.b r2
	lda.w #$0028
	sta.b r1
	jsl.l Div16x8U
	lda.b r0
	cmp.w #$0065
	bcc .3
	lda.w #$0064
.3:									; call BinToBCD, call BCDText, Y = a2+2, X = mesarea, ...
	jsr.w BinToBCD
	jsr.w BCDText
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldCentredStr
	rts
