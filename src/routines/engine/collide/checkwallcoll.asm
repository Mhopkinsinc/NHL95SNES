checkwallcoll:						; from checkcoll and other segments
	lda.w #$013E
	sec
	sbc.w wcradiusy
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0052
	sta.b d5
	lda.w #$009B
	sec
	sbc.w wcradiusx
	pha
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0052
	sta.b d4
	lda.b d3
	pha
	ldy.b d2
	phy
	dec a
	cmp.b d5
	bpl .1
	lda.b d2
	cmp.b d4
	bmi .3
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	cmp.b d2
	bmi .3
	lda.w #$001A
	sta.b a2
	jsl.l checkgoal
	jmp.w WallStraightEdges
.1:									; A = $0000, A - d5, d5 = A, if A - d3 >= 0 go to .2, ...
	lda.w #$0000
	sec
	sbc.b d5
	sta.b d5
	cmp.b d3
	bpl .2
	lda.b d2
	cmp.b d4
	bmi .3
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	cmp.b d2
	bmi .3
	lda.w #$0018
	sta.b a2
	jsl.l checkgoal
.2:									; go to WallStraightEdges
	jmp.w WallStraightEdges
.3:									; A = d2, A - d4, d2 = A, A xor $FFFF, ...
	lda.b d2
	sec
	sbc.b d4
	sta.b d2
	eor.w #$FFFF
	inc a
	sta.b d1
	bit.w #$8000
	beq WallCornerNormal
WallCornerAbsX:						; take the absolute horizontal corner displacement
	eor.w #$FFFF
	inc a
WallCornerNormal:					; calculate the corner collision normal and apply the wall response
	sta.b tmp4
	lda.b d3
	sec
	sbc.b d5
	sta.b d0
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:									; $B1 = A, if A < tmp4 go to .2, A = tmp4, A / 2, ...
	sta.b $B1
	cmp.b tmp4
	bcc .2
	lda.b tmp4
	lsr a
	lsr a
	adc.b $B1
	bra .3
.2:									; A / 2, A / 2, A + tmp4
	lsr a
	lsr a
	adc.b tmp4
.3:									; if A < $0053 go to WallStraightEdges, d3 = A, A = d0, A and $FF00, ...
	cmp.w #$0053
	bcc WallStraightEdges
	sta.b d3
	lda.b d0
	xba
	and.w #$FF00
	tax
	lda.b d3
	jsl.l DivX8S
	cmp.w #$FF01
	bpl .4
	lda.w #$FF01
.4:									; if A - $00FF < 0 go to .5, A = $00FF
	cmp.w #$00FF
	bmi .5
	lda.w #$00FF
.5:									; d0 = A, A = d1, A and $FF00, X = A, ...
	sta.b d0
	lda.b d1
	xba
	and.w #$FF00
	tax
	lda.b d3
	jsl.l DivX8S
	ldx.b a3
	cmp.w #$FF01
	bpl .6
	lda.w #$FF01
.6:									; if A - $00FF < 0 go to .7, A = $00FF
	cmp.w #$00FF
	bmi .7
	lda.w #$00FF
.7:									; d1 = A, call wallcollb
	sta.b d1
	jsl.l wallcollb
WallStraightEdges:					; restore collision bounds and check straight wall edges
	pla
	sta.b d2
	pla
	sta.b d3
	pla
	sta.b d4
	pla
	sta.b d5
	lda.w Wallcos,x
	ora.w Wallsin,x
	bne .rtl
	stz.b d1
	lda.w #$00FF
	sta.b d0
	lda.b d3
	dec a
	cmp.b d5
	bpl wallcollb
	lda.w #$FF01
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d5
	dec a
	cmp.b d3
	bpl wallcollb
	stz.b d0
	lda.w #$FF01
	sta.b d1
	lda.b d2
	dec a
	cmp.b d4
	bpl wallcollb
	lda.w #$00FF
	sta.b d1
	lda.w #$0000
	sec
	sbc.b d4
	dec a
	cmp.b d2
	bpl wallcollb
.rtl:								; return
	rtl
