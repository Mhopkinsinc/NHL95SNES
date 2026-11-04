ShootoutTurn:						; a shootout turn: a shot of team a2 against team a1
	stz.w shootoutstop
	stz.w shootoutturnover
	pei ($6B)
	jsl.l ClearPenaltyBuffer
	stz.w gmode
	lda.b a2
	beq .1
	lda.w #$0002
	sta.w gmode
.1:									; call StartPer, pull A, a2 = A, BA_Sktr_SCnum = 0, ...
	jsl.l StartPer
	pla
	sta.b a2
	stz.w BA_Sktr_SCnum
	lda.b a2
	beq .2
	lda.w #$000C
	sta.w BA_Sktr_SCnum
.2:									; Y = $0000
	ldy.w #$0000
.loop:								; loop: if padside,y = a2 go to .3, Y + 1, Y + 1, ...
	lda.w padside,y
	cmp.b a2
	beq .3
	iny
	iny
	cpy.w #$000A
	bcc .loop
	lda.w #$FFFF
	sta.w pspad
	bra .4
.3:									; pspad = Y
	sty.w pspad
.4:									; call StartPenaltyShot, if a2 = 0 go to .6, A = shootoutround
	jsl.l StartPenaltyShot
	lda.b a2
	beq .6
	lda.w shootoutround
.loop2:								; loop: if A - $0006 < 0 go to .5, A - $0005, go to .loop2
	cmp.w #$0006
	bmi .5
	sec
	sbc.w #$0005
	bra .loop2
.5:									; Y = A, A 8-bit, A = awayshooters,y, A 16-bit, ...
	tay
	sep #$20
	lda.w awayshooters,y
	rep #$20
	and.w #$00FF
	dec a
	sta.w BA_Skater_Offset
	lda.w #$000C
	sta.w BA_Sktr_SCnum
	lda.w #$0002
	sta.w BA_Team
	bra .8
.6:									; A = shootoutround
	lda.w shootoutround
.loop3:								; loop: if A - $0006 < 0 go to .7, A - $0005, go to .loop3
	cmp.w #$0006
	bmi .7
	sec
	sbc.w #$0005
	bra .loop3
.7:									; Y = A, A 8-bit, A = homeshooters,y, A 16-bit, ...
	tay
	sep #$20
	lda.w homeshooters,y
	rep #$20
	and.w #$00FF
	dec a
	sta.w BA_Skater_Offset
	lda.w #$0000
	sta.w BA_Sktr_SCnum
	stz.w BA_Team
.8:									; call Gameloop, return
	jsl.l Gameloop
	rtl
