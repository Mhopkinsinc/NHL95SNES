InitTextMap:						; a new text map: $800 bytes cleared from the work buffer, the text
									; palettes (TextPalettes) to CGRAM, the margins 0 / $100 and the space
									; width 9
	ldy.w #$0004
	lda.w #$0800
	jsl.l AllocClearWorkBuf
	sta.b $D3
	jsl.l MarkWorkBuf
	lda.w #$2000
	sta.b $D5
	tya
	beq .1
	dec.b QueueBusy
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	tya
	asl a
	asl a
	asl a
	pha
	pea.w $0000
	pea.w TextPalettes>>16
	pea.w TextPalettes&$FFFF
	lda.b CGRAMQueueSP
	tsx
	tcs
	stx.b CGRAMQueueSP
	stz.b QueueBusy
.1:									; $CF = 0, $D1 = $0100, TextSpaceWidth = $0009, TextColLow = $FFFF, ...
	stz.b $CF
	lda.w #$0100
	sta.b $D1
	lda.w #$0009
	sta.w TextSpaceWidth
	lda.w #$FFFF
	sta.w TextColLow
	stz.w TextColHigh
	rtl
