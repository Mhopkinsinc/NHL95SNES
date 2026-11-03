PenBoxSpot:							; from SeatPenaltyBox, asspenalty and other segments
	lda.w #$000B
	sta.b d0
	lda.w PBnum
	sta.b d1
	lda.w pfteam,x
	bne .1
	lda.b d1
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d1
	lda.w #$FFF5
	sta.b d0
.1:									; A = d1, A and $000F, d1 = A, if A < $0003 go to .2, ...
	lda.b d1
	and.w #$000F
	sta.b d1
	cmp.w #$0003
	bcc .2
	lda.w #$0002
	sta.b d1
.2:									; d1 + 1, d1 + 1, d1 + 1, push X, ...
	inc.b d1
	inc.b d1
	inc.b d1
	phx
	lda.b d0
	ldx.b d1
	jsl.l Mul16S
	plx
	rtl
