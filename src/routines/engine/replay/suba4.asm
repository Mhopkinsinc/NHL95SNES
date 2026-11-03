suba4:								; from ReplayMode, ProcessReplayPlayback and other segments
	lda.b a4
	cmp.w #$0000
	bne .1
	lda.b $75
	cmp.w #$007F
	bne .1
	lda.w sflags
	bit.w #$0010
	beq .6
	lda.w #$007F
	sta.b $75
	lda.w #$8EF8
	sta.b a4
.1:									; A = a4, A - $007A, a4 = A, A = $75, ...
	lda.b a4
	sec
	sbc.w #$007A
	sta.b a4
	lda.b $75
	sbc.w #$0000
	sta.b $75
	lda.b a4
	cmp.w recbpr
	beq .2
	jml.l RestoreReplayFrame
.2:									; if $75 = recbpr+2 go to .3, go to RestoreReplayFrame
	lda.b $75
	cmp.w recbpr+2
	beq .3
	jml.l RestoreReplayFrame
.3:									; A = a4, A + $007A, a4 = A, if carry clear go to .4, ...
	lda.b a4
	clc
	adc.w #$007A
	sta.b a4
	bcc .4
	inc.b $75
.4:									; if A is not $8EF8 go to .5, if $75 is not $007F go to .5, ...
	cmp.w #$8EF8
	bne .5
	lda.b $75
	cmp.w #$007F
	bne .5
	lda.w #$007F
	sta.b $75
	stz.b a4
.5:									; d7 = 0, return
	stz.b d7
	rtl
.6:									; call RestoreReplayFrame, d7 = 0, return
	jsl.l RestoreReplayFrame
	stz.b d7
	rtl
