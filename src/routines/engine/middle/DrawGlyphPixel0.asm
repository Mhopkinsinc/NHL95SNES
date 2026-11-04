DrawGlyphPixel0:					; draw the next glyph pixel at column zero of the tile
	asl.b $16
	bcc .1
	lda.w $0000,y
	ora.w #$0080
	sta.w $0000,y
.1:									; $14 * 2, if carry clear go to .2, A = $0001,y, A or $0080, ...
	asl.b $14
	bcc .2
	lda.w $0001,y
	ora.w #$0080
	sta.w $0001,y
.2:									; X - 1, if the result is not 0 go to DrawGlyphPixel1
	dex
	bne DrawGlyphPixel1
DrawGlyphRowDoneJump:				; continue after finishing the glyph row
	jmp.w DrawGlyphNextRow
