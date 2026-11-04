ScanPresidents:						; Presidents Trophy: the team with the most standings points ($0004 of its
									; record), the lower $0006 on a tie
	lda.w #$FFFF
	sta.b a3
	lda.w #$0000
	sta.b a2
.loop:								; loop: a2+2 = A, call BuildTeamSeasonRecordLong, ...
	sta.b a2+2
	jsl.l BuildTeamSeasonRecordLong
	lda.w $0004,x
	cmp.b a2
	bcc .2
	bne .1
	lda.w $0006,x
	cmp.b a3
	bcs .2
	sta.b a3
	lda.w $0004,x
.1:									; a2 = A, a3 = $0006,x, a3+2 = a2+2
	sta.b a2
	lda.w $0006,x
	sta.b a3
	lda.b a2+2
	sta.b a3+2
.2:									; A = a2+2, A + 1, if A is not $001A go to .loop, A = a3+2, ...
	lda.b a2+2
	inc a
	cmp.w #$001A
	bne .loop
	lda.b a3+2
	rts
