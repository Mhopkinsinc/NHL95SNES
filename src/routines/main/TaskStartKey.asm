TaskStartKey:						; a task: start clears task flag bit 15 (so TaskEndCheck ends the list)
									; and sets bit 0
	jsl.l ReadMenuPads
	lda.w repeatdelayframes
	bne .rtl
	lda.w padchangeany
	bit.w #$1000
	beq .rtl
	lda.w #$8000
	trb.b d1+2
	lda.w #$0001
	tsb.b d1+2
.rtl:								; return
	rtl
