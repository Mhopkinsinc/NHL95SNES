DrawLeaderRow:						; draws row a3 of the League Leaders list: a leader, his team and the stat
	lda.w #$000A
	sta.b $CF
	lda.b a3
	inc a
	jsr.w BinToBCD
	jsr.w BCDText
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
	lda.w #$0022
	sta.b $CF
	lda.b a3
	asl a
	tax
	lda.w ListBuf,x
	tax
	lda.w $0004,x
	cmp.w #$026A
	bcs .1
	jmp.w .12
.1:									; push X, call CreatedPlayerBits, call NextSaveBits3, tmp1 = $0000
	phx
	jsr.w CreatedPlayerBits
	jsr.w NextSaveBits3
	ldx.w #$0000
	stx.b tmp1
.2:									; push X, call NextSaveBits5, pull X, if A = $0000 go to .5, ...
	phx
	jsr.w NextSaveBits5
	plx
	cmp.w #$0000
	beq .5
	cmp.w #$001D
	bne .3
	lda.w #$003D
	bra .4
.3:									; A + $0040, A + tmp1
	clc
	adc.w #$0040
	adc.b tmp1
.4:									; mesarea,x = A, tmp1 = $0020, X + 1, if X is not $0008 go to .2, ...
	sta.w mesarea,x
	lda.w #$0020
	sta.b tmp1
	inx
	cpx.w #$0008
	bne .2
	bra .7
.5:									; push X
	phx
.loop:								; loop: if X = $0007 go to .6, push X, call NextSaveBits5, pull X, ...
	cpx.w #$0007
	beq .6
	phx
	jsr.w NextSaveBits5
	plx
	inx
	bra .loop
.6:									; pull X
	plx
.7:									; mesarea,x = $0020, tmp1 = 0, X + 1, push X
	lda.w #$0020
	sta.w mesarea,x
	stz.b tmp1
	inx
	phx
.8:									; push X, call NextSaveBits5, pull X, if A = $0000 go to .loop2, ...
	phx
	jsr.w NextSaveBits5
	plx
	cmp.w #$0000
	beq .loop2
	cmp.w #$001D
	bne .9
	lda.w #$003D
	bra .10
.9:									; A + $0040, A + tmp1
	clc
	adc.w #$0040
	adc.b tmp1
.10:								; mesarea,x = A, tmp1 = $0020, X + 1, A = X, ...
	sta.w mesarea,x
	lda.w #$0020
	sta.b tmp1
	inx
	txa
	sec
	sbc.b $01,s
	cmp.w #$000A
	bcc .8
	bra .11
.loop2:								; loop: A = X, A - $01,s, if A = $0009 go to .11, push X, ...
	txa
	sec
	sbc.b $01,s
	cmp.w #$0009
	beq .11
	phx
	jsr.w NextSaveBits5
	plx
	inx
	bra .loop2
.11:								; pull X, a0+2 = Y, X = mesarea, A = $000C, ...
	plx
	sty.b a0+2
	ldx.w #mesarea
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	bra .13
.12:								; push X, A * 2, X = A, A = PlayerList,x, ...
	phx
	asl a
	tax
	lda.l PlayerList,x
	adc.w #$0008
	and.w #$3FFF
	tax
	lda.w #$000C
	jsr.w UnpackFitName
.13:								; Y = a2+2, call PrintBoldLeftStr, pull X, push X, ...
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	plx
	phx
	lda.w #$0094
	sta.b $CF
	lda.w $000F,x
	jsr.w BCDDigits4
	ldy.b a2+2
	ldx.w #mesarea+2
	jsl.l PrintBoldLeftStr
	plx
	phx
	lda.w $000E,x
	and.w #$00FF
	cmp.w #$001A
	bcc .14
	ldx.w #$484C
	bra .15
.14:								; A * 2, X = A, A = $C30000,x, X = A, ...
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	jsl.l UnpackText
	ldx.b $16
	lda.b $0A
	beq .15
	inx
.15:								; call UnpackText, $CF = $00A8, Y = a2+2, call PrintBoldLeftStr, ...
	jsl.l UnpackText
	lda.w #$00A8
	sta.b $CF
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	lda.w #$00F0
	sta.b $D1
	lda.b d1
	asl a
	adc.b $01,s
	tax
	lda.w $0008,x
	jsr.w BCDText
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldRightStr
	plx
	rts
