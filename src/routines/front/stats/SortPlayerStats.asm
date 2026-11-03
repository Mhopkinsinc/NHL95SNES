SortPlayerStats:					; sorts team a2's skaters by stat column $7D (PlayerStatColumn), best
									; first, into the order list at ScratchBuf after the goalies
	ldx.w #HomeRoster
	ldy.w #$0000
	lda.b a2
	beq .1
	ldx.w #VisRoster
	ldy.w #$001A
.1:									; tmp3 = Y, ScratchBuf = $0002,x, $0C = A, tmp1 = A, ...
	sty.b tmp3
	lda.w $0002,x
	sta.w ScratchBuf
	sta.b $0C
	sta.b tmp1
	lda.b a1
	dec a
	sta.b tmp0
	lda.w #$0002
	sta.b tmp2
.loop:								; loop: tmp1 + 1, Y = tmp1, call PlayerStatColumn, $0A = A, ...
	inc.b tmp1
	ldy.b tmp1
	jsr.w PlayerStatColumn
	sta.b $0A
	stz.b $0E
.loop2:								; loop: Y = $0E, A = ScratchBuf,y, Y = A, call PlayerStatColumn, ...
	ldy.b $0E
	lda.w ScratchBuf,y
	tay
	jsr.w PlayerStatColumn
	cmp.b $0A
	bcc .3
	lda.b $0E
	inc a
	inc a
	sta.b $0E
	cmp.b tmp2
	bne .loop2
	tax
.2:									; ScratchBuf,x = tmp1, tmp2 + 1, tmp2 + 1, tmp0 - 1, ...
	lda.b tmp1
	sta.w ScratchBuf,x
	inc.b tmp2
	inc.b tmp2
	dec.b tmp0
	bne .loop
	rts
.3:									; X = tmp2
	ldx.b tmp2
.loop3:								; loop: X - 1, X - 1, ScratchBuf+$2,x = ScratchBuf,x, ...
	dex
	dex
	lda.w ScratchBuf,x
	sta.w ScratchBuf+$2,x
	cpx.b $0E
	bne .loop3
	bra .2
