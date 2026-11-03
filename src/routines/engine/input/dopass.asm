dopass:								; from passmode, chk4pass and other segments
	stz.w onetimerreq
	lda.w #$0004
	trb.w sflags
	lda.w #$FFFF
	sta.w puckc
	lda.w #$0010
	sta.w nopuck,x
	txa
	lsr a
	sta.w lastplayer
	lda.w #$0007
	sta.b d0
	lda.w position,x
	beq .1
	lda.w passacc,x
	sta.b d0
.1:									; A = d0, A * 2, A * 2, A + $00C8, ...
	lda.b d0
	asl a
	asl a
	adc.w #$00C8
	cmp.w #$0100
	bcc .2
	lda.w #$00FF
.2:									; passspeed = A, d4 = $FFFF, d3 = $0005, a1 = 0, ...
	sta.w passspeed
	lda.w #$FFFF
	sta.b d4
	lda.w #$0005
	sta.b d3
	stz.b a1
	cpx.w #$000C
	bcc .loop
	lda.w #$000C
	sta.b a1
.loop:								; loop: if X = a1 go to .5, Y = a1, if position,y < 0 go to .5, ...
	cpx.b a1
	beq .5
	ldy.b a1
	lda.w position,y
	bmi .5
	beq .5
	lda.w pflags,y
	bit.w #$1000
	bne .5
	lda.w puckdir,y
	sec
	sbc.w passdir
	sec
	sbc.w #$0004
	stz.b r0
	and.w #$0007
	beq .4
	cmp.w #$0001
	beq .3
	cmp.w #$0007
	bne .5
.3:									; r0 = $1000
	lda.w #$1000
	sta.b r0
.4:									; A = r0, A + puckdist,y, if carry set go to .5, if A >= d4 go to .5, ...
	lda.b r0
	clc
	adc.w puckdist,y
	bcs .5
	cmp.b d4
	bcs .5
	sta.b d4
	lda.b a1
	sta.b a0
.5:									; a1 + 1, a1 + 1, d3 - 1, if the result < 0 go to .6, ...
	inc.b a1
	inc.b a1
	dec.b d3
	bmi .6
	jmp.w .loop
.6:									; X = a3, if d4 < 0 go to .7, call passtoa0, A = $000B, ...
	ldx.b a3
	lda.b d4
	bmi .7
	jsl.l passtoa0
	lda.w #$000B
	jsl.l StartSound
	jmp.w dopass_swing
.7:									; A = passdir, A * 2, A * 2, A + $9C06, ...
	lda.w passdir
	asl a
	asl a
	adc.w #$9C06
	sta.b a0
	lda.w #$00C0
	sta.b a0+2
	lda.b [a0]
	cmp.w #$8000
	ror a
	tax
	lda.w #$0050
	jsl.l Mul8XS
	asl a
	sta.b r3
	ldx.b curobj
	lda.w Yvel,x
	cmp.w #$8000
	ror a
	clc
	adc.b r3
	sta.w puckvy
	dec.b a0
	dec.b a0
	lda.b [a0]
	cmp.w #$8000
	ror a
	tax
	lda.w #$0050
	jsl.l Mul8XS
	asl a
	sta.b r3
	ldx.b curobj
	lda.w Xvel,x
	cmp.w #$8000
	ror a
	clc
	adc.b r3
	sta.w puckvx
	jsl.l RandomWord
	and.w #$0FFF
	sta.w puckvz
dopass_swing:						; from dopass, LaunchDumpIn
	lda.w position,x
	bne .3
	lda.w pfgoal,x
	beq .1
	lda.w puckvy
	bmi .2
	bra .3
.1:									; if puckvy < 0 go to .3
	lda.w puckvy
	bmi .3
.2:									; A xor $FFFF, A + 1, puckvy = A
	eor.w #$FFFF
	inc a
	sta.w puckvy
.3:									; d0 = puckvx, d1 = puckvy, call vtoa, Y = SPAgswing&$FFFF, ...
	lda.w puckvx
	sta.b d0
	lda.w puckvy
	sta.b d1
	jsl.l vtoa
	ldy.w #SPAgswing&$FFFF
	lda.w position,x
	beq .4
	ldy.w #SPApassf&$FFFF
	jsl.l Findhittype
	beq .4
	ldy.w #SPApassb&$FFFF
.4:									; d1 = Y, call SetSPA, pfalock,x = $0001, ...
	sty.b d1
	jsl.l SetSPA
	lda.w #$0001
	sta.w pfalock,x
	lda.w position,x
	bne .rtl
	lda.w playerpad,x
	bmi .rtl
	stz.w Xvel,x
	stz.w Yvel,x
	sta.b d4
	jsl.l findpc
.rtl:								; return
	rtl
