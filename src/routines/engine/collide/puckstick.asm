puckstick:							; from puckbody and other segments
	ldy.b a2
	lda.w position,y
	bne .1
	lda.w gmode
	bit.w #$0010
	beq .1
.rtl:								; return
	rtl
.1:									; A = pflags,y, A and $FFFE, pflags,y = A, if puckc >= 0 go to .2, ...
	lda.w pflags,y
	and.w #$FFFE
	sta.w pflags,y
	ldy.w puckc
	bpl .2
	jmp.w .5
.2:									; A = pfteam,y, Y = a2, if pfteam,y = pfteam,y go to .rtl, ...
	lda.w pfteam,y
	ldy.b a2
	cmp.w pfteam,y
	beq .rtl
	lda.b d0
	cmp.w #$0025
	bcs .rtl
	lda.w position,y
	beq .3
	ldy.b a0
	lda.w position,y
	beq .rtl
	lda.w stickhand,y
	jsl.l makepde
	pei ($7F)
	lda.b a0
	ldy.b a2
	sty.b a0
	sta.b a2
	lda.w stickhand,y
	sta.b d0
	jsl.l makepde
	lda.b a0
	ldy.b a2
	sty.b a0
	sta.b a2
	pla
	sec
	sbc.b d0
	clc
	adc.w #$0024
	jsl.l randomd0A
	cmp.w #$0003
	bcs .rtl
.3:									; Y = a0, A = stickhand,y, call makepde, A = d0, ...
	ldy.b a0
	lda.w stickhand,y
	jsl.l makepde
	lda.b d0
	adc.w #$0014
	ldy.b a0
	sta.w nopuck,y
	lda.b a0
	ldy.b a2
	sty.b a0
	sta.b a2
	lda.w stickhand,y
	jsl.l makepde
	lda.b d0
	adc.w #$0014
	ldy.b a0
	sta.w nopuck,y
	lda.b a0
	ldy.b a2
	sty.b a0
	sta.b a2
	tya
	lsr a
	sta.w lastplayer
	lda.w #$000C
	trb.w sflags
.4:									; A = $000D, call StartSound, call a2touchpuck, go to deflect
	lda.w #$000D
	jsl.l StartSound
	jsl.l a2touchpuck
	jmp.w deflect
.rtl2:								; return
	rtl
.5:									; d2 = d0, A = puckvx, push X, X = A, ...
	lda.b d0
	sta.b d2
	lda.w puckvx
	phx
	tax
	jsl.l Mul16S
	lda.b r2+2
	sta.b d0+2
	lda.b r2
	sta.b d0
	lda.w puckvy
	tax
	jsl.l Mul16S
	plx
	lda.b r2
	clc
	adc.b d0
	sta.b d0
	lda.b r2+2
	adc.b d0+2
	sta.b d0+2
	stz.b d1
	lda.w sflags
	bit.w #$1000
	bne .6
	ldy.b a2
	lda.w stickhand,y
	phx
	ldx.w #$02BC
	jsl.l Mul16x8U
	lda.b r2
	sta.b d1
	plx
.6:									; A = d1, A + $2710, if position,x = 0 go to .7, ...
	lda.b d1
	clc
	adc.w #$2710
	ldy.w position,x
	beq .7
	cpx.w passReceiverPlayerNum
	bne .8
.7:									; A + $0BB8
	adc.w #$0BB8
.8:									; push X, X = A, call Mul16U, pull X, ...
	phx
	tax
	jsl.l Mul16U
	plx
	lda.b r2
	cmp.b d0
	lda.b r2+2
	sbc.b d0+2
	bcs .10
	lda.w position,x
	beq .9
	lda.b d2
	cmp.w #$0025
	bcc .9
	jmp.w .rtl2
.9:									; Y = a2, nopuck,y = $0008, go to .4
	ldy.b a2
	lda.w #$0008
	sta.w nopuck,y
	jmp.w .4
.10:								; go to puckglue
	jmp.w puckglue
