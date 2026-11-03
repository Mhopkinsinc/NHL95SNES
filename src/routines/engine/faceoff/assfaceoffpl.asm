assfaceoffpl:						; called from other segments
	lda.w pfalock,x
	beq .1
	jmp.w .rtl
.1:									; A = sflags, if $0100 bits clear go to .5, A = pflags,x, ...
	lda.w sflags
	bit.w #$0100
	beq .5
	lda.w pflags,x
	bit.w #$0002
	beq .2
	and.w #$FFFD
	sta.w pflags,x
	stz.w temp1,x
.2:									; a0+2 = $007E, a0 = $2028, if pfteam,x = 0 go to .3, a0 = $202C
	lda.w #$007E
	sta.b a0+2
	lda.w #$2028
	sta.b a0
	lda.w pfteam,x
	beq .3
	lda.w #$202C
	sta.b a0
.3:									; A = SPAnum,x, A / 2, A / 2, A + 1, ...
	lda.w SPAnum,x
	lsr a
	lsr a
	inc a
	sta.b d0
	lda.w handed,x
	bne .4
	inc.b d0
	inc.b d0
	inc.b d0
.4:									; [a0] = d0, if playerpad,x >= 0 go to .rtl, A = pf2aip,x, push A, ...
	lda.b d0
	sta.b [a0]
	lda.w playerpad,x
	bpl .rtl
	lda.w pf2aip,x
	pha
	lda.w #$0001
	sta.w pf2aip,x
	pla
	cmp.w #$0000
	bne .rtl
	lda.w #SPAfaceoff&$FFFF
	sta.b d1
	lda.w temp1+$1C
	cmp.w #$0011
	bcc .6
	jsl.l RandomWord
	and.w #$0007
	sta.b d0
	beq .6
	lda.w #SPAfaceoffr&$FFFF
	sta.b d1
	lda.w #$0001
	sta.w pf2aip,x
	jml.l SetSPA
.5:									; LCBoxesClosed = 0, nopuck,x = $0014, go to assexit
	stz.w LCBoxesClosed
	lda.w #$0014
	sta.w nopuck,x
	jmp.w assexit
.6:									; A = pfgoal,x, A / 2, if carry clear go to .7, X = FaceoffSpriteLeft
	lda.w pfgoal,x
	lsr a
	ldx.w FaceoffSpriteRight
	bcc .7
	ldx.w FaceoffSpriteLeft
.7:									; if OptPlayMode = $0001 go to .8, $30,x = 0
	lda.w OptPlayMode
	cmp.w #$0001
	beq .8
	stz.b $30,x
.8:									; X = a3, pf2aip,x = $0001, go to SetSPA
	ldx.b a3
	lda.w #$0001
	sta.w pf2aip,x
	jml.l SetSPA
.rtl:								; return
	rtl
