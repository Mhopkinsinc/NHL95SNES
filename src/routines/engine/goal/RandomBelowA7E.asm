RandomBelowA7E:						; RandomBelowA with the data bank $7E around it (its callers run with $7F)
	pea.w $7F7E
	plb
	jsl.l RandomBelowA
	plb
	rts
