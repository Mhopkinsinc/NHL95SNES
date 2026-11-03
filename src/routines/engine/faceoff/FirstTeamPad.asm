FirstTeamPad:						; A = the first pad (0-8 by 2) whose padside is team a2, or $FFFF
	ldy.w #$0000
.loop:								; loop: if padside,y = a2 go to .1, Y + 1, Y + 1, ...
	lda.w padside,y
	cmp.b a2
	beq .1
	iny
	iny
	cpy.w #$000A
	bcc .loop
	lda.w #$FFFF
	bra .rtl
.1:									; A = Y
	tya
.rtl:								; return
	rtl
