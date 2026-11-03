SortGoalieStats:					; starts PlayerStatsScreen' order list at ScratchBuf: team a2's goalies
									; ordered by goals against (tmgoals)
	ldx.w #HomeRoster
	ldy.w #$0000
	lda.b a2
	beq .1
	ldx.w #VisRoster
	ldy.w #$001A
.1:									; tmp3 = Y, ScratchBuf = 0, $0C = 0, tmp1 = 0, ...
	sty.b tmp3
	stz.w ScratchBuf
	stz.b $0C
	stz.b tmp1
	lda.w $0002,x
	dec a
	sta.b tmp0
	lda.w #$0002
	sta.b tmp2
.loop:								; loop: tmp1 + 1, A = tmp1, A + tmp3, X = A, ...
	inc.b tmp1
	lda.b tmp1
	clc
	adc.b tmp3
	tax
	lda.w tmgoals,x
	and.w #$00FF
	sta.b $0A
	ldy.b $0C
	stz.b $0E
.loop2:								; loop: A = Y, A + tmp3, X = A, A = tmgoals,x, ...
	tya
	clc
	adc.b tmp3
	tax
	lda.w tmgoals,x
	and.w #$00FF
	cmp.b $0A
	bcc .3
	iny
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
