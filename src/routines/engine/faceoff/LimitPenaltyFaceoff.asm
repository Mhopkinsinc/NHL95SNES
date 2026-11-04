LimitPenaltyFaceoff:				; for called penalty A (not $34): when foy is past $5C toward the end the
									; penalized player defends (pfgoal), the spot moves to that end's dot (foy
									; +-$45, fox +-$50 by its side)
	and.w #$00FF
	cmp.w #$0034
	beq .rtl
	lda.b [a0]
	xba
	and.w #$007F
	asl a
	tay
	lda.w #$005C
	sta.b d1
	lda.w pfgoal,y
	bne .1
	lda.w #$FFA4
	sta.b d1
	cmp.w foy
	bmi .rtl
	lda.w #$FFBB
	sta.w foy
	bra .2
.1:									; if d1 - foy >= 0 go to .rtl, foy = $0045
	lda.b d1
	cmp.w foy
	bpl .rtl
	lda.w #$0045
	sta.w foy
.2:									; d0 = $0050, if fox >= 0 go to .3, d0 = $FFB0
	lda.w #$0050
	sta.b d0
	lda.w fox
	bpl .3
	lda.w #$FFB0
	sta.b d0
.3:									; fox = d0
	lda.b d0
	sta.w fox
.rtl:								; return
	rtl
