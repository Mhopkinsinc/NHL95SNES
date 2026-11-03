faceoffinput:						; pad input of a centre taking a face off (assignment $17): the pad
									; direction to fodir1 / fodir2 by pfgoal; B starts the swing (pf2aip)
	lda.w asscur,x
	cmp.w #$0017
	bne .rtl
	lda.w pfgoal,x
	beq .2
	lda.b d0
	sta.w fodir2
	lda.w pf2aip,x
	bne .rtl
	lda.b d1
	bit.w #$8000
	beq .4
	sta.w pf2aip,x
	lda.w OptPlayMode
	cmp.w #$0001
	beq .1
	ldx.w FaceoffSpriteLeft
	stz.b $30,x
.1:									; X = a3, A = SPAfaceoff&$FFFF, go to SetSPAFromA
	ldx.b a3
	lda.w #SPAfaceoff&$FFFF
	jml.l SetSPAFromA
.rtl:								; return
	rtl
.2:									; fodir1 = d0, if pf2aip,x is not 0 go to .rtl, A = d1, ...
	lda.b d0
	sta.w fodir1
	lda.w pf2aip,x
	bne .rtl
	lda.b d1
	bit.w #$8000
	beq .4
	sta.w pf2aip,x
	lda.w OptPlayMode
	cmp.w #$0001
	beq .3
	ldx.w FaceoffSpriteRight
	stz.b $30,x
.3:									; X = a3, A = SPAfaceoff&$FFFF, go to SetSPAFromA
	ldx.b a3
	lda.w #SPAfaceoff&$FFFF
	jml.l SetSPAFromA
.4:									; A = SPAfaceoffr&$FFFF, go to SetSPAFromA
	lda.w #SPAfaceoffr&$FFFF
	jml.l SetSPAFromA
