DrawPlayModeOptions:				; the Play Mode line's routine (setoptions calls it too): ClampRosterTeams
									; past Practice, VisTeam moved on when Trades has it equal to HomeTeam,
									; then the mode's option list (PlayModeOptionLists, DrawOptionList)
	lda.w OptPlayMode
	beq .1
	dec a
	beq .1
	jsr.w ClampRosterTeams
.1:									; if OptPlayMode is not $0003 go to .3, ...
	lda.w OptPlayMode
	cmp.w #$0003
	bne .3
	lda.w VisTeam
	cmp.w HomeTeam
	bne .3
	inc a
	cmp.w #$001A
	bcc .2
	lda.w #$0000
.2:									; VisTeam = A, SRVisTeam = A, call PrintVisTeamName
	sta.w VisTeam
	sta.l SRVisTeam
	jsr.w PrintVisTeamName
.3:									; A = $0480, A + $D3, Y = $0200, call ClearRAM7E, ...
	clc
	lda.w #$0480
	adc.b $D3
	ldy.w #$0200
	jsl.l ClearRAM7E
	jsl.l SendTextMap
	jsl.l WaitTransfers
	lda.w OptPlayMode
	asl a
	tax
	lda.l PlayModeOptionLists,x
	jsl.l DrawOptionList
	rts
