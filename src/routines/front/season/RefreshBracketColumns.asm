RefreshBracketColumns:				; uploads the visible bracket map columns while preserving the scroll
									; column
	pei ($63)
	ldx.w #$0003
.loop:								; loop: push X, Y = $0008
	phx
	ldy.w #$0008
.loop2:								; loop: push Y, tmp0 = 0, call QueueBracketColumn, a0 + 1, ...
	phy
	stz.b tmp0
	jsr.w QueueBracketColumn
	inc.b a0
	ply
	dey
	bpl .loop2
	jsl.l WaitTransfers
	plx
	dex
	bpl .loop
	pla
	sta.b a0
	rts
