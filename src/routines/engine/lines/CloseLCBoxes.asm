CloseLCBoxes:						; closes each team's open line change box (tmflags bit 3, only when
									; OptLine is on) through lcfound_close, then $18AA + 1
	lda.w OptLine
	beq .rtl
	pei ($6B)
	lda.w tmflags
	bit.w #$0008
	beq .1
	and.w #$FFF7
	sta.w tmflags
	stz.b a2
	jsl.l lcfound_close
.1:									; A = tmflags+2, if $0008 bits clear go to .2, A and $FFF7, ...
	lda.w tmflags+2
	bit.w #$0008
	beq .2
	and.w #$FFF7
	sta.w tmflags+2
	lda.w #$0002
	sta.b a2
	jsl.l lcfound_close
.2:									; pull A, a2 = A, LCBoxesClosed + 1
	pla
	sta.b a2
	inc.w LCBoxesClosed
.rtl:								; return
	rtl
