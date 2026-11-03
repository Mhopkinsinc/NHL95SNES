MapSetMode7ToVRAM:					; unpacks the mode 7 map and tiles to the low and high VRAM bytes, then
									; loads the palette
	bit.w #$0080
	bne .1
	brk #$00						; a trap: this header form is not handled
.1:									; A = $0005, Y = A, A + r1, r0 = A, ...
	clc
	lda.w #$0005
	tay
	adc.b r1
	sta.b r0
	lda.b r1+2
	adc.w #$0000
	sta.b r0+2
	lda.b [r1],y
	pha
	jsl.l AllocWorkBuf
	pha
	ldx.w #$007E
	jsr.w DecompressLZSS
	pla
	sta.b r0
	lda.w #$007E
	sta.b r0+2
	stz.b tmp2
	lda.w #$0000
	sta.l VMADDL
	sep #$20
	sta.l VMAIN
	ldy.w #$0003
	lda.b [r1],y
	sta.b tmp3
	stz.b $A6
	ldy.w #$0002
	lda.b [r1],y
	sta.b tmp0
	stz.b $A0
	ldy.w #$0000
.loop:								; loop: X = tmp0
	ldx.b tmp0
.loop2:								; loop: VMDATAL = [r0],y, Y + 1, X - 1, ...
	lda.b [r0],y
	sta.l VMDATAL
	iny
	dex
	bne .loop2
	rep #$21
	lda.b tmp2
	adc.w #$0080
	sta.b tmp2
	sta.l VMADDL
	sep #$20
	dec.b tmp3
	bne .loop
	rep #$20
	pla
	jsl.l FreeWorkBuf
	jsr.w NextMapSetChunk
	ldy.w #$0004
	lda.b [r1],y
	bit.w #$0001
	bne .2
	bit.w #$0080
	beq .2
	ldy.w #$0005
	lda.b [r1],y
	and.w #$00FF
	cmp.w #$0008
	bne .2
	ldy.w #$0006
	lda.b [r1],y
	and.w #$00FF
	cmp.w #$0008
	bne .2
	ldy.w #$0007
	lda.b [r1],y
	and.w #$00FF
	cmp.w #$0003
	beq .3
.2:									; continue
	brk #$00						; a trap: this header form is not handled
.3:									; A = $0008, Y = A, A + r1, r0 = A, ...
	clc
	lda.w #$0008
	tay
	adc.b r1
	sta.b r0
	lda.b r1+2
	adc.w #$0000
	sta.b r0+2
	lda.b [r1],y
	sta.b tmp3
	pha
	jsl.l AllocWorkBuf
	pha
	ldx.w #$007E
	stx.b r0+2
	jsr.w DecompressLZSS
	pla
	sta.b r0
	lda.w #$007E
	sta.b r0+2
	lda.w #$0000
	sta.l VMADDL
	sep #$20
	lda.b #$80
	sta.l VMAIN
	ldy.w #$0000
.loop3:								; loop: VMDATAH = [r0],y, Y + 1, if Y < tmp3 go to .loop3, A 16-bit, ...
	lda.b [r0],y
	sta.l VMDATAH
	iny
	cpy.b tmp3
	bcc .loop3
	rep #$20
	pla
	jsl.l FreeWorkBuf
	jsr.w NextMapSetChunk
	ldy.w #$0002
	lda.b [r1],y
	and.w #$00FF
	cmp.w #$0001
	bne .4
	ldy.w #$0003
	lda.b [r1],y
	cmp.w #$0100
	bne .4
	ldy.w #$0005
	lda.b [r1],y
	cmp.w #$0100
	beq .5
.4:									; continue
	brk #$00						; a trap: this header form is not handled
.5:									; A 8-bit, CGADD = $00, Y = $0007, X = $00FF
	sep #$20
	lda.b #$00
	sta.l CGADD
	ldy.w #$0007
	ldx.w #$00FF
.loop4:								; loop: CGDATA = [r1],y, Y + 1, CGDATA = [r1],y, Y + 1, ...
	lda.b [r1],y
	sta.l CGDATA
	iny
	lda.b [r1],y
	sta.l CGDATA
	iny
	dex
	bpl .loop4
	rep #$20
	rts
