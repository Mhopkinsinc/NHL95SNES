SeedRandom:							; seeds RandomBelowA's generator (RandomState) from the latched H / V
									; counters, until it is not zero
	lda.l SLHV
	sep #$20
	lda.l OPHCT
	sta.w RandomState
	lda.l OPHCT
	sta.w RandomState+1
	lda.l OPVCT
	sta.w RandomState+2
	lda.l OPVCT
	sta.w RandomState+3
	rep #$20
	lda.w RandomState
	ora.w RandomState+2
	beq SeedRandom
	rtl
