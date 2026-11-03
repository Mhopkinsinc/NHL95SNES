ScanHart:							; Hart Trophy: of the 8 teams with the highest standings word $0A, the
									; skater with the biggest share of his team's goals + assists
	stz.b a2
	stz.b r1+2
	ldx.w #$002E
.loop:								; loop: ScratchBuf,x = 0, X - 1, X - 1, ...
	stz.w ScratchBuf,x
	dex
	dex
	bpl .loop
	lda.w #$0000
.1:									; a2+2 = A, call BuildTeamSeasonRecordLong, X = ScratchBuf
	sta.b a2+2
	jsl.l BuildTeamSeasonRecordLong
	ldx.w #ScratchBuf
.loop2:								; loop: if $000A,y >= $0000,x go to .2, A = X, A + $0006, X = A, ...
	lda.w $000A,y
	cmp.w $0000,x
	bcs .2
	txa
	clc
	adc.w #$0006
	tax
	cmp.w #$367E
	bne .loop2
	bra .4
.2:									; push Y, A = X, A xor $FFFF, A + 1, ...
	phy
	txa
	eor.w #$FFFF
	inc a
	clc
	ldy.w #$367D
	ldx.w #$3677
	adc.w #$3678
	beq .3
	dec a
	mvp $7E,$7E
.3:									; pull Y, X + 1, $0000,x = $000A,y, $0004,x = a2+2
	ply
	inx
	lda.w $000A,y
	sta.w $0000,x
	lda.b a2+2
	sta.w $0004,x
.4:									; A = a2+2, A + 1, if A is not $001A go to .1, X = $0000
	lda.b a2+2
	inc a
	cmp.w #$001A
	bne .1
	ldx.w #$0000
.5:									; a2+2 = X, HomeTeam = ScratchBuf+$4,x, call LoadSeasonHomeRoster, ...
	stx.b a2+2
	lda.w ScratchBuf+$4,x
	sta.w HomeTeam
	jsl.l LoadSeasonHomeRoster
	stz.b tmp2
	stz.b r1
	lda.w HomeRoster+6
	clc
	adc.w HomeRoster+4
.loop3:								; loop: A - 1, if the result < 0 go to .loop4, HomeRoster+4 = A, ...
	dec a
	bmi .loop4
	sta.w HomeRoster+4
	adc.w HomeRoster+2
	asl a
	tax
	lda.w HomeRoster+58,x
	sta.b a3
	jsl.l SeasonGoalsLong
	lda.b tmp0
	sta.b tmp1
	lda.b a3
	jsl.l SeasonAssistsLong
	lda.b tmp0
	clc
	adc.b tmp1
	ldx.b tmp2
	sta.w ScratchBuf+$32,x
	clc
	adc.b r1
	sta.b r1
	lda.b a3
	sta.w ScratchBuf+$30,x
	inx
	inx
	inx
	inx
	stx.b tmp2
	lda.w HomeRoster+4
	bra .loop3
.loop4:								; loop: X - 1, X - 1, X - 1, X - 1, ...
	dex
	dex
	dex
	dex
	bmi .6
	stx.b tmp2
	stz.b r2
	stz.b r2+2
	lda.w ScratchBuf+$32,x
	asl a
	sta.b $35
	pei ($30)
	pei ($32)
	jsl.l Div32x32U
	pla
	sta.b r1+2
	pla
	sta.b r1
	ldx.b tmp2
	lda.b r0
	cmp.b a2
	bcc .loop4
	sta.b a2
	lda.w ScratchBuf+$30,x
	sta.b a3+2
	bra .loop4
.6:									; A = a2+2, A + $0006, X = A, if A >= $0030 go to .7, ...
	lda.b a2+2
	clc
	adc.w #$0006
	tax
	cmp.w #$0030
	bcs .7
	jmp.w .5
.7:									; A = a3+2, return
	lda.b a3+2
	rts
