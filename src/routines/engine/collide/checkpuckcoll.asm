checkpuckcoll:						; called from other segments
	lda.w puckz
	sec
	sbc.w #$0010
	bpl .rtl
	ldy.w OOlistpos+28
.loop:								; loop: d1 = Y, if Y = $000F go to .1, A = OOlist+1,y, A and $00FF, ...
	sty.b d1
	cpy.w #$000F
	beq .1
	lda.w OOlist+1,y
	and.w #$00FF
	tay
	lda.w Ylist,y
	sec
	sbc.w pucky
	sec
	sbc.w #$0028
	bpl .1
	jsl.l checkpuckcoll_ccx
	ldy.b d1
	iny
	bra .loop
.1:									; if OOlistpos+28 = 0 go to .rtl
	ldy.w OOlistpos+28
	beq .rtl
.loop2:								; loop: d1 = Y, A = OOlist-1,y, A and $00FF, Y = A, ...
	sty.b d1
	lda.w OOlist-1,y
	and.w #$00FF
	tay
	lda.w pucky
	sec
	sbc.w Ylist,y
	sec
	sbc.w #$0028
	bpl .rtl
	jsl.l checkpuckcoll_ccx
	ldy.b d1
	dey
	bne .loop2
.rtl:								; return
	rtl
