OffsidesNextPlayer:					; the next player of ChkOffsides: a0 + 2, d2 - 1, back to the loop while
									; d2 is not negative
	inc.b a0
	inc.b a0
	dec.b d2
	bpl ChkOffsides_loop
	rtl
