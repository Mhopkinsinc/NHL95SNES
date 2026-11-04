RosterSlotRowDone:					; a slot row drawn: the next slot while a3 is below 5
	inc.b a2+2
	lda.b a3
	inc a
	sta.b a3
	cmp.w #$0005
	bcs .rts
	ldx.b $79
	cpx.w #$0006
	bcc .1
	cmp.w #$0004
	bcc .1
.rts:								; return
	rts
.1:									; go to RosterSlotRowNext
	jmp.w RosterSlotRowNext
