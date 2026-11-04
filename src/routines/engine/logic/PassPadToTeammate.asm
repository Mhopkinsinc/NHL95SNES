PassPadToTeammate:					; called from other segments
	ldy.w #$0000
	cpx.w #$000C
	bcc .loop
	ldy.w #$000C
.loop:								; loop: if playerpad,y >= 0 go to .1, if position,y >= 0 go to .2
	lda.w playerpad,y
	bpl .1
	lda.w position,y
	bpl .2
.1:									; Y + 1, Y + 1, go to .loop
	iny
	iny
	bra .loop
.2:									; push X, call PadTakePosition, pull X, return
	phx
	jsl.l PadTakePosition
	plx
	rtl
