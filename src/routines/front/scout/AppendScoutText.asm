AppendScoutText:					; unpacks text X (UnpackText) and appends it to the scouting report's
									; text buffer
	jsl.l UnpackText
AppendScoutString:					; appends the zero-terminated string at X to the scouting text buffer
	ldy.b d0+2
	sep #$20
.loop:								; loop: if $0000,x = 0 go to .1, ScratchBuf,y = A, X + 1, Y + 1, ...
	lda.w $0000,x
	beq .1
	sta.w ScratchBuf,y
	inx
	iny
	bra .loop
.1:									; A 16-bit, d0+2 = Y, return
	rep #$20
	sty.b d0+2
	rts
