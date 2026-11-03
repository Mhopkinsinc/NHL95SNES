ClearCreatedPlayerTeams:			; sets team $1F (no team; free agents are $1A) in the SRPlayerTeams
									; entries of the 20 created players
	ldy.w #$1CF8
	lda.w #$0013
	sta.b tmp0
	tya
.1:									; A / 2, A / 2, A / 2, X = A, ...
	lsr a
	lsr a
	lsr a
	tax
	tya
	and.w #$0007
	beq .2
	lda.w #$01F0
	bra .3
.2:									; A = $001F
	lda.w #$001F
.3:									; A or SRPlayerTeams&$FFFF,x, SRPlayerTeams&$FFFF,x = A, A = Y, ...
	ora.w SRPlayerTeams&$FFFF,x
	sta.w SRPlayerTeams&$FFFF,x
	tya
	clc
	adc.w #$000C
	tay
	dec.b tmp0
	bpl .1
	rts
