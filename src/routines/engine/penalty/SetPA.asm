SetPA:								; start the referee animation and message for penalty d0
	lda.b d0
	sta.w RefPen
	stz.w RefStep
	jsl.l prefmes
	lda.b d0
	cmp.w #$000E
	bne .1
	jsl.l ShowGoalBox
.1:									; penmsgtimer = $7FFF, if sfhormode = 0 go to SetPA2, penmsgtimer = $003C
	lda.w #$7FFF
	sta.w penmsgtimer
	lda.w sfhormode
	beq SetPA2
	lda.w #$003C
	sta.w penmsgtimer
SetPA2:								; step the referee animation and draw its next frame
	phx
	lda.w RefStep
	bpl .2
	lda.w shootoutmode
	beq .1
	lda.w #$0001
	sta.w shootoutstop
.1:									; A = RefStep, pull X, return
	lda.w RefStep
	plx
	rtl
.2:									; tmp0 = A, A + 1, A + 1, RefStep = A, ...
	sta.b tmp0
	inc a
	inc a
	sta.w RefStep
	ldx.w RefPen
	beq .4
	lda.l Penaltylist,x
	tax
	lda.l Penaltylist+2,x
	and.w #$00FF
	sec
	adc.b tmp0
	stx.b tmp0
	sec
	adc.b tmp0
	tax
	lda.l Penaltylist+1,x
	bpl .3
	eor.w #$FFFF
	inc a
	ldx.w #$FFFF
	stx.w RefStep
.3:									; tmp0 = A, A and $00FF, A * 2, A * 2, ...
	sta.b tmp0
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.w RefCnt
	lda.b tmp0
	xba
	and.w #$00FF
	sta.b tmp0
	jsl.l PushRef
.4:									; pull X, return
	plx
	rtl
