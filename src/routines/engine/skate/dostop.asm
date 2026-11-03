dostop:								; called from other segments
	lda.w Xvel,x
	cmp.w #$DFFF
	bmi .1
	cmp.w #$2001
	bpl .1
	lda.w Yvel,x
	cmp.w #$DFFF
	bmi .1
	cmp.w #$2001
	bmi stopna
.1:									; A = SPAglide&$FFFF, if pfrev,x is not 0 go to .3, ...
	lda.w #SPAglide&$FFFF
	ldy.w pfrev,x
	bne .3
	cpx.w puckc
	bne .2
	lda.w Xvel,x
	sta.b p0
	lda.w Yvel,x
	sta.b p0+2
	lda.w #$000F
	jsl.l StartSound
.2:									; A = SPAstop&$FFFF, pf2aip,x = 0
	lda.w #SPAstop&$FFFF
	stz.w pf2aip,x
.3:									; call SetSPAFromA
	jsl.l SetSPAFromA
stopna:								; from dostop and other segments
	lda.w position,x
	bne .1
	lda.w playerpad,x
	bmi .1
	cpx.w puckc
	beq .1
	lda.w Xvel,x
	cmp.w #$8000
	ror a
	sta.w Xvel,x
	lda.w Yvel,x
	cmp.w #$8000
	ror a
	sta.w Yvel,x
	rtl
.1:									; $16 = X, A = $0070, A + legstr,x, X = d7, ...
	stx.b $16
	lda.w #$0070
	clc
	adc.w legstr,x
	ldx.b d7
	dex
	beq .2
	asl a
.2:									; X = $16, r2 = A, if Xvel,x >= 0 go to .3, A + r2, ...
	ldx.b $16
	sta.b r2
	lda.w Xvel,x
	bpl .3
	clc
	adc.b r2
	sta.w Xvel,x
	bmi .5
	bra .4
.3:									; A - r2, Xvel,x = A, if plus go to .5
	sec
	sbc.b r2
	sta.w Xvel,x
	bpl .5
.4:									; Xvel,x = 0
	stz.w Xvel,x
.5:									; if Yvel,x >= 0 go to .6, A + r2, Yvel,x = A, if minus go to .rtl, ...
	lda.w Yvel,x
	bpl .6
	clc
	adc.b r2
	sta.w Yvel,x
	bmi .rtl
	bra .7
.6:									; A - r2, Yvel,x = A, if plus go to .rtl
	sec
	sbc.b r2
	sta.w Yvel,x
	bpl .rtl
.7:									; Yvel,x = 0
	stz.w Yvel,x
.rtl:								; return
	rtl
