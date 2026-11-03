CheckPlayerContact:					; resolve player X checking player a2 from their animations and impact
	ldy.b a2
	lda.w SPA,y
	cmp.w #SPAHold&$FFFF
	beq CheckContactHold
	cmp.w #SPAhook&$FFFF
	beq CheckContactHold
	cmp.w #SPAsweepchk&$FFFF
	bne .1
	jmp.w Bcheck
.1:									; if SPA,x is not SPAburst&$FFFF go to CheckContactReturn, ...
									; ...
	lda.w SPA,x
	cmp.w #SPAburst&$FFFF
	bne CheckContactReturn
	lda.w gmclock
	beq .2
	lda.w #$0100
	sta.w impact,x
	sta.w impact,y
.2:									; A = Xpos,y, A - Xpos,x, d0 = A, A = Ypos,y, ...
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b d1
	jsl.l vtoa
	lda.b d0
	sec
	sbc.w facedir,x
	and.w #$0007
	asl a
	tay
	lda.w #CheckAnimByDir>>16
	sta.b a0+2
	lda.w #CheckAnimByDir
	sta.b a0
	sta.w pf2aip,x
	cpy.w #$0000
	bne .5
	lda.w Xpos,x
	cmp.w #$0050
	bpl .3
	cmp.w #$FFB0
	bmi .3
	lda.w Ypos,x
	cmp.w #$00FE
	bpl .3
	cmp.w #$FF02
	bpl .3
	lda.w seed
	and.w #$00F0
	beq .5
	bra .4
.3:									; A = seed, if the result = 0 go to .5
	lda.w seed
	and.w #$0030
	beq .5
.4:									; Y + 1, Y + 1, d0 = Y
	iny
	iny
	sty.b d0
.5:									; A = [a0],y, call SetSPAFromA, Y = a2, if position,y = 0 go to .rtl, ...
	lda.b [a0],y
	jsl.l SetSPAFromA
	ldy.b a2
	lda.w position,y
	beq .rtl
	lda.b d4
	sec
	sbc.w #$0020
	bmi .rtl
	lda.w #$0078
	sta.b d0
	lda.b d0
	sec
	sbc.w weight,x
	clc
	adc.w weight,y
	lsr a
	sec
	sbc.w impact,y
	beq .6
	bmi .6
	sta.b d0
	jsl.l randomd0
	lda.b d0
	sec
	sbc.w checking,x
	bmi .6
	jsl.l checkagr
	lda.b d0
	cmp.w #$0001
	bcs .rtl
	lda.w gmode
	bit.w #$0010
	bne .rtl
	lda.w seed+1
	and.w #$0002
	clc
	adc.w #$0018
	sta.b d0
	jmp.w AddPenalty
.rtl:								; return
	rtl
.6:									; call checkagr, if d0 >= $0001 go to .7, A = gmode, ...
	jsl.l checkagr
	lda.b d0
	cmp.w #$0001
	bcs .7
	lda.w gmode
	bit.w #$0010
	bne .7
	lda.w seed+1
	and.w #$0002
	clc
	adc.w #$001C
	sta.b d0
	jsl.l AddPenalty
.7:									; call PenShotChk, if zero go to .8, if BA_Sktr_SCnum >= 0 go to .8, ...
	jsl.l PenShotChk
	beq .8
	lda.w BA_Sktr_SCnum
	bpl .8
	ldy.b a2
	sty.w BA_Sktr_SCnum
	lda.w playerpad,y
	sta.w pspad
	lda.w #$0024
	sta.b d0
	jsl.l AddPenalty
.8:									; go to FallDown
	jmp.w FallDown
