IsSkater:							; carry set when player A is a skater, clear for a goalie: a created
									; player's position bits above 0, else PlayerList bits 14-15 not 0
	cmp.w #$026A
	bcc .1
	phy
	jsr.w CreatedPlayerBits
	jsr.w NextSaveBits3
	cmp.w #$0001
	ply
	rts
.1:									; A * 2, X = A, return
	asl a
	tax
	lda.l PlayerList,x
	cmp.w #$4000
	rts
