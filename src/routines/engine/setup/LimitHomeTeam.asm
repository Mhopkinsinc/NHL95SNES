LimitHomeTeam:						; the Home Team line's check: with OptRosters set or a play mode past
									; Practice, HomeTeam wraps past teams $1A / $1B (to 0 / $19)
	lda.w OptRosters
	bne .1
	lda.w OptPlayMode
	beq .rts
	dec a
	beq .rts
.1:									; if HomeTeam is not $001A go to .3, A = $0000
	lda.w HomeTeam
	cmp.w #$001A
	bne .3
	lda.w #$0000
.2:									; HomeTeam = A, go to .rts
	sta.w HomeTeam
	bra .rts
.3:									; if A is not $001B go to .rts, A = $0019, go to .2
	cmp.w #$001B
	bne .rts
	lda.w #$0019
	bra .2
.rts:								; return
	rts
