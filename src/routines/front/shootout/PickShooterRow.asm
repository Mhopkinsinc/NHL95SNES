PickShooterRow:						; the pick on a shooter row: the goalie row cycles the goalie
									; (GetGoalieCount), a shooter row opens the shooter list (the code after
									; its rtl, 94S ShooterSelectList)
	lda.w curitem
	bne .3
	jsl.l GetGoalieCount
	lda.w #$0000
	sta.b a1+2
	lda.w #homeshooters
	sta.b a1
	lda.b a2
	beq .1
	lda.w #$0000
	sta.b a1+2
	lda.w #awayshooters
	sta.b a1
.1:									; A = [a1], A and $00FF, A + 1, if A = d0 go to .2, ...
	lda.b [a1]
	and.w #$00FF
	inc a
	cmp.b d0
	beq .2
	bmi .2
	lda.w #$0001
.2:									; A 8-bit, [a1] = A, A 16-bit, return
	sep #$20
	sta.b [a1]
	rep #$20
	rtl
.3:									; d0 = $0020, d1 = $000D, d2 = blankchar, call eraser, ...
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.w blankchar
	sta.b d2
	jsl.l eraser
	ldx.w #$0001
	ldy.w #$0001
	lda.w charofs2
	clc
	adc.w #$0C00
	jsl.l WaitFrame
	lda.w #$0007
	sta.w irqline2
	jsl.l GetPlayerCount
	lda.b d0
	sta.w listcount
	jsl.l GetGoalieCount
	lda.w listcount
	sec
	sbc.b d0
	sta.w listcount
	lda.b d0
	sta.w pickfirst
	lda.b d0
	sta.w picktop
	lda.w #$0000
	sta.b a3+2
	lda.w #homeshooters
	sta.b a3
	lda.b a2
	beq .4
	lda.w #$0000
	sta.b a3+2
	lda.w #awayshooters
	sta.b a3
.4:									; A = a3, A + curitem, a3 = A, A = [a3], ...
	lda.b a3
	clc
	adc.w curitem
	sta.b a3
	lda.b [a3]
	and.w #$00FF
	dec a
	sta.w curplayer
	lda.w #$0008
	clc
	adc.w picktop
	sec
	sbc.w curplayer
	bpl .6
	lda.w curplayer
	sec
	sbc.w #$0008
	sec
	sbc.w picktop
	bmi .5
	clc
	adc.w picktop
	sta.w picktop
.5:									; A = $0000, go to .7
	lda.w #$0000
	bra .7
.6:									; A = picktop, A + $0008, A - curplayer
	lda.w picktop
	clc
	adc.w #$0008
	sec
	sbc.w curplayer
.7:									; curplayer = A, call PrintShooterList
	sta.w curplayer
	jsl.l PrintShooterList
.loop:								; loop: call WaitFrame, call ReadPads, call ReadPausePad, ...
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	bne .8
	bit.w #$0800
	bne .12
	bit.w #$0400
	bne .11
	bit.w #$0100
	bne .9
	bit.w #$0200
	bne .10
	bit.w #$8080
	beq .loop
	jsl.l SetShooter
.8:									; drawlinesback = $0001, return
	lda.w #$0001
	sta.w drawlinesback
	rtl
.9:									; A = DispAttribCtr, A + 1, if A - $0010 >= 0 go to .loop, ...
	lda.w DispAttribCtr
	inc a
	cmp.w #$0010
	bpl .loop
	sta.w DispAttribCtr
	jsl.l PrintShooterList
	bra .loop
.10:								; A = DispAttribCtr, A - 1, if the result < 0 go to .loop, ...
	lda.w DispAttribCtr
	dec a
	bmi .loop
	sta.w DispAttribCtr
	jsl.l PrintShooterList
	jmp.w .loop
.11:								; A = curplayer, A - 1, if the result < 0 go to .13, curplayer = A, ...
	lda.w curplayer
	dec a
	bmi .13
	sta.w curplayer
	jsl.l PrintShooterList
	jmp.w .loop
.12:								; A = curplayer, A + 1, if A - $0009 >= 0 go to .15, curplayer = A, ...
	lda.w curplayer
	inc a
	cmp.w #$0009
	bpl .15
	sta.w curplayer
	jsl.l PrintShooterList
	jmp.w .loop
.13:								; A = picktop, A - pickfirst, A + $0009, ...
	lda.w picktop
	sec
	sbc.w pickfirst
	clc
	adc.w #$0009
	cmp.w listcount
	bmi .14
	jmp.w .loop
.14:								; picktop + 1, call PrintShooterList, go to .loop
	inc.w picktop
	jsl.l PrintShooterList
	jmp.w .loop
.15:								; A = picktop, A - 1, if A - pickfirst >= 0 go to .16, go to .loop
	lda.w picktop
	dec a
	cmp.w pickfirst
	bpl .16
	jmp.w .loop
.16:								; picktop - 1, call PrintShooterList, go to .loop
	dec.w picktop
	jsl.l PrintShooterList
	jmp.w .loop
