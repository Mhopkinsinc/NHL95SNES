updatepwrplay:						; called from other segments
	lda.w OptPlayMode
	cmp.w #$0001
	beq .rtl
	stz.b a2
	lda.w #$0002
	sta.b a3
	lda.w tmap
	sec
	sbc.w tmap+2
	sta.b d0
	bne .1
	jmp.w updatepwrplay_clr
.1:									; if plus go to .2, A = sflags, if a $4000 bit set go to .3, ...
	bpl .2
	lda.w sflags
	bit.w #$4000
	bne .3
	jsl.l updatepwrplay_clr
	lda.w #$4000
	tsb.w sflags
	bra .3
.rtl:								; return
	rtl
.2:									; X = a2, a2 = a3, a3 = X, A = sflags, ...
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	lda.w sflags
	bit.w #$4000
	beq .3
	jsl.l updatepwrplay_clr
	lda.w #$4000
	trb.w sflags
.3:									; A = $2000, if not zero go to .4, call DrawPeriodBox, X = a3, ...
	lda.w #$2000
	tsb.w sflags
	bne .4
	jsl.l DrawPeriodBox
	ldx.b a3
	inc.w tmPwrPlays,x
.4:									; A = $0005, call AllocWorkBuf2, X = A, $0000,x = $0004, ...
	lda.w #$0005
	jsl.l AllocWorkBuf2
	tax
	lda.w #$0004
	sta.w $0000,x
	lda.w #$9C9B
	sta.w $0001,x
	lda.w #$9E9D
	sta.w $0003,x
	txa
	ldx.w #$007E
	ldy.w #$5B04
	jsl.l QueueVRAMDMALen
	jsl.l GetLowestPen
	lda.w gmclock
	bne .7
	lda.b d0
	cmp.w #$0005
	bcs .7
	cmp.w #$0001
	beq .5
	lda.w #$0001
	bra .6
.5:									; A = $0001
	lda.w #$0001
.6:									; call StartSound
	jsl.l StartSound
.7:									; call PushTime, A = a1, X = $007E, Y = $5AE5, ...
	jsl.l PushTime
	lda.b a1
	ldx.w #$007E
	ldy.w #$5AE5
	jsl.l QueueVRAMDMALen
	lda.w sflags
	ldx.w HomeTeam
	bit.w #$4000
	beq .8
	ldx.w VisTeam
.8:									; A = X, call PackTeamSecondTextLong, Y = $5AE1, go to QueueVRAMDMALen
	txa
	jsl.l PackTeamSecondTextLong
	ldy.w #$5AE1
	jml.l QueueVRAMDMALen
