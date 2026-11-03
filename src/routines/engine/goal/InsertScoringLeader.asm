InsertScoringLeader:				; insert a player into the top three by points then goals
	tay
	lda.w tmgoals,y
	and.w #$00FF
	sta.b tmp0
	lda.w tmassists,y
	and.w #$00FF
	sta.b tmp1
	clc
	adc.b tmp0
	sta.b tmp2
	lda.w ScoringLeaders
	bmi .3
	clc
	lda.w LeaderStats
	adc.w LeaderStats+$2
	cmp.b tmp2
	bcc .3
	bne .1
	lda.w LeaderStats
	cmp.b tmp0
	bcc .3
.1:									; if ScoringLeaders+$2 < 0 go to .4, A = LeaderStats+$4, ...
	lda.w ScoringLeaders+$2
	bmi .4
	clc
	lda.w LeaderStats+$4
	adc.w LeaderStats+$6
	cmp.b tmp2
	bcc .4
	bne .2
	lda.w LeaderStats+$4
	cmp.b tmp0
	bcc .4
.2:									; if ScoringLeaders+$4 < 0 go to .5, A = LeaderStats+$8, ...
	lda.w ScoringLeaders+$4
	bmi .5
	clc
	lda.w LeaderStats+$8
	adc.w LeaderStats+$A
	cmp.b tmp2
	bcc .5
	bne .rts
	lda.w LeaderStats+$8
	cmp.b tmp0
	bcc .5
.rts:								; return
	rts
.3:									; ScoringLeaders+$4 = ScoringLeaders+$2, ...
	lda.w ScoringLeaders+$2
	sta.w ScoringLeaders+$4
	lda.w ScoringLeaders
	sta.w ScoringLeaders+$2
	lda.w LeaderStats+$4
	sta.w LeaderStats+$8
	lda.w LeaderStats
	sta.w LeaderStats+$4
	lda.w LeaderStats+$6
	sta.w LeaderStats+$A
	lda.w LeaderStats+$2
	sta.w LeaderStats+$6
	sty.w ScoringLeaders
	lda.b tmp0
	sta.w LeaderStats
	lda.b tmp1
	sta.w LeaderStats+$2
	rts
.4:									; ScoringLeaders+$4 = ScoringLeaders+$2, ...
	lda.w ScoringLeaders+$2
	sta.w ScoringLeaders+$4
	lda.w LeaderStats+$4
	sta.w LeaderStats+$8
	lda.w LeaderStats+$6
	sta.w LeaderStats+$A
	sty.w ScoringLeaders+$2
	lda.b tmp0
	sta.w LeaderStats+$4
	lda.b tmp1
	sta.w LeaderStats+$6
	rts
.5:									; ScoringLeaders+$4 = Y, LeaderStats+$8 = tmp0, LeaderStats+$A = tmp1, ...
	sty.w ScoringLeaders+$4
	lda.b tmp0
	sta.w LeaderStats+$8
	lda.b tmp1
	sta.w LeaderStats+$A
	rts
