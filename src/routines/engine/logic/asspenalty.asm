asspenalty:							; called from other segments
	lda.w pflags,x
	bit.w #$0002
	bne .1
	jmp.w .2
.1:									; call ReassignPenaltyPads, A = pflags,x, A and $FFF9, A or $1000, ...
	jsl.l ReassignPenaltyPads
	lda.w pflags,x
	and.w #$FFF9
	ora.w #$1000
	sta.w pflags,x
	stz.b d4
	jsl.l setpads
	stz.w temp2,x
	lda.w #$0008
	sta.w temp2b,x
	jsl.l PenBoxSpot
	lda.b r2
	sta.b d1
	sta.w temp4,x
	lda.w #$009B
	sta.w temp3,x
	stz.w temp1,x
	lda.w pflags,x
	ora.w #$8000
	sta.w pflags,x
	stz.w Wallcos,x
	stz.w Wallsin,x
	lda.w #$0384
	sta.w temp5,x
.2:									; A = temp5,x, A - timestep, temp5,x = A, if plus go to .4, ...
	lda.w temp5,x
	sec
	sbc.w timestep
	sta.w temp5,x
	bpl .4
	jmp.w .8
.rtl:								; return
	rtl
.3:									; d0 = temp3,x, d1 = temp4,x, a0+2 = rtss>>16, a0 = rtss&$FFFF, ...
	lda.w temp3,x
	sta.b d0
	lda.w temp4,x
	sta.b d1
	lda.w #rtss>>16
	sta.b a0+2
	lda.w #rtss&$FFFF
	sta.b a0
	jml.l skateto
.4:									; A = Ypos,x, A - temp4,x, if A - $FFF3 < 0 go to .3, ...
	lda.w Ypos,x
	sec
	sbc.w temp4,x
	cmp.w #$FFF3
	bmi .3
	cmp.w #$000D
	bpl .3
	lda.w Xpos,x
	sec
	sbc.w temp3,x
	sta.b d0
	sec
	sbc.w #$FFE8
	bmi .3
	lda.w temp1,x
	sec
	sbc.b d7
	sta.w temp1,x
	bpl .rtl
	adc.w #$0008
	sta.w temp1,x
	cpx.w puckc
	bne .5
	lda.w #$FFFF
	sta.w puckc
	lda.w #$003C
	sta.w nopuck,x
.5:									; pfnc,x = SPAglide&$FFFF, call SetSPAFromA, d2 = $0006, ...
	lda.w #SPAglide&$FFFF
	sta.w pfnc,x
	jsl.l SetSPAFromA
	lda.w #$0006
	sta.b d2
	lda.w handed,x
	beq .6
	lda.w #$0002
	sta.b d2
.6:									; if facedir,x = d2 go to .7, A + 1, A and $0007, facedir,x = A
	lda.w facedir,x
	cmp.b d2
	beq .7
	inc a
	and.w #$0007
	sta.w facedir,x
.7:									; Yvel,x = 0, Xvel,x = $1000, A = d0, A - $FFF8, ...
	stz.w Yvel,x
	lda.w #$1000
	sta.w Xvel,x
	lda.b d0
	sec
	sbc.w #$FFF8
	bmi PenaltyPadReturn
	stz.w Xvel,x
	lda.w facedir,x
	cmp.b d2
	bne PenaltyPadReturn
.8:									; Ypos,x = temp4,x, Xpos,x = $009B, A = attribute,x, A and $F7FF, ...
	lda.w temp4,x
	sta.w Ypos,x
	lda.w #$009B
	sta.w Xpos,x
	lda.w attribute,x
	and.w #$F7FF
	sta.w attribute,x
	lda.w #$0002
	sta.w facedir,x
	sta.w pfalock,x
	lda.w #SPAwallin&$FFFF
	jsl.l SetSPAFromA
	lda.w pflags,x
	and.w #$BFFF
	sta.w pflags,x
	lda.w #$000E
	sta.b d0
	jml.l assreplace
