DrawGlyphNextRow:					; advance to the next glyph row or finish the character
	ply
	iny
	iny
	plx
	inx
	inx
	cpx.b p0+2
	bcs .1
	jmp.w DrawGlyphRow
.1:									; A = $0E, A / 2, if carry clear go to .2, A = X, ...
	lda.b $0E
	lsr a
	bcc .2
	txa
	adc.w #$000F
	tax
	adc.w #$0010
	sta.b p0+2
	tya
	adc.w #$01F0
	tay
	lda.w #$8000
	tsb.b $0E
	bne .2
	jmp.w DrawGlyphRow
.2:									; A = p0
	lda.b p0
AdvanceTextCursor:					; advance the text pixel cursor by A and read the next character
	clc
	adc.b $0A
	sta.b $0A
	jmp.w DrawNextTextCharacter
