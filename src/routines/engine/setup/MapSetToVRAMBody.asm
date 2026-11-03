MapSetToVRAMBody:					; the work of MapSetToVRAM: the map chunk (packed or not, 32 or 64 wide)
									; to VRAM at tmp0 with tmp1 added to each word, then the tile and colour
									; chunks
	sta.b r1
	stx.b r1+2
	sty.b tmp2
	sep #$20
	lda.b #$80
	sta.l VMAIN
	rep #$21
	lda.b r1
	adc.w #$0005
	sta.b r0
	lda.b r1+2
	adc.w #$0000
	sta.b r0+2
	pea.w $0000
	ldy.w #$0004
	lda.b [r1],y
	bit.w #$0001
	bne .1
	bit.w #$0002
	beq .2
.1:									; continue
	brk #$00						; a trap: this header form is not handled
.2:									; if a $0004 bit set go to .3, go to MapSetMode7ToVRAM
	bit.w #$0004
	bne .3
	jmp.w MapSetMode7ToVRAM
.3:									; if $0080 bits clear go to .4, pull X, Y = $0005, A = [r1],y, ...
	bit.w #$0080
	beq .4
	plx
	ldy.w #$0005
	lda.b [r1],y
	inc a
	inc a
	pha
	jsl.l AllocWorkBuf
	pha
	inc a
	inc a
	ldx.w #$007E
	jsr.w DecompressLZSS
	pla
	sta.b r0
	lda.w #$007E
	sta.b r0+2
.4:									; Y = $0005, A = [r1],y, A / 2, X = A, ...
	ldy.w #$0005
	lda.b [r1],y
	lsr a
	tax
	ldy.w #$0002
	lda.b [r1],y
	and.w #$00FF
	cmp.w #$0020
	beq .5
	cmp.w #$0040
	beq .6
	brk #$00						; a trap: this header form is not handled
.5:									; Y = $0002, VMADDL = tmp0
	ldy.w #$0002
	lda.b tmp0
	sta.l VMADDL
	clc
.loop:								; loop: A = [r0],y, A + tmp1, VMDATAL = A, Y + 1, ...
	lda.b [r0],y
	adc.b tmp1
	sta.l VMDATAL
	iny
	iny
	dex
	bne .loop
	bra .7
.6:									; Y = $0003, A = [r1],y, A and $00FF, tmp3 = A, ...
	ldy.w #$0003
	lda.b [r1],y
	and.w #$00FF
	sta.b tmp3
	ldy.w #$0002
	lda.b tmp0
.loop2:								; loop: VMADDL = A, X = $001F
	sta.l VMADDL
	ldx.w #$001F
	clc
.loop3:								; loop: A = [r0],y, A + tmp1, VMDATAL = A, Y + 1, ...
	lda.b [r0],y
	adc.b tmp1
	sta.l VMDATAL
	iny
	iny
	dex
	bpl .loop3
	lda.b tmp0
	adc.w #$0400
	sta.l VMADDL
	ldx.w #$001F
.loop4:								; loop: A = [r0],y, A + tmp1, VMDATAL = A, Y + 1, ...
	lda.b [r0],y
	adc.b tmp1
	sta.l VMDATAL
	iny
	iny
	dex
	bpl .loop4
	lda.b tmp0
	adc.w #$0020
	sta.b tmp0
	dec.b tmp3
	bne .loop2
.7:									; pull A, call FreeWorkBuf, call NextMapSetChunk, Y = $0004, ...
	pla
	jsl.l FreeWorkBuf
	jsr.w NextMapSetChunk
	ldy.w #$0004
	lda.b [r1],y
	bit.w #$0080
	beq .8
	ldy.w #$0005
	lda.b [r1],y
	and.w #$00FF
	sta.b tmp3
	ldy.w #$0006
	lda.b [r1],y
	and.w #$00FF
	cmp.b tmp3
	bne .8
	ldy.w #$0007
	lda.b [r1],y
	and.w #$00FF
	beq .9
.8:									; continue
	brk #$00						; a trap: this header form is not handled
.9:									; A = $0008, Y = A, A + r1, r0 = A, ...
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
	sta.b $0A
	lsr.b $0A
	pha
	jsl.l AllocWorkBuf
	pha
	ldx.w #$007E
	jsr.w DecompressLZSS
	pla
	sta.b r0
	lda.w #$007E
	sta.b r0+2
	lda.b tmp2
	sta.l VMADDL
	ldy.w #$0000
.loop5:								; loop: VMDATAL = [r0],y, Y + 1, Y + 1, if Y < tmp3 go to .loop5, ...
	lda.b [r0],y
	sta.l VMDATAL
	iny
	iny
	cpy.b tmp3
	bcc .loop5
	pla
	jsl.l FreeWorkBuf
	jsr.w NextMapSetChunk
	ldy.w #$0005
	lda.b [r1],y
	asl a
	tax
	ldy.w #$0003
	lda.b [r1],y
	tay
	lda.b tmp1
	and.w #$1C00
	lsr a
	lsr a
	xba
	sta.b tmp1
	lda.w #$0000
.loop6:								; loop: A + tmp1, Y - 1, if the result is not 0 go to .loop6, A 8-bit, ...
	adc.b tmp1
	dey
	bne .loop6
	sep #$20
	sta.l CGADD
	ldy.w #$0007
.loop7:								; loop: CGDATA = [r1],y, Y + 1, X - 1, ...
	lda.b [r1],y
	sta.l CGDATA
	iny
	dex
	bne .loop7
	rep #$31
	rts
