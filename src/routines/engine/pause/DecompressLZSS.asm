DecompressLZSS:						; LZSS (4 KB ring) from [$2C] to the WRAM port at X:A; a count word first
	sta.l WMADDL
	sep #$20
	txa
	and.b #$01
	sta.l WMADDH
	rep #$20
DecompressLZSSHere:					; DecompressLZSS's decoder without setting the WRAM address: the stream at
									; [$2C] continues at the current WMADD
	ldx.w #$01FE
.loop:								; loop: ScratchBuf,x = 0, ScratchBuf+$200,x = 0, ...
	stz.w ScratchBuf,x
	stz.w ScratchBuf+$200,x
	stz.w ScratchBuf+$400,x
	stz.w ScratchBuf+$600,x
	stz.w ListBuf,x
	stz.w $404E,x
	stz.w $4266,x
	stz.w $4466,x
	dex
	dex
	bpl .loop
	lda.b [r0]
	sta.b p1
	lda.b r0
	clc
	adc.w #$0002
	bcc .1
	inc.b r0+2
.1:									; r0 = A, $42 = 0, Y = $0FEE
	sta.b r0
	stz.b $42
	ldy.w #$0FEE
.loop2:								; loop: $42 / 2, A = $42, if the result is not 0 go to .3, A = [r0], ...
	lsr.b $42
	lda.b $42
	and.w #$0100
	bne .3
	lda.b [r0]
	inc.b r0
	bne .2
	inc.b r0+2
.2:									; A or $FF00, $42 = A
	ora.w #$FF00
	sta.b $42
.3:									; A = $42, if the result = 0 go to .5, A = [r0], r0 + 1, ...
	lda.b $42
	and.w #$0001
	beq .5
	lda.b [r0]
	inc.b r0
	bne .4
	inc.b r0+2
.4:									; A 8-bit, WMDATA = A, ScratchBuf,y = A, A 16-bit, ...
	sep #$20
	sta.l WMDATA
	sta.w ScratchBuf,y
	rep #$20
	iny
	tya
	and.w #$0FFF
	tay
	dec.b p1
	bne .loop2
	bra .rts
.5:									; A = [r0], A and $00FF, r0 + 1, if the result is not 0 go to .6, ...
	lda.b [r0]
	and.w #$00FF
	inc.b r0
	bne .6
	inc.b r0+2
.6:									; p1+2 = A, A = [r0], r0 + 1, if the result is not 0 go to .7, ...
	sta.b p1+2
	lda.b [r0]
	inc.b r0
	bne .7
	inc.b r0+2
.7:									; X = A, A and $00F0, A * 2, A * 2, ...
	tax
	and.w #$00F0
	asl a
	asl a
	asl a
	asl a
	tsb.b p1+2
	txa
	and.w #$000F
	adc.w #$0003
	sta.b r3
.loop3:								; loop: A = p1+2, A and $0FFF, X = A, A 8-bit, ...
	lda.b p1+2
	and.w #$0FFF
	tax
	sep #$20
	lda.w ScratchBuf,x
	sta.l WMDATA
	sta.w ScratchBuf,y
	rep #$20
	iny
	tya
	and.w #$0FFF
	tay
	dec.b p1
	beq .rts
	inc.b p1+2
	dec.b r3
	bne .loop3
	jmp.w .loop2
.rts:								; return
	rts
