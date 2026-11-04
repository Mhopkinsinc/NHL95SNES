DrawFreeAgentRow:					; draws row a3 of the Hire Free Agents list: a free agent, his position
									; and rating
	ldx.b a3
	stx.b a0+2
	lda.w ScratchBuf,x
	bit.w #$0040
	beq .1
	ldy.w #$2400
	bra .2
.1:									; if $0080 bits clear go to .3, Y = $2C00
	bit.w #$0080
	beq .3
	ldy.w #$2C00
.2:									; $D5 = Y
	sty.b $D5
.3:									; A and $000F, A * 2, X = A, A = PositionGroupNames,x, ...
	and.w #$000F
	asl a
	tax
	lda.l PositionGroupNames,x
	tax
	lda.w #$008C
	sta.b $CF
	lda.w #$00C8
	sta.b $D1
	ldy.b a2+2
	jsl.l PrintBoldCentred
	jsr.w FindFreeAgent
	cmp.w #$026A
	bcs .4
	asl a
	adc.w #$0038
	tax
	lda.l $C30000,x
	and.w #$3FFF
	pha
	tax
	lda.w #$0010
	sta.b $CF
	lda.l $C30000,x
	and.w #$00FF
	tax
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
	lda.b $01,s
	clc
	adc.w #$0008
	tax
	lda.w #$0024
	sta.b $CF
	jsl.l UnpackText
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	plx
	ldy.w #$0000
.loop:								; loop: mesarea,y = $C30000,x, X + 1, X + 1, Y + 1, ...
	lda.l $C30000,x
	sta.w mesarea,y
	inx
	inx
	iny
	iny
	cpy.w #$0008
	bne .loop
	jmp.w .15
.4:									; call CreatedPlayerBits, call NextSaveBits3, tmp3 = $0000
	jsr.w CreatedPlayerBits
	jsr.w NextSaveBits3
	ldx.w #$0000
	stx.b tmp3
.5:									; push X, call NextSaveBits5, pull X, if A = $0000 go to .8, ...
	phx
	jsr.w NextSaveBits5
	plx
	cmp.w #$0000
	beq .8
	cmp.w #$001D
	bne .6
	lda.w #$003D
	bra .7
.6:									; A + $0040, A + tmp3
	clc
	adc.w #$0040
	adc.b tmp3
.7:									; mesarea,x = A, tmp3 = $0020, X + 1, if X is not $0008 go to .5, ...
	sta.w mesarea,x
	lda.w #$0020
	sta.b tmp3
	inx
	cpx.w #$0008
	bne .5
	bra .10
.8:									; push X
	phx
.loop2:								; loop: if X = $0007 go to .9, push X, call NextSaveBits5, pull X, ...
	cpx.w #$0007
	beq .9
	phx
	jsr.w NextSaveBits5
	plx
	inx
	bra .loop2
.9:									; pull X
	plx
.10:								; mesarea,x = $0020, tmp3 = 0, X + 1, push X
	lda.w #$0020
	sta.w mesarea,x
	stz.b tmp3
	inx
	phx
.11:								; push X, call NextSaveBits5, pull X, if A = $0000 go to .loop3, ...
	phx
	jsr.w NextSaveBits5
	plx
	cmp.w #$0000
	beq .loop3
	cmp.w #$001D
	bne .12
	lda.w #$003D
	bra .13
.12:								; A + $0040, A + tmp3
	clc
	adc.w #$0040
	adc.b tmp3
.13:								; mesarea,x = A, tmp3 = $0020, X + 1, A = X, ...
	sta.w mesarea,x
	lda.w #$0020
	sta.b tmp3
	inx
	txa
	sec
	sbc.b $01,s
	cmp.w #$000A
	bcc .11
	bra .14
.loop3:								; loop: A = X, A - $01,s, if A = $0009 go to .14, push X, ...
	txa
	sec
	sbc.b $01,s
	cmp.w #$0009
	beq .14
	phx
	jsr.w NextSaveBits5
	plx
	inx
	bra .loop3
.14:								; pull X, a0+2 = Y, $CF = $0024, X = mesarea, ...
	plx
	sty.b a0+2
	lda.w #$0024
	sta.b $CF
	ldx.w #mesarea
	lda.w #$000C
	jsl.l FitNameToWorkBuf
	ldy.b a2+2
	jsl.l PrintBoldLeftStr
	ldy.b a0+2
	jsr.w NextSaveBits7
	sty.b a0+2
	tax
	lda.l BCDTable,x
	and.w #$00FF
	jsr.w BCDText
	lda.w #$0010
	sta.b $CF
	ldy.b a2+2
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
	ldy.b a0+2
	ldx.w #$0001
.loop4:								; loop: push X, call NextSaveBits8, pull X, A 8-bit, ...
	phx
	jsr.w NextSaveBits8
	plx
	sep #$20
	sta.w mesarea,x
	rep #$20
	inx
	cpx.w #$0008
	bne .loop4
.15:								; Y = $0000, X = a3, A = ScratchBuf,x, ...
	ldy.w #$0000
	ldx.b a3
	lda.w ScratchBuf,x
	and.w #$000F
	bne .16
	ldy.w #$0010
.16:								; RatingMode = Y, call RecordOverall, call BinToBCD, call BCDText, ...
	sty.w RatingMode
	jsr.w RecordOverall
	jsr.w BinToBCD
	jsr.w BCDText
	lda.w #$00C8
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	ldx.w #mesarea
	ldy.b a2+2
	jsl.l PrintBoldCentredStr
	lda.w #$2000
	sta.b $D5
	rts
