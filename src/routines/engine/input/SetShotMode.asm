SetShotMode:						; from assshoot and other segments
	lda.w #$0008
	sta.w passdir
	lda.w #$0008
	tsb.w sflags
	stz.b d0
	lda.w #$0128
	sta.b d1
	lda.w pfgoal,x
	bne .1
	lda.w #$FED8
	sta.b d1
.1:									; A = d0, A - Xpos,x, d0 = A, A = d1, ...
	lda.b d0
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.b d1
	sec
	sbc.w Ypos,x
	sta.b d1
	jsl.l vtoa
	lda.w #$000F
	sta.w passspeed
	ldy.w #SPAshotf&$FFFF
	jsl.l Findhittype
	beq .2
	ldy.w #SPAshotb&$FFFF
.2:									; d1 = Y, go to SetSPA
	sty.b d1
	jml.l SetSPA
