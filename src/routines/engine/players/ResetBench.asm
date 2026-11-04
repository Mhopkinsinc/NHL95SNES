ResetBench:							; called from other segments
	stz.w PBnum
	lda.w #$0010
	sta.b d1
	stz.b a0
	jsl.l ResetTeamBench
	lda.w #$0001
	sta.b d1
	lda.w #$0002
	sta.b a0
ResetTeamBench:						; team a0's players: each still in the box counted into PBnum by d1, the
									; others back on the bench (tmpdst) unless out
	lda.w #$0032
	sta.b d0
.1:									; A = PBnum, A + d1, PBnum = A, if a0 = 0 go to .2, ...
	lda.w PBnum
	clc
	adc.b d1
	sta.w PBnum
	lda.b a0
	beq .2
	lda.w #$0034
.2:									; A + d0, Y = A, if tmpdst,y < 0 go to .3, if zero go to .3, ...
	adc.b d0
	tay
	lda.w tmpdst,y
	bmi .3
	beq .3
	bit.w #$1000
	beq .4
	and.w #$07FF
	sta.b d2
	bne .4
	lda.w PBnum
	sec
	sbc.b d1
	sta.w PBnum
	bra .4
.3:									; A = PBnum, A - d1, PBnum = A, if tmpdst,y = $FFFD go to .4, ...
	lda.w PBnum
	sec
	sbc.b d1
	sta.w PBnum
	lda.w tmpdst,y
	cmp.w #$FFFD
	beq .4
	cmp.w #$FFFC
	beq .4
	lda.w #$FFFE
	sta.w tmpdst,y
.4:									; d0 - 1, d0 - 1, if the result >= 0 go to .1, return
	dec.b d0
	dec.b d0
	bpl .1
	rtl
