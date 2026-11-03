TryAddPlayerToList:					; from SetPlList and other segments
	lda.b d0
	sta.b d1
	dec.b d0
	asl.b d0
	lda.b a2
	beq .1
	lda.w #$0034
.1:									; A + d0, Y = A, A = tmpdst,y, A - $0000, ...
	adc.b d0
	tay
	lda.w tmpdst,y
	sec
	sbc.w #$0000
	beq .2
	bpl .3
.2:									; if tmpdst,y = $FFFD go to .3, if tmpdst,y = $FFFC go to .3, d0 = $0005
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq .3
	cmp.w #$FFFC
	beq .3
	lda.w #$0005
	sta.b d0
.loop:								; loop: Y = d0, A = [a4],y, A and $00FF, tmp0 = A, ...
	ldy.b d0
	lda.b [a4],y
	and.w #$00FF
	sta.b tmp0
	lda.b d1
	and.w #$00FF
	cmp.b tmp0
	beq .3
	dec.b d0
	bpl .loop
	ldy.b d4
	sep #$20
	lda.b d1
	sta.b [a4],y
	rep #$20
	lda.b d1
	and.w #$00FF
	rtl
.3:									; d1 = $0000, return
	lda.w #$0000
	sta.b d1
	rtl
