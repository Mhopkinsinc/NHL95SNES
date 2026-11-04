FixLineDefence:						; A = line slot player A if he is a defenceman (roster index $0C up to
									; tmp3, after the forwards), else the first defenceman from $0C not in the
									; line (PlayerInLine)
	cmp.b $0C
	bcc .1
	cmp.b tmp3
	bcc .rts
.1:									; A = $0C
	lda.b $0C
.loop:								; loop: call PlayerInLine, if carry clear go to .rts, A + 1, go to .loop
	jsr.w PlayerInLine
	bcc .rts
	inc a
	bra .loop
.rts:								; return
	rts
