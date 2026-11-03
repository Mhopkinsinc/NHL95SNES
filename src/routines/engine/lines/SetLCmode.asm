SetLCmode:							; opens the line change box for player X's team when line changes are on
									; (OptLine 1) and the box is not open: tmflags bit 3, then SetLCmode2
	lda.w OptLine
	cmp.w #$0001
	bne .rtl
	jsl.l loadTeamStruct
	ldy.b a2
	lda.w tmflags,y
	bit.w #$0008
	bne .rtl
	ora.w #$0008
	sta.w tmflags,y
	lda.w #$000C
	trb.w sflags
	jmp.w SetLCmode2
.rtl:								; return
	rtl
