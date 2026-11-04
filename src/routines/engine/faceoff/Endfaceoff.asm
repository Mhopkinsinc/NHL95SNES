Endfaceoff:							; drops the puck: the face off sound, sflags $0100 / $0400 cleared, fobox,
									; replaydelay and gmclock cleared, then the winner from the centres' pull
									; directions (fodir1, fodir2) and frames
	lda.w #$000D
	jsl.l StartSound
	lda.w #$0100
	trb.w sflags
	stz.w fobox
	lda.w #$0400
	trb.w sflags
	stz.w replaydelay
	stz.w gmclock
	lda.w #$0010
	tsb.w sflags3
	lda.w fodir1
	sta.b d3
	lda.w #$0800
	sta.b d4
	stz.b a1
	lda.w #$0010
	sta.b d2
	ldx.w fofdata2
	lda.l FaceoffFrameWeights-1,x
	and.w #$00FF
	bit.w #$0080
	beq .1
	ora.w #$FF00
.1:									; A xor $FFFF, A + 1, A + d2, d2 = A, ...
	eor.w #$FFFF
	inc a
	clc
	adc.b d2
	sta.b d2
	ldx.w fofdata2+4
	lda.l FaceoffFrameWeights-1,x
	and.w #$00FF
	bit.w #$0080
	beq .2
	ora.w #$FF00
.2:									; A + d2, d2 = A, call RandomWord, A and $001F, ...
	clc
	adc.b d2
	sta.b d2
	jsl.l RandomWord
	and.w #$001F
	inc a
	cmp.b d2
	bcs .3
	lda.w #$0004
	sta.b a1
.3:									; X = a1, A = fofdata2+2,x, if $0800 bits clear go to .4, d3 = fodir2, ...
	ldx.b a1
	lda.w fofdata2+2,x
	bit.w #$0800
	beq .4
	lda.w fodir2
	sta.b d3
	lda.w #$F800
	sta.b d4
.4:									; A = d3, if a $0008 bit set go to .5, A and $0007, d0 = A, ...
	lda.b d3
	bit.w #$0008
	bne .5
	and.w #$0007
	sta.b d0
	lda.w seed
	and.w #$0003
	bne .6
.5:									; A = $0005, call randoma8, A - 1, A - 1, ...
	lda.w #$0005
	jsl.l randoma8
	dec a
	dec a
	and.w #$0007
	sta.b d0
	lda.b d4
	bmi .6
	lda.b d0
	eor.w #$0004
	sta.b d0
.6:									; d0 * 2, d0 * 2, X = d0, A = dirtab,x, ...
	asl.b d0
	asl.b d0
	ldx.b d0
	lda.l dirtab,x
	asl a
	asl a
	asl a
	asl a
	asl a
	ldx.b a3
	sta.w Xvel,x
	ldx.b d0
	lda.l $C09C06,x
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.b d4
	ldx.b a3
	sta.w Yvel,x
	lda.w #$0004
	ldy.w #$0000
	jsr.w FindPositionSlot
	bmi .10
	lda.w puckvy
	bpl .8
	lda.w pfgoal,y
	bne .9
.7:									; A = $0004, Y = $000C, call FindPositionSlot, if minus go to .10, ...
	lda.w #$0004
	ldy.w #$000C
	jsr.w FindPositionSlot
	bmi .10
	bra .9
.8:									; if pfgoal,y is not 0 go to .7
	lda.w pfgoal,y
	bne .7
.9:									; a2 = Y, X = a3, call a2touchpuck
	sty.b a2
	ldx.b a3
	jsl.l a2touchpuck
.10:								; A = tmflags, A and $FFFB, tmflags = A, A = tmflags+2, ...
	lda.w tmflags
	and.w #$FFFB
	sta.w tmflags
	lda.w tmflags+2
	and.w #$FFFB
	sta.w tmflags+2
	ldx.b a3
	jsl.l RandomWord
	and.w #$07FF
	sta.w puckvz
	stz.w puckz
	stz.w pfnc,x
	lda.w #$0018
	sta.b d0
	jml.l assreplace
