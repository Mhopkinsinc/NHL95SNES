NoLineForward:						; PickUnusedLineForward's end of list: the used count (r0) back to 0, X
									; restored, carry set
	stz.b r0
	ldx.b $14
	sec
	rts
