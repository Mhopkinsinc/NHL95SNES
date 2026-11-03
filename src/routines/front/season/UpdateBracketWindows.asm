UpdateBracketWindows:				; updates the two moving bracket window shapes in alternating HDMA buffers
	lda.b $26
	lsr a
	lda.w #$A000
	bcc .1
	lda.w #$C000
.1:									; DMAEnShadow = A, ScratchBuf = $00FF, ScratchBuf+$380 = A, ...
	sta.w DMAEnShadow
	lda.w #$00FF
	sta.w ScratchBuf
	sta.w ScratchBuf+$380
	ldx.w #ScratchBuf
	ldy.w #ScratchBuf+$2
	lda.w #$037D
	bcs .2
	ldx.w #ScratchBuf+$380
	ldy.w #ScratchBuf+$382
.2:									; X = BracketWin1Phase, X + 1, X + 1, ...
	mvn $7E,$7E
	ldx.w BracketWin1Phase
	inx
	inx
	cpx.w #$009E
	bcc .3
	ldx.w #$0000
.3:									; BracketWin1Phase = X, Y = BracketCursorCell, ...
	stx.w BracketWin1Phase
	ldy.w BracketCursorCell
	jsr.w GetBracketWindowOffset
	lda.l BracketWin1CellX,x
	adc.b tmp0
	sec
	sbc.w BG2HScroll
	sta.b tmp0
	clc
	lda.b tmp1
	adc.l BracketWin1CellY,x
	sta.b tmp1
	ldx.w #BracketWin1X
	jsr.w ApproachBracketWindowTarget
	ldx.w BracketWin1X
	ldy.w BracketWin1Y
	jsr.w WriteBracketWindowShape
	ldx.w BracketWin2Phase
	inx
	inx
	cpx.w #$009E
	bcc .4
	ldx.w #$0000
.4:									; BracketWin2Phase = X, Y = BracketWin2Cell, ...
	stx.w BracketWin2Phase
	ldy.w BracketWin2Cell
	jsr.w GetBracketWindowOffset
	lda.l BracketWin2CellX,x
	adc.b tmp0
	sec
	sbc.w BG2HScroll
	sta.b tmp0
	clc
	lda.b tmp1
	adc.l BracketWin2CellY,x
	sta.b tmp1
	ldx.w #BracketWin2X
	jsr.w ApproachBracketWindowTarget
	ldx.w BracketWin2X
	ldy.w BracketWin2Y
	jmp.w WriteBracketWindowShape
