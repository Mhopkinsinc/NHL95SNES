SetupPenaltyShot:					; penalty shot set up: the puck at centre ice, every player reassigned,
									; the defending goalie to his pad, the shooter gets the puck, pstimer 900,
									; ClearPenaltyBuffer
	jsr.w CentrePuck
	phx
	ldx.w #$0000
	lda.w #$0002
	sta.b d4
	lda.w BA_Team
	beq .1
	ldx.w #$000C
	lda.w #$0000
	sta.b d4
.1:									; d0 = $0010, call FillPlayerAssignments, call FillPlayerAssignments, ...
									; FillPlayerAssignments, ...
	lda.w #$0010
	sta.b d0
	jsl.l FillPlayerAssignments
	jsl.l FillPlayerAssignments
	jsl.l FillPlayerAssignments
	jsl.l FillPlayerAssignments
	jsl.l FillPlayerAssignments
	jsl.l FillPlayerAssignments
	ldx.b d4
	lda.w teampads,x
	beq .4
	lda.w goaliemode1,x
	beq .4
	ldy.w #$0000
.loop:								; loop: if padside,y < 0 go to .2, if padside,y = d4 go to .3
	lda.w padside,y
	bmi .2
	cmp.b d4
	beq .3
.2:									; Y + 1, Y + 1, if Y < $000A go to .loop, go to .4
	iny
	iny
	cpy.w #$000A
	bcc .loop
	bra .4
.3:									; d4 = Y, call PadTakeGoalie
	sty.b d4
	jsl.l PadTakeGoalie
.4:									; pull X, Y = BA_Team, tmtouch1,y = $FFFF, tmtouch2,y = A, ...
	plx
	ldy.w BA_Team
	lda.w #$FFFF
	sta.w tmtouch1,y
	sta.w tmtouch2,y
	sta.w tmtouch3,y
	lda.w CwdExciteLvl
	clc
	adc.w #$0014
	bmi .5
	sta.w CwdExciteLvl
.5:									; puckc = BA_Sktr_SCnum, Y = A, if pspad < 0 go to .6, playerpad,y = A
	lda.w BA_Sktr_SCnum
	sta.w puckc
	tay
	lda.w pspad
	bmi .6
	sta.w playerpad,y
.6:									; PenShotActive = 0, PenShotActive + 1, penshotlive = $0001, ...
	stz.w PenShotActive
	inc.w PenShotActive
	lda.w #$0001
	sta.w penshotlive
	lda.w #$0384
	sta.w pstimer
	jml.l ClearPenaltyBuffer
