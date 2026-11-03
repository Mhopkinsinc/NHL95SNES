RestorePenaltyPad:					; restore a disabled team pad to the player returning from a penalty
	phx
	tyx
	lda.w teampads,x
	cmp.w #$0004
	bcc .2
	ldy.w padsitnext,x
.loop:								; loop: Y + 1, Y + 1, if Y is not $000A go to .1, Y = $0000
	iny
	iny
	cpy.w #$000A
	bne .1
	ldy.w #$0000
.1:									; if padside,y >= 0 go to .loop, A and $00FF, ...
	lda.w padside,y
	bpl .loop
	and.w #$00FF
	cmp.b a1
	bne .loop
	sta.w padside,y
	inc a
	inc a
	lsr a
	sta.w cont1team,y
	ldx.b curobj
	tya
	sta.w playerpad,x
	txa
	sta.w c1playernum,y
.2:									; pull X, return
	plx
	rts
