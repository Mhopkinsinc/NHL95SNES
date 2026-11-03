DrawGlyphPixel1:					; draw the next glyph pixel at column one of the tile
	asl.b $16
	bcc .1
	lda.w $0000,y
	ora.w #$0040
	sta.w $0000,y
.1:									; $14 * 2, if carry clear go to .2, A = $0001,y, A or $0040, ...
	asl.b $14
	bcc .2
	lda.w $0001,y
	ora.w #$0040
	sta.w $0001,y
.2:									; X - 1, if the result = 0 go to DrawGlyphRowDoneJump
	dex
	beq DrawGlyphRowDoneJump
DrawGlyphPixel2:					; draw the next glyph pixel at column two of the tile
	asl.b $16
	bcc .1
	lda.w $0000,y
	ora.w #$0020
	sta.w $0000,y
.1:									; $14 * 2, if carry clear go to .2, A = $0001,y, A or $0020, ...
	asl.b $14
	bcc .2
	lda.w $0001,y
	ora.w #$0020
	sta.w $0001,y
.2:									; X - 1, if the result = 0 go to DrawGlyphRowDoneJump
	dex
	beq DrawGlyphRowDoneJump
DrawGlyphPixel3:					; draw the next glyph pixel at column three of the tile
	asl.b $16
	bcc .1
	lda.w $0000,y
	ora.w #$0010
	sta.w $0000,y
.1:									; $14 * 2, if carry clear go to .2, A = $0001,y, A or $0010, ...
	asl.b $14
	bcc .2
	lda.w $0001,y
	ora.w #$0010
	sta.w $0001,y
.2:									; X - 1, if the result = 0 go to DrawGlyphRowDoneJump
	dex
	beq DrawGlyphRowDoneJump
DrawGlyphPixel4:					; draw the next glyph pixel at column four of the tile
	asl.b $16
	bcc .1
	lda.w $0000,y
	ora.w #$0008
	sta.w $0000,y
.1:									; $14 * 2, if carry clear go to .2, A = $0001,y, A or $0008, ...
	asl.b $14
	bcc .2
	lda.w $0001,y
	ora.w #$0008
	sta.w $0001,y
.2:									; X - 1, if the result = 0 go to DrawGlyphNextRow
	dex
	beq DrawGlyphNextRow
DrawGlyphPixel5:					; draw the next glyph pixel at column five of the tile
	asl.b $16
	bcc .1
	lda.w $0000,y
	ora.w #$0004
	sta.w $0000,y
.1:									; $14 * 2, if carry clear go to .2, A = $0001,y, A or $0004, ...
	asl.b $14
	bcc .2
	lda.w $0001,y
	ora.w #$0004
	sta.w $0001,y
.2:									; X - 1, if the result = 0 go to DrawGlyphNextRow
	dex
	beq DrawGlyphNextRow
DrawGlyphPixel6:					; draw the next glyph pixel at column six of the tile
	asl.b $16
	bcc .1
	lda.w $0000,y
	ora.w #$0002
	sta.w $0000,y
.1:									; $14 * 2, if carry clear go to .2, A = $0001,y, A or $0002, ...
	asl.b $14
	bcc .2
	lda.w $0001,y
	ora.w #$0002
	sta.w $0001,y
.2:									; X - 1, if the result = 0 go to DrawGlyphNextRow
	dex
	beq DrawGlyphNextRow
DrawGlyphPixel7:					; draw the last pixel column and continue into the next tile when needed
	asl.b $16
	bcc .1
	lda.w $0000,y
	ora.w #$0001
	sta.w $0000,y
.1:									; $14 * 2, if carry clear go to .2, A = $0001,y, A or $0001, ...
	asl.b $14
	bcc .2
	lda.w $0001,y
	ora.w #$0001
	sta.w $0001,y
.2:									; X - 1, if the result = 0 go to DrawGlyphNextRow, A = Y, A + $0010, ...
	dex
	beq DrawGlyphNextRow
	tya
	clc
	adc.w #$0010
	tay
	jmp.w DrawGlyphPixel0
