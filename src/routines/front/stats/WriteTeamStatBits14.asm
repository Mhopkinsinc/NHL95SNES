WriteTeamStatBits14:				; writes the low 14 bits of tmp1 from bit r2 on
	jsr.w WriteTeamStatBit
WriteTeamStatBits13:				; writes the low 13 bits of tmp1 from bit r2 on
	jsr.w WriteTeamStatBit
WriteTeamStatBits12:				; writes the low 12 bits of tmp1 from bit r2 on
	jsr.w WriteTeamStatBit
WriteTeamStatBits11:				; writes the low 11 bits of tmp1 from bit r2 on (WriteTeamStatBit 11
									; times)
	jsr.w WriteTeamStatBit
	jsr.w WriteTeamStatBit
	jsr.w WriteTeamStatBit
	jsr.w WriteTeamStatBit
	jsr.w WriteTeamStatBit
	jsr.w WriteTeamStatBit
	jsr.w WriteTeamStatBit
	jsr.w WriteTeamStatBit
	jsr.w WriteTeamStatBit
	jsr.w WriteTeamStatBit
WriteTeamStatBit:					; writes bit 0 of tmp1 to bit r2 of the team stats bit stream at
									; SRTeamStats; tmp1 / 2, r2 + 1
	lsr.b tmp1
	bcs .1
	lda.b r2
	and.w #$0007
	tax
	lda.l ByteBitMasks,x
	and.w #$00FF
	eor.w #$FFFF
	sta.b tmp3
	lda.b r2
	lsr a
	lsr a
	lsr a
	tax
	lda.l SRTeamStats,x
	and.b tmp3
	sta.l SRTeamStats,x
	inc.b r2
	rts
.1:									; A = r2, A and $0007, X = A, A = ByteBitMasks,x, ...
	lda.b r2
	and.w #$0007
	tax
	lda.l ByteBitMasks,x
	and.w #$00FF
	sta.b tmp3
	lda.b r2
	lsr a
	lsr a
	lsr a
	tax
	lda.l SRTeamStats,x
	ora.b tmp3
	sta.l SRTeamStats,x
	inc.b r2
	rts
