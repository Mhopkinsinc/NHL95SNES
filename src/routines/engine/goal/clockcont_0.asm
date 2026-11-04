clockcont_0:						; called from other segments
	ldx.w #$001C
	stx.b a3
	lda.w #$0018
	sta.b d0
	jsl.l assinsert
	lda.w #$0007
	jsl.l StartSound
	stz.b p0
	lda.w gsp
	cmp.w #$0002
	bcs .1
	jmp.w .5
.1:									; d0 = $0008, a3 = $0000, d2 = $0005, if tmscore = tmscore+2 go to .5, ...
	lda.w #$0008
	sta.b d0
	ldx.w #$0000
	stx.b a3
	lda.w #$0005
	sta.b d2
	lda.w tmscore
	cmp.w tmscore+2
	beq .5
	bpl .loop
	ldx.w #$000C
	stx.b a3
.loop:								; loop: if position,x = 0 go to .2, if minus go to .2, ...
	lda.w position,x
	beq .2
	bmi .2
	jsl.l assinsert
	lda.w #$0008
	sta.b d0
.2:									; X + 1, X + 1, a3 = X, d2 - 1, ...
	inx
	inx
	stx.b a3
	dec.b d2
	bpl .loop
.3:									; call ClearPenaltyBuffer, A = Crowdlevel, A + $03E8, Crowdlevel = A, ...
	jsl.l ClearPenaltyBuffer
	lda.l Crowdlevel
	clc
	adc.w #$03E8
	sta.l Crowdlevel
	lda.w #$003C
	sta.b crowdhold
	lda.w #$0040
	sta.w gmclock
	tsb.w gmode
	lda.w tmscore
	cmp.w tmscore+2
	bmi .4
	lda.w #$0000
	sta.l Crowdlevel
	lda.w #$0003
	sta.w cheercnt
	lda.b Vcount
	sec
	sbc.w #$0096
	sta.w cheervc
.4:									; call ShowScoringLeaders, d0 = $0004, call AddPenalty2, ...
	jsl.l ShowScoringLeaders
	lda.w #$0004
	sta.b d0
	jsl.l AddPenalty2
	lda.b p0
	beq .rtl
	lda.w #$0032
	sta.b d0
	jsl.l AddPenalty2
.rtl:								; return
	rtl
.5:									; if gsp is not $0003 go to .6, if OptPlayMode = 0 go to .3
	lda.w gsp
	cmp.w #$0003
	bne .6
	lda.w OptPlayMode
	beq .3
.6:									; call EndPenaltyShot, d0 = $0002, go to ShootoutWonBy
	jsl.l EndPenaltyShot
	lda.w #$0002
	sta.b d0
	jml.l ShootoutWonBy
