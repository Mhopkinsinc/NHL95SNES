SeatPenaltyBox:						; from chkprogress and other segments
	lda.w OptPlayMode
	cmp.w #$0001
	beq .rtl
	lda.w penshot
	ora.w PenShotActive
	ora.w shootoutmode
	bne .rtl
	phx
	stz.w PBnum
	ldx.w #$0000
.loop:								; loop: if position,x >= 0 go to .1, call PenBoxSpot, Ypos,x = r2, ...
	lda.w position,x
	bpl .1
	jsl.l PenBoxSpot
	lda.b r2
	sta.w Ypos,x
	lda.w #$009B
	sta.w Xpos,x
	jsl.l assdopen
.1:									; X + 1, X + 1, if X < $0018 go to .loop, pull X
	inx
	inx
	cpx.w #$0018
	bcc .loop
	plx
.rtl:								; return
	rtl
