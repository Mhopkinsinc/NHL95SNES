Stop4Pen:							; from checkfornewpen and other segments
	lda.w #$FFFF
	tsb.w gmclock
	beq .1
	jmp.w .7
.1:									; d0 = 0, d1 = 0, a0 - 1, a0 - 1, ...
	stz.b d0
	stz.b d1
	dec.b a0
	dec.b a0
	lda.b (a0)
	inc.b a0
	inc.b a0
	and.w #$00FF
	cmp.w #$000E
	beq .2
	pha
	lda.w ltx
	sta.b d0
	lda.w lty
	sta.b d1
	pla
	cmp.w #$0006
	beq .2
	ldy.w puckx
	sty.b d0
	ldy.w pucky
	sty.b d1
	cmp.w #$000C
	bne .2
	dec.b a0
	lda.b (a0)
	inc.b a0
	and.w #$00FF
	asl a
	tay
	lda.w #$0258
	sta.b d1
	lda.w pfgoal,y
	beq .2
	lda.w #$FDA8
	sta.b d1
.2:									; tmp0 = d0, A - $0050, if the result < 0 go to .3, d0 = $0050
	lda.b d0
	sta.b tmp0
	sec
	sbc.w #$0050
	bmi .3
	lda.w #$0050
	sta.b d0
.3:									; A = d0, A - $FFB0, if the result >= 0 go to .4, d0 = $FFB0
	lda.b d0
	sec
	sbc.w #$FFB0
	bpl .4
	lda.w #$FFB0
	sta.b d0
.4:									; A = d1, A - $00AC, if the result < 0 go to .5, d1 = $00D4, ...
	lda.b d1
	sec
	sbc.w #$00AC
	bmi .5
	lda.w #$00D4
	sta.b d1
	lda.w #$0050
	sta.b d0
	lda.b tmp0
	bpl .5
	lda.w #$FFB0
	sta.b d0
.5:									; A = d1, A - $FF54, if the result >= 0 go to .6, d1 = $FF2C, ...
	lda.b d1
	sec
	sbc.w #$FF54
	bpl .6
	lda.w #$FF2C
	sta.b d1
	lda.w #$0050
	sta.b d0
	lda.b tmp0
	bpl .6
	lda.w #$FFB0
	sta.b d0
.6:									; fox = d0, foy = d1, call limitfo
	lda.b d0
	sta.w fox
	lda.b d1
	sta.w foy
	jsl.l limitfo
.7:									; A = Vcount, A - sfxmutetime, if A < $003C go to .8
	lda.b Vcount
	sec
	sbc.w sfxmutetime
	cmp.w #$003C
	bcc .8
.8:									; if replaydelay is not 0 go to .9, replaydelay = $001E
	lda.w replaydelay
	bne .9
	lda.w #$001E
	sta.w replaydelay
.9:									; A = $0012, call StartSound, PenCntDwn = 0, A = $0004, ...
	lda.w #$0012
	jsl.l StartSound
	stz.w PenCntDwn
	lda.w #$0004
	tsb.w gmode
	lda.w #$000A
	sta.b d0
	jml.l SetPA
