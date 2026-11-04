CollisionSfx:						; the collision sound of players X and Y: sound driver command 4, its
									; volume from their relative speed (ApproxLength), a random pitch
	phx
	phy
	sec
	lda.w Xvel,x
	sbc.w Xvel,y
	pha
	sec
	lda.w Yvel,x
	sbc.w Yvel,y
	tay
	pla
	jsl.l ApproxLength
	xba
	and.w #$00F0
	sta.b tmp0
	lsr a
	lsr a
	lsr a
	lsr a
	tsb.b tmp0
	lda.w #$0014
	jsl.l RandomBelowA
	sec
	sbc.w #$000A
	xba
	ora.b tmp0
	tay
	ldx.w #$0008
	lda.w #$0004
	jsl.l QueueSoundCmd
	ply
	plx
	rtl
