AddPenalty:							; from CheckGoalieInterference, Bcheck and other segments
	lda.w gmclock
	bne .rtl
	lda.w PenShotActive
	bne .rtl
	lda.b d0
	cmp.w #$000C
	beq AddPenalty2
	lda.w OptPen
	beq .rtl
	lda.w gmode
	bit.w #$0020
	bne AddPenalty2
	lda.b d0
	cmp.w #$0012
	bne AddPenalty2
.rtl:								; return
	rtl
