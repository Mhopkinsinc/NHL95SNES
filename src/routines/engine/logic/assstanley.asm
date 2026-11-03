assstanley:							; called from other segments
	lda.w pflags,x
	bit.w #$0002
	beq .2
	and.w #$FFFD
	sta.w pflags,x
	lda.w #$005A
	sta.w temp3,x
	lda.b Hpos
	bpl .1
	lda.w #$FFA6
	sta.w temp3,x
.1:									; temp4,x = Vpos, pfalock,x = A, call SetSPAFromA
	lda.b Vpos
	sta.w temp4,x
	sta.w pfalock,x
	jsl.l SetSPAFromA
.2:									; A = temp3,x, A - Xpos,x, d0 = A, A = temp4,x, ...
	lda.w temp3,x
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w temp4,x
	sec
	sbc.w Ypos,x
	sta.b d1
	jsl.l vtoa
	lda.b d0
	cmp.w #$0008
	bpl .rtl
	lda.b d0
	sta.b d2
	sta.w facedir,x
	lda.w #$0014
	sta.w pfalock,x
	jmp.w playeracc
.rtl:								; return
	rtl
