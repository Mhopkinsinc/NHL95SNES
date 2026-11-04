PrintNextScoutWord:					; prints the next scouting word, wrapping or advancing lines as needed
	ldx.b $7D
	lda.w ScoutTextCol
	cmp.w #$0021
	bcc .1
.loop:								; loop: call NextScoutTextLine
	jsr.w NextScoutTextLine
.1:									; A 8-bit
	sep #$20
.2:									; if $0000,x = 0 go to .4, X + 1, if $0000,x is not $39 go to .3, ...
	lda.w $0000,x
	beq .4
	inx
	cmp.b #$39
	bne .3
	rep #$20
	inc.b $7D
	jsr.w NextScoutTextLine
	bra .loop
.3:									; if A is not $20 go to .2
	cmp.b #$20
	bne .2
.4:									; A 16-bit, d0+2 = X, A = X, A - $7D, ...
	rep #$20
	stx.b d0+2
	txa
	sec
	sbc.b $7D
	beq .6
	sta.b d0
	clc
	adc.w ScoutTextCol
	sta.w ScoutTextCol
	cmp.w #$0022
	bcc .5
	jsr.w NextScoutTextLine
	lda.w ScoutTextCol
	clc
	adc.b d0
	sta.w ScoutTextCol
.5:									; X = $7D, Y = $0000, A 8-bit
	ldx.b $7D
	ldy.w #$0000
	sep #$20
.loop2:								; loop: mesarea,y = $0000,x, X + 1, Y + 1, ...
	lda.w $0000,x
	sta.w mesarea,y
	inx
	iny
	cpy.b d0
	bne .loop2
	lda.b #$00
	sta.w mesarea,y
	rep #$20
	lda.b d5+2
	sta.b $CF
	ldy.w ScoutTextRow
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
	clc
	adc.b d5+2
	dec a
	dec a
	dec a
	sta.b d5+2
	ldx.b d0+2
	stx.b $7D
	jsl.l SendTextMap
	jsl.l WaitTransfers
.rts:								; return
	rts
.6:									; if DemoMode = 0 go to .rts, pull A, go to ExitScoutingReport
	lda.w DemoMode
	beq .rts
	pla
	jmp.w ExitScoutingReport
