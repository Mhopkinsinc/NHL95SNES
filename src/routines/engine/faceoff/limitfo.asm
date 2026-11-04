limitfo:							; keeps the face off spot away from the blue line for every called
									; penalty: LimitPenaltyFaceoff for each PenBuf entry
	pei ($7F)
	pei ($81)
	pei ($83)
	pei ($85)
	pei ($63)
	pei ($65)
	pei ($67)
	pei ($69)
	stz.b a0+2
	lda.w #PenBuf
	sta.b a0
.loop:								; loop: A = [a0], call LimitPenaltyFaceoff, a0 + 1, a0 + 1, ...
	lda.b [a0]
	jsl.l LimitPenaltyFaceoff
	inc.b a0
	inc.b a0
	lda.b [a0]
	bne .loop
	pla
	sta.b a1+2
	pla
	sta.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	rtl
