AssignTeam:							; inserts assignment d0 (assinsert) for each skater of team a2 on the ice:
									; the six slots from tmsort, goalie (position 0) and empty slots skipped,
									; pfnc cleared
	phx
	ldy.b a2
	lda.w tmsort,y
	tax
	lda.w #$0005
	sta.b d3
.loop:								; loop: if position,x < 0 go to .1, if zero go to .1, pfnc,x = 0, ...
	lda.w position,x
	bmi .1
	beq .1
	stz.w pfnc,x
	jsl.l assinsert
.1:									; X + 1, X + 1, d3 - 1, if the result >= 0 go to .loop, ...
	inx
	inx
	dec.b d3
	bpl .loop
	plx
rtsgoal:							; the return of Goal and AssignTeam
	rtl
