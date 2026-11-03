PassReceiverTryOneTimer:			; let a computer pass receiver request a one-timer in the attacking zone
	ldy.b a2
	lda.w teampads,y
	bne .3
	lda.w pfgoal,x
	bne .2
	lda.w Ypos,x
	cmp.w #$FFA4
	bpl .3
.1:									; call RandomWord, if the result is not 0 go to .3, onetimerreq + 1, ...
	jsl.l RandomWord
	and.w #$0080
	bne .3
	inc.w onetimerreq
	lda.w #$7FFF
	sta.w OneTimerDist
	jmp.w PassReceiverOneTimer
.2:									; if Ypos,x - $005C >= 0 go to .1
	lda.w Ypos,x
	cmp.w #$005C
	bpl .1
.3:									; if puckc < 0 go to PassReceiverReturn
	lda.w puckc
	bmi PassReceiverReturn
EndPassReceiverAssignment:			; clear pass receiver state and end the assignment
	lda.w #$FFFF
	sta.w passReceiverPlayerNum
	stz.w pfalock,x
	stz.w onetimerreq
	lda.w pflags,x
	and.w #$FFFE
	sta.w pflags,x
	jmp.w assexit
