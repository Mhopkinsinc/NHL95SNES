PrintShooterNames:					; redraws the shooter rows: the eraser box ($20 x $13), the rows printed
									; with the cursor row (curitem) marked
	lda.w #$0020
	sta.b d0
	lda.w #$0013
	sta.b d1
	lda.w blankchar
	sta.b d2
	jsl.l eraser
	jsl.l GetGoalieCount
	lda.b d0
	dec a
	sta.b d1
	lda.w #InitShooters>>16
	sta.b $79
	lda.w #InitShooters
	sta.b $77
	lda.w #DefaultShooterList>>16
	sta.b a3+2
	lda.w #DefaultShooterList&$FFFF
	sta.b a3
	lda.w SelectedPlayerIdx
	dec a
	sta.b d0
	bmi .loop
	asl a
	asl a
	asl a
	sta.b d0
	lda.w #$0000
	sta.b a3+2
	lda.w #homeshooters
	sta.b a3
	lda.b a2
	beq .1
	lda.w #$0000
	sta.b a3+2
	lda.w #awayshooters
	sta.b a3
.1:									; $79 = InitShooters>>16, $77 = InitShooters, d1 = $0005
	lda.w #InitShooters>>16
	sta.b $79
	lda.w #InitShooters
	sta.b $77
	lda.w #$0005
	sta.b d1
.loop:								; loop: printa = $3800, A = $0005, A - d1, ...
	lda.w #$3800
	sta.w printa
	lda.w #$0005
	sec
	sbc.b d1
	cmp.w curitem
	bne .3
	lda.w #$2000
	sta.w printa
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.w matchuphome
	phx
	ldx.b a2
	lda.w HomeTeam,x
	cmp.w #$0018
	bcc .2
	ldx.w #$0000
	lda.w matchuphome
.2:									; pull X
	plx
.3:									; printx = $0005, printx = $0008, A = [a3], A and $00FF, ...
	lda.w #$0005
	sta.w printx
	lda.w #$0008
	sta.w printx
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.b d0
	inc.b a3
	inc.w printy
	inc.w printy
	dec.b d1
	bmi .4
	jmp.w .loop
.4:									; call ShootersBackground, return
	jsl.l ShootersBackground
	rtl
