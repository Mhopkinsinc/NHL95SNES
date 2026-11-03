updatecrowdf:						; decay the crowd hold and sound level
	lda.w CrowdSoundOn
	beq .rtl
	lda.b crowdhold
	beq .3
	cmp.w #$003D
	bcc .1
	lda.w #$003C
.1:									; A - d7, if the result >= 0 go to .2, A = $0000
	sec
	sbc.b d7
	bpl .2
	lda.w #$0000
.2:									; crowdhold = A
	sta.b crowdhold
.rtl:								; return
	rtl
.3:									; X = $0002, A = SampleSlots,x, A and $00FF, X = A, ...
	ldx.w #$0002
	lda.w SampleSlots,x
	and.w #$00FF
	tax
	lda.w Crowdlevel&$FFFF
	cmp.w #$0481
	bcc .4
	lda.w #$0480
.4:									; A - impactstep, if the result >= 0 go to .5, A = $0000
	sec
	sbc.w impactstep
	bpl .5
	lda.w #$0000
.5:									; Crowdlevel = A, A / 2, A / 2, A / 2, ...
	sta.w Crowdlevel&$FFFF
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b tmp0
	xba
	ora.b tmp0
	tay
	lda.w #$0015
	jml.l QueueSoundCmd
