PrintGoalieShotsPct:				; prints a goalie row's shots against and save percentage (100 - goals *
									; 100 / shots)
	lda.w tmpshots,x
	and.w #$00FF
	ldx.w #$8000
	jsr.w PrintStatCell
	lda.w #$00E0
	sta.b $D1
	ldx.b a0+2
	lda.w tmgoals,x
	and.w #$00FF
	ldx.w #$0064
	jsl.l Mul8U
	sta.b r2
	ldx.b a0+2
	lda.w tmpshots,x
	and.w #$00FF
	sta.b r1
	beq .1
	jsl.l Div16U
	bra .2
.1:									; A = $0064
	lda.w #$0064
.2:									; A xor $FFFF, A + $0064, X = $8000, go to PrintStatCell
	eor.w #$FFFF
	sec
	adc.w #$0064
	ldx.w #$8000
	jmp.w PrintStatCell
