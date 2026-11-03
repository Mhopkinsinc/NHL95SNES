DumpInTarget:						; from assdumpin and other segments
	stx.w dumpinplayer
	lda.w position,x
	beq .6
	lda.w pfgoal,x
	bne .3
	lda.w Ypos,x
	cmp.w #$FFA4
	bmi .2
	lda.w #$0004
	sta.w passdir
	lda.w Xpos,x
	bmi .1
	lda.w #$000A
	sta.w dumpintarget
	rtl
.1:									; dumpintarget = $0006, return
	lda.w #$0006
	sta.w dumpintarget
	rtl
.2:									; A = puckdir+26, A - $0004, A and $0007, passdir = A, ...
	lda.w puckdir+26
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w #$0008
	sta.w dumpintarget
	rtl
.3:									; if Ypos,x - $005C >= 0 go to .5, passdir = $0000, ...
	lda.w Ypos,x
	cmp.w #$005C
	bpl .5
	lda.w #$0000
	sta.w passdir
	lda.w Xpos,x
	bmi .4
	lda.w #$0016
	sta.w dumpintarget
	rtl
.4:									; dumpintarget = $0012, return
	lda.w #$0012
	sta.w dumpintarget
	rtl
.5:									; A = puckdir+24, A - $0004, A and $0007, passdir = A, ...
	lda.w puckdir+24
	sec
	sbc.w #$0004
	and.w #$0007
	sta.w passdir
	lda.w #$0014
	sta.w dumpintarget
	rtl
.6:									; dumpintarget = 0, passdir = 0, if pfgoal,x is not 0 go to .rtl, ...
	stz.w dumpintarget
	stz.w passdir
	lda.w pfgoal,x
	bne .rtl
	lda.w #$000C
	sta.w dumpintarget
	lda.w #$0004
	sta.w passdir
.rtl:								; return
	rtl
