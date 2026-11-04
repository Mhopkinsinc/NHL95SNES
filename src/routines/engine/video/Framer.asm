Framer:								; draws a frame X tiles wide and Y high (its corners, edges and inside) to
									; the VRAM map at A, queued row by row
	sty.b tmp2
	stx.b tmp1
	sta.b tmp0
	txa
	dec a
	dec a
	asl a
	tax
	lda.w #$22FC
	sta.w ScratchBuf+$2,x
	lda.w #$22DE
.loop:								; loop: ScratchBuf,x = A, X - 1, X - 1, ...
	sta.w ScratchBuf,x
	dex
	dex
	bne .loop
	lda.w #$22FB
	sta.w ScratchBuf,x
	lda.b tmp1
	asl a
	tax
	lda.w #$22FD
	sta.w ScratchBuf,x
	lda.w #$22A0
	ldy.b tmp1
	dey
.loop2:								; loop: ScratchBuf+$2,x = A, X + 1, X + 1, Y - 1, ...
	sta.w ScratchBuf+$2,x
	inx
	inx
	dey
	bne .loop2
	lda.w #$22FE
	sta.w ScratchBuf,x
	lda.w #$22FF
	sta.w ScratchBuf+$2,x
	lda.w #$22E0
	ldy.b tmp1
	dey
.loop3:								; loop: ScratchBuf+$4,x = A, X + 1, X + 1, Y - 1, ...
	sta.w ScratchBuf+$4,x
	inx
	inx
	dey
	bne .loop3
	lda.w #$229F
	sta.w ScratchBuf+$2,x
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	lda.b tmp1
	asl a
	sta.b tmp1
	pha
	lda.b tmp0
	pha
	adc.w #$0020
	tay
	pea.w $007E
	lda.w #ScratchBuf
	pha
	adc.b tmp1
	tax
	tya
.loop4:								; loop: push A, A + $0020, push X, tmp2 - 1, ...
	pei ($A1)
	pha
	adc.w #$0020
	pea.w $007E
	phx
	dec.b tmp2
	bne .loop4
	pla
	adc.b tmp1
	pha
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	jml.l WaitTransfers
