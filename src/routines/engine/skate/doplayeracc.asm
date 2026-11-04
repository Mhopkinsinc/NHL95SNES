doplayeracc:						; from skatetopuck and other segments
	lda.w position,x
	bne .1
	jmp.w goalieacc
.1:									; if SPA,x = SPAsweepchk&$FFFF go to .rtl, d1 = SPAglide&$FFFF, ...
	lda.w SPA,x
	cmp.w #SPAsweepchk&$FFFF
	beq .rtl
	lda.w #SPAglide&$FFFF
	sta.b d1
	lda.w pfrev,x
	beq .2
	lda.w #SPAglideback&$FFFF
	sta.b d1
.2:									; A = d0, A and $000F, d0 = A, if A < $0008 go to .4, ...
	lda.b d0
	and.w #$000F
	sta.b d0
	cmp.w #$0008
	bcc .4
	cmp.w #$0009
	bne .3
	lda.w Xvel,x
	ora.w Yvel,x
	beq .3
	jmp.w dostop
.3:									; if pf2aip,x is not 0 go to .rtl, go to SetSPA
	lda.w pf2aip,x
	bne .rtl
	jmp.w SetSPA
.rtl:								; return
	rtl
.4:									; A = d0, push A, d2 = A, if X is not puckc go to .5, ...
	pei ($83)
	lda.b d0
	pha
	sta.b d2
	cpx.w puckc
	bne .5
	jmp.w .11
.5:									; A = puckx, A - Xpos,x, d0 = A, d3 = Ypos,x, ...
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w Ypos,x
	sta.b d3
	lda.w puckvy+1
	and.w #$00FF
	cmp.w #$0080
	bcc .6
	ora.w #$FF00
.6:									; A + pucky, A - d3, d1 = A, if pfgoal,x is not 0 go to .7, ...
	clc
	adc.w pucky
	sec
	sbc.b d3
	sta.b d1
	lda.w pfgoal,x
	bne .7
	lda.w #$0000
	sec
	sbc.b d0
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d1
	sta.b d1
	lda.w #$0000
	sec
	sbc.b d3
	sta.b d3
	lda.b d2
	eor.w #$0004
	sta.b d2
.7:									; if pfrev,x is not 0 go to .8, if d3 >= 0 go to .11, ...
	lda.w pfrev,x
	bne .8
	lda.b d3
	bpl .11
	lda.b d2
	cmp.w #$0004
	bne .11
	jsl.l vtoa
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .11
	bra .9
.8:									; A = d2, A - $0003, A and $0007, if A >= $0003 go to .11, ...
	lda.b d2
	sec
	sbc.w #$0003
	and.w #$0007
	cmp.w #$0003
	bcs .11
	jsl.l vtoa
	inc a
	inc a
	and.w #$0007
	cmp.w #$0005
	bcs .11
.9:									; if pfrev,x is not 0 go to .12, d0 = Xvel,x, ...
	lda.w pfrev,x
	bne .12
	lda.w Xvel,x
	sta.b d0
	ora.w Yvel,x
	beq .10
	lda.w Yvel,x
	sta.b d1
	jsl.l vtoa
	sec
	sbc.b $01,s
	inc a
	and.w #$0007
	cmp.w #$0003
	bcs .12
.10:								; A + 1, pfrev,x = A, go to .12
	inc a
	sta.w pfrev,x
	bra .12
.11:								; pfrev,x = 0
	stz.w pfrev,x
.12:								; pull A, d0 = A, pull A, d1 = A, ...
	pla
	sta.b d0
	pla
	sta.b d1
	lda.w facedir,x
	sta.b d2
	lda.b d0
	sec
	sbc.b d2
	and.w #$0007
	asl a
	sta.b d0
	tax
	lda.l TurnSteps,x
	ldx.b a3
	cmp.w #$0000
	bne .13
	jmp.w noturn0
.13:								; A * 2, tmp0 = A, A = Xvel+1,x, A and $00FF, ...
	asl a
	sta.b tmp0
	lda.w Xvel+1,x
	and.w #$00FF
	asl a
	tax
	lda.l SignedSquareTable,x
	sta.b d4
	ldx.b a3
	lda.w Yvel+1,x
	and.w #$00FF
	asl a
	tax
	lda.b d4
	adc.l SignedSquareTable,x
	sta.b d3
	lda.w #$0300
	sec
	sbc.b d3
	sta.b d4
	sec
	sbc.w #$0180
	bpl .14
	lda.w #$0180
	sta.b d4
.14:								; A = tmp0, X = d4, call Mul16x8S, d4+2 = r2+2, ...
	lda.b tmp0
	ldx.b d4
	jsl.l Mul16x8S
	lda.b r2+2
	sta.b d4+2
	lda.b r2
	sta.b d4
	ldx.b a3
	lda.w pfrev,x
	beq .15
	lda.w #$0000
	sec
	sbc.b d4
	sta.b d4
	lda.w #$0000
	sbc.b d4+2
	sta.b d4+2
.15:								; A = facefrac,x, A + d4, facefrac,x = A, A = facedir,x, ...
	lda.w facefrac,x
	clc
	adc.b d4
	sta.w facefrac,x
	lda.w facedir,x
	adc.b d4+2
	and.w #$0007
	sta.w facedir,x
	sta.b d2
	lda.b d3
	cmp.w #$0015
	bcc .17
	lda.w #SPAskatewp&$FFFF
	sta.b d1
	lda.b tmp0
	bpl .16
	lda.w #SPAskatewp&$FFFF
	sta.b d1
.16:								; A = attribute,x, if $0800 bits clear go to .17, d1 = SPAskatewp&$FFFF
	lda.w attribute,x
	bit.w #$0800
	beq .17
	lda.w #SPAskatewp&$FFFF
	sta.b d1
.17:								; if pf2aip,x is not 0 go to .18, call SetSPA, pf2aip,x = $0001
	lda.w pf2aip,x
	bne .18
	jsl.l SetSPA
	lda.w #$0001
	sta.w pf2aip,x
.18:								; if d3 < $0003 go to .rtl2, go to revplayeracc
	lda.b d3
	cmp.w #$0003
	bcc .rtl2
	jmp.w revplayeracc
.rtl2:								; return
	rtl
