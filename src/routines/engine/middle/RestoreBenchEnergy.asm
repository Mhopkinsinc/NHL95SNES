RestoreBenchEnergy:					; called from other segments
	lda.w OptLine
	beq RestoreBenchEnergyReturn
	stz.b a2
	jsl.l RestoreTeamBenchEnergy
	lda.w #$0002
	sta.b a2
RestoreTeamBenchEnergy:				; team a2's players on the bench (tmpdst $FFFE) get 10 energy (tmpde), up
									; to $1000
	lda.w #$0032
	sta.b d0
.loop:								; loop: if a2 = 0 go to .1, A = $0034
	lda.b a2
	beq .1
	lda.w #$0034
.1:									; A + d0, Y = A, if tmpdst,y is not $FFFE go to .2, A = tmpde,y, ...
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	cmp.w #$FFFE
	bne .2
	lda.w tmpde,y
	clc
	adc.w #$000A
	sta.w tmpde,y
	sec
	sbc.w #$1000
	bmi .2
	lda.w #$1000
	sta.w tmpde,y
.2:									; d0 - 1, d0 - 1, if the result >= 0 go to .loop
	dec.b d0
	dec.b d0
	bpl .loop
RestoreBenchEnergyReturn:			; the rtl RestoreBenchEnergy's early branches leave through
	rtl
