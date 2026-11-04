FixLineForward:						; A = line slot player A if he is a forward (roster index $0A up to $0C,
									; after the goalies), else the first forward from $0A not in the line
									; (PlayerInLine)
	cmp.b $0A
	bcc .1
	cmp.b $0C
	bcc .rts
.1:									; A = $0A
	lda.b $0A
.loop:								; loop: call PlayerInLine, if carry clear go to .rts, A + 1, go to .loop
	jsr.w PlayerInLine
	bcc .rts
	inc a
	bra .loop
.rts:								; return
	rts
