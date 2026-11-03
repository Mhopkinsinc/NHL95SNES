NoLineDefenceman:					; PickUnusedLineDefenceman's end of list: the used count ($2E) back to 0,
									; X restored, carry set
	stz.b r0+2
	ldx.b $14
	sec
	rts
