ToggleTeamBarHighlight:				; toggles the highlight of a team's name bar in the bracket map buffer:
									; palette bit $0400 of its two rows of 12 tiles
	clc
	tyx
	jsr.w ToggleTeamBarRow
	txa
	adc.w #$00B0
	tax
ToggleTeamBarRow:					; toggles palette bit $0400 of 12 tiles at X in rinkmapbuf
	ldy.w #$000B
.loop:								; loop: A = rinkmapbuf,x, A xor $0400, rinkmapbuf,x = A, X + 1, ...
	lda.l rinkmapbuf,x
	eor.w #$0400
	sta.l rinkmapbuf,x
	inx
	inx
	dey
	bpl .loop
	rts
