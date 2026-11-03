ShootoutShooters:					; pick the shootout shooters of a pad's team: up / down move the row, A /
									; B pick (PickShooterRow), start sets the goalie; no code reaches it
	jsl.l GetPadTeam
	lda.w #$0001
	sta.b d0
	lda.b a2
	beq .7
	lda.w #$0002
	sta.b d0
.7:									; if cont1team = d0 go to .8, if cont2team = d0 go to .8, go to .10
	lda.w cont1team
	cmp.b d0
	beq .8
	lda.w cont2team
	cmp.b d0
	beq .8
	jmp.w .10
.8:									; X = a2, setupvis = HomeTeam,x, setuphome = $FFFF, ...
	ldx.b a2
	lda.w HomeTeam,x
	sta.w setupvis
	lda.w #$FFFF
	sta.w setuphome
	jsl.l ShootersSetup
	jsl.l ShootersBackground
	stz.w curitem
	lda.w #$0001
	sta.w SelectedPlayerIdx
	stz.w DispAttribCtr
	jsl.l PrintShooterNames
	lda.w #$0005
	ldx.w #$0050
	jsl.l ScreenOn
.loop:								; loop: call WaitFrame, call ReadPads, call ReadPausePad, ...
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$0800
	bne .13
	bit.w #$0400
	bne .14
	bit.w #$8080
	bne .15
	bit.w #$1000
	bne .10
.9:									; go to .loop
	bra .loop
.10:								; if a2 is not 0 go to .11, A 8-bit, A = homeshooters, A 16-bit, ...
	ldy.b a2
	bne .11
	sep #$20
	lda.w homeshooters
	rep #$20
	bra .12
.11:								; A 8-bit, A = awayshooters, A 16-bit
	sep #$20
	lda.w awayshooters
	rep #$20
.12:								; A and $00FF, A - 1, tmgoalie,y = A, return
	and.w #$00FF
	dec a
	sta.w tmgoalie,y
	rtl
.13:								; if curitem = 0 go to .9, curitem - 1, call PrintShooterNames, go to .9
	lda.w curitem
	beq .9
	dec.w curitem
	jsl.l PrintShooterNames
	bra .9
.14:								; if curitem - $0005 >= 0 go to .9, curitem + 1, ...
	lda.w curitem
	cmp.w #$0005
	bpl .9
	inc.w curitem
	jsl.l PrintShooterNames
	bra .9
.15:								; call PickShooterRow, call PrintShooterNames, go to .9
	jsl.l PickShooterRow
	jsl.l PrintShooterNames
	bra .9
