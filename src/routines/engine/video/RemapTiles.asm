RemapTiles:							; no caller found (not traced)
	lda.w #$000E
	sta.b $A4
	sta.b $A4
.loop:								; loop: A, X / Y 16-bit, Y = $A4, tmp0 = [a0],y, A = Y, ...
	rep #$30
	ldy.b $A4
	lda.b [a0],y
	sta.b tmp0
	tya
	clc
	adc.w #$0010
	tay
	lda.b [a0],y
	sta.b tmp1
	sep #$30
	ldx.b $A4
	lda.b #$07
	sta.b tmp2
.loop2:								; loop: Y = $00, $A2 * 2, if carry clear go to .1, Y = $08
	ldy.b #$00
	asl.b $A2
	bcc .1
	ldy.b #$08
.1:									; tmp1 * 2, if carry clear go to .2, Y + 1, Y + 1, ...
	asl.b tmp1
	bcc .2
	iny
	iny
	iny
	iny
.2:									; $A0 * 2, if carry clear go to .3, Y + 1, Y + 1
	asl.b $A0
	bcc .3
	iny
	iny
.3:									; tmp0 * 2, if carry clear go to .4, Y + 1
	asl.b tmp0
	bcc .4
	iny
.4:									; A = [a1],y, A / 2, A / 2, A / 2, ...
	lda.b [a1],y
	lsr a
	rol.w RemapOut,x
	lsr a
	rol.w RemapOut+1,x
	lsr a
	rol.w RemapOut+16,x
	lsr a
	rol.w RemapOut+17,x
	dec.b tmp2
	bpl .loop2
	dec.b $A4
	dec.b $A4
	bpl .loop
	rep #$30
	ldx.w #$0000
.loop3:								; loop: VMDATAL = RemapOut,x, X + 1, X + 1, ...
	lda.w RemapOut,x
	sta.l VMDATAL
	inx
	inx
	cpx.w #$0020
	bne .loop3
	lda.b a0
	clc
	adc.w #$0020
	sta.b a0
	dec.b d0
	bne RemapTiles
	rtl
