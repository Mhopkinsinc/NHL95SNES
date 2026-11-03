asspassrec:							; called from other segments
	lda.w pflags,x
	bit.w #$0002
	beq .1
	and.w #$FFFD
	ora.w #$0001
	sta.w pflags,x
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
.1:									; passwait,x - 1, if the result < 0 go to EndPassReceiverAssignment, ...
	dec.w passwait,x
	bmi EndPassReceiverAssignment
	lda.w puckc
	bpl EndPassReceiverAssignment
	lda.w onetimerreq
	bne PassReceiverOneTimer
	ldy.w playerpad,x
	bmi PassReceiverTryOneTimer
	lda.w padnew1,y
	bit.w #$8000
	bne EndPassReceiverAssignment
	bit.w #$0080
	beq PassReceiverTryOneTimer
	inc.w onetimerreq
	lda.w #$7FFF
	sta.w OneTimerDist
	bra PassReceiverOneTimer
	rtl								; unreached: no code branches, falls or points here
