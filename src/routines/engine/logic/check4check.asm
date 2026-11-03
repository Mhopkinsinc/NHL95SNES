check4check:						; called from other segments
	lda.w #$0014
	sec
	sbc.w checking,x
	sta.b d0
	lda.w OptPen
	beq .1
	asl.b d0
.1:									; A = d0, call randomd0A, if A < $0004 go to .2, A = d0, ...
	lda.b d0
	jsl.l randomd0A
	cmp.w #$0004
	bcc .2
	lda.b d0
	jsl.l randomd0A
	cmp.w #$0004
	bcs .rtl
.2:									; d2 = $0005, Y = $0000, if X >= $000C go to .loop, Y = $000C
	lda.w #$0005
	sta.b d2
	ldy.w #$0000
	cpx.w #$000C
	bcs .loop
	ldy.w #$000C
.loop:								; loop: a0 = Y, if position,y = 0 go to .4, ...
	sty.b a0
	lda.w position,y
	beq .4
	lda.w SPA,y
	cmp.w #SPAHold2&$FFFF
	bcc .3
	cmp.w #$2345
	bcc .5
.3:									; if pfalock,y = 0 go to .5
	lda.w pfalock,y
	beq .5
.4:									; Y = a0, Y + 1, Y + 1, d2 - 1, ...
	ldy.b a0
	iny
	iny
	dec.b d2
	bpl .loop
.rtl:								; return
	rtl
.5:									; A = Xpos,y, A - Xpos,x, d0 = A, if A - $FFDE < 0 go to .4, ...
	lda.w Xpos,y
	sec
	sbc.w Xpos,x
	sta.b d0
	cmp.w #$FFDE
	bmi .4
	cmp.w #$0022
	bpl .4
	lda.w Ypos,y
	sec
	sbc.w Ypos,x
	sta.b d1
	cmp.w #$FFDE
	bmi .4
	cmp.w #$0022
	bpl .4
	jsl.l vtoa
	lda.b d0
	cmp.w facedir,x
	bne .4
	lda.w Xpos,x
	cmp.w #$004A
	bpl .10
	cmp.w #$FFB6
	bmi .10
	lda.w pfgoal,x
	bne .9
	lda.w Ypos,x
	cmp.w #$005C
	bmi .10
	cmp.w #$010E
	bpl .10
.6:									; if SPA,y < SPAHold2&$FFFF go to .7, if SPA,y < $2345 go to .11
	lda.w SPA,y
	cmp.w #SPAHold2&$FFFF
	bcc .7
	cmp.w #$2345
	bcc .11
.7:									; A = seed+1, if the result = 0 go to .11
	lda.w seed+1
	and.w #$0007
	beq .11
.8:									; go to Acheck
	jml.l Acheck
.9:									; if Ypos,x - $FFA4 >= 0 go to .10, if Ypos,x - $FEF2 >= 0 go to .6
	lda.w Ypos,x
	cmp.w #$FFA4
	bpl .10
	cmp.w #$FEF2
	bpl .6
.10:								; A = seed+1, if the result is not 0 go to .11, go to .8
	lda.w seed+1
	and.w #$0007
	bne .11
	jmp.w .8
.11:								; go to burst
	jml.l burst
