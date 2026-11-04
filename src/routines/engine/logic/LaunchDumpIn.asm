LaunchDumpIn:						; launch the puck toward the dump-in target and start the pass swing
	txy
	lda.w #$000F
	sec
	sbc.w passacc,y
	asl a
	sta.b d4
	ldx.w dumpintarget
	lda.l DumpInSpreadX,x
	clc
	adc.b d4
	jsl.l randomd0s
	clc
	adc.l DumpInTargetX,x
	sec
	sbc.w puckx
	sta.b d0
	lda.l DumpInSpreadY,x
	clc
	adc.b d4
	jsl.l randomd0s
	clc
	adc.l DumpInTargetY,x
	sec
	sbc.w pucky
	sta.b d1
	ldy.b d0
	jsl.l ApproxLength
	sta.b d2
	asl a
	asl a
	asl a
	asl a
	tax
	lda.w #$0078
	jsl.l DivX8U
	cmp.w #$0061
	bcc .1
	lda.w #$0060
.1:									; X = curobj, if position,x = 0 go to .3, if A >= $0010 go to .2, ...
	ldx.b curobj
	ldy.w position,x
	beq .3
	cmp.w #$0010
	bcs .2
	lda.w #$0010
.2:									; go to .4
	bra .4
.3:									; if A >= $0020 go to .4, A = $0020
	cmp.w #$0020
	bcs .4
	lda.w #$0020
.4:									; d3 = A, X = d0, call Mul16x8XS, r1 = d2, ...
	sta.b d3
	ldx.b d0
	jsl.l Mul16x8XS
	lda.b d2
	sta.b r1
	jsl.l Div32S
	lda.b r0
	xba
	and.w #$FF00
	sta.w puckvx
	lda.b d3
	ldx.b d1
	jsl.l Mul16x8XS
	lda.b d2
	sta.b r1
	jsl.l Div32S
	lda.b r0
	xba
	and.w #$FF00
	sta.w puckvy
	asl a
	asl a
	asl a
	asl a
	lda.w #$03C0
	sec
	sbc.b d4
	jsl.l randomd0A
	clc
	adc.w #$10E0
	sta.w puckvz
	jsl.l puckflip
	ldx.b curobj
	lda.w #$FFFF
	sta.w dumpinplayer
	sta.w puckc
	lda.w #$001E
	sta.w nopuck,x
	txa
	lsr a
	sta.w lastplayer
	jmp.w dopass_swing
