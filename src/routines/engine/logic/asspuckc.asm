asspuckc:							; assignment (asstab entry 17): the puck carrier; others and pad players
									; leave through assexit
	cpx.w puckc
	bne .1
	lda.w playerpad,x
	bmi PuckCarrierThink
.1:									; go to assexit
	jmp.w assexit
	rtl								; unreached: no code branches, falls or points here
