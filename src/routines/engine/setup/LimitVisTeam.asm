LimitVisTeam:						; the Visiting Team line's check: with OptRosters set or a play mode past
									; Practice, VisTeam wraps past teams $1A / $1B (to 0 / $19)
	lda.w OptRosters
	bne .1
	lda.w OptPlayMode
	beq .rts
	dec a
	beq .rts
.1:									; if VisTeam is not $001A go to .3, A = $0000
	lda.w VisTeam
	cmp.w #$001A
	bne .3
	lda.w #$0000
.2:									; VisTeam = A, go to .rts
	sta.w VisTeam
	bra .rts
.3:									; if A is not $001B go to .rts, A = $0019, go to .2
	cmp.w #$001B
	bne .rts
	lda.w #$0019
	bra .2
.rts:								; return
	rts
