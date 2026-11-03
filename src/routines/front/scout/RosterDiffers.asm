RosterDiffers:						; carry set when the roster table at Y differs from the one at X (a count
									; at +0 / +2 / +4 or a player index at +$3A)
	lda.w $0002,x
	cmp.w $0002,y
	bne .1
	lda.w $0004,x
	cmp.w $0004,y
	bne .1
	lda.w $0000,x
	cmp.w $0000,y
	bne .1
	dec a
	sta.b tmp0
.loop:								; loop: if $003A,x is not $003A,y go to .1, X + 1, X + 1, Y + 1, ...
	lda.w $003A,x
	cmp.w $003A,y
	bne .1
	inx
	inx
	iny
	iny
	dec.b tmp0
	bpl .loop
	clc
	rts
.1:									; return
	sec
	rts
