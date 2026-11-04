FindScoringLeaders:					; scan both team roster ranges for the leading scorers
	ldx.w HomeRoster
.loop:								; loop: X - 1, A = X, call InsertScoringLeader, ...
	dex
	txa
	jsr.w InsertScoringLeader
	cpx.w HomeRoster+2
	bcs .loop
	ldx.w VisRoster
.loop2:								; loop: X - 1, A = X, A + $001A, call InsertScoringLeader, ...
	dex
	txa
	clc
	adc.w #$001A
	jsr.w InsertScoringLeader
	cpx.w VisRoster+2
	bcs .loop2
	rts
