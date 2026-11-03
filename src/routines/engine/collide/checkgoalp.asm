checkgoalp:							; from checkgoal
	lda.w pflags,x
	bit.w #$8000
	bne .rtl
	cpx.w #$0017
	bcc .1
.rtl:								; return
	rtl
.1:									; if a2 = $0018 go to .2, A = d3, A - wcradiusy, ...
	ldy.b a2
	cpy.w #$0018
	beq .2
	lda.b d3
	sec
	sbc.w wcradiusy
	cmp.w #$FF10
	bpl .rtl
	bra .3
.2:									; A = d3, A + wcradiusy, if A - $00F0 < 0 go to .rtl
	lda.b d3
	clc
	adc.w wcradiusy
	cmp.w #$00F0
	bmi .rtl
.3:									; A = d2, if $8000 bits clear go to .4, A xor $FFFF, A + 1
	lda.b d2
	bit.w #$8000
	beq .4
	eor.w #$FFFF
	inc a
.4:									; A - wcradiusx, if A - $0040 >= 0 go to .rtl, A = d3, push A, ...
	sec
	sbc.w wcradiusx
	cmp.w #$0040
	bpl .rtl
	lda.b d3
	pha
	sec
	sbc.w Ypos,y
	sta.b d3
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.b d2
	pha
	sec
	sbc.w Xpos,y
	sta.b d1
	sta.b r1
	tax
	jsl.l Mul8S
	sta.b r2
	ldx.b a3
	lsr a
	lsr a
	cmp.w #$0101
	bcs .5
	sta.b d2
	lda.b d3
	sta.b r1+2
	tax
	jsl.l Mul8S
	asl a
	sta.b r2+2
	ldx.b a3
	clc
	adc.b d2
	cmp.w #$0101
.5:									; if carry set go to .10, pull A, d2 = A, pull A, ...
	bcs .10
	pla
	sta.b d2
	pla
	sta.b d3
	jsr.w CheckDislodgeGoal
	pei ($8B)
	pei ($87)
	lda.b r1
	ldy.b r1+2
	jsl.l ApproxLength
	inc a
	sta.b d2
	lda.b d0
	xba
	and.w #$FF00
	tax
	lda.b d2
	jsl.l DivX8S
	cmp.w #$00FF
	bmi .6
	lda.w #$00FF
.6:									; if A - $FF01 >= 0 go to .7, A = $FF01
	cmp.w #$FF01
	bpl .7
	lda.w #$FF01
.7:									; d0 = A, A = d1, A and $FF00, X = A, ...
	sta.b d0
	lda.b d1
	xba
	and.w #$FF00
	tax
	lda.b d2
	jsl.l DivX8S
	cmp.w #$00FF
	bmi .8
	lda.w #$00FF
.8:									; if A - $FF01 >= 0 go to .9, A = $FF01
	cmp.w #$FF01
	bpl .9
	lda.w #$FF01
.9:									; d1 = A, X = a3, call wallcoll
	sta.b d1
	ldx.b a3
	jsl.l wallcoll
.10:								; pull A, d2 = A, pull A, d3 = A, ...
	pla
	sta.b d2
	pla
	sta.b d3
	rtl
