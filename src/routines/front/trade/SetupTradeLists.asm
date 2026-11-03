SetupTradeLists:					; the trade screen's two lists: the band HDMA tables (TM at ListBuf, BG3
									; vertical scroll at TradeScrollHDMA), the two cursor sprites, both lists
									; drawn, then PlaceTradeCursors
	sta.b d4
	stz.b $77
	stz.b $79
	stz.b a2
	jsl.l WaitTransfers
	ldx.w #$0060
	jsl.l SetupHDMA
	db $00,$2C,$4E,$3E,$7E,$00		; inline parameters
	ldx.w #$0013
	ldy.w #$0017
	lda.b a3
	dec a
	asl a
	asl a
	asl a
	sta.w ListBuf
	sty.w ListBuf+$1
	lda.w #$0008
	sta.w ListBuf+$2
	stx.w ListBuf+$3
	lda.b a1
	asl a
	asl a
	asl a
	sta.w ListBuf+$4
	sty.w ListBuf+$5
	lda.w #$0008
	sta.w ListBuf+$6
	stx.w ListBuf+$7
	lda.b a3+2
	clc
	sbc.b a3
	sbc.b a1
	dec a
	asl a
	asl a
	asl a
	sta.w ListBuf+$8
	sty.w ListBuf+$9
	lda.w #$0008
	sta.w ListBuf+$A
	stx.w ListBuf+$B
	lda.b a1+2
	asl a
	asl a
	asl a
	sta.w ListBuf+$C
	sty.w ListBuf+$D
	lda.w #$0008
	sta.w ListBuf+$E
	stx.w ListBuf+$F
	lda.w #$0001
	sta.w ListBuf+$10
	sty.w ListBuf+$11
	stz.w ListBuf+$12
	ldy.w #$FFFF
	lda.b a3
	dec a
	asl a
	asl a
	asl a
	sta.w TradeScrollHDMA
	sty.w TradeScrollHDMA+$1
	lda.b a1
	inc a
	inc a
	asl a
	asl a
	asl a
	sta.w TradeScrollHDMA+$3
	sty.w TradeScrollHDMA+$4
	lda.b a3+2
	clc
	sbc.b a3
	sbc.b a1
	dec a
	asl a
	asl a
	asl a
	sta.w TradeScrollHDMA+$6
	sty.w TradeScrollHDMA+$7
	lda.b a1+2
	inc a
	inc a
	asl a
	asl a
	asl a
	sta.w TradeScrollHDMA+$9
	sty.w TradeScrollHDMA+$A
	lda.w #$0001
	sta.w TradeScrollHDMA+$C
	sty.w TradeScrollHDMA+$D
	stz.w TradeScrollHDMA+$F
	ldx.w #$0050
	jsl.l SetupHDMA
	db $02,$12,$4E,$3F,$7E,$7E		; inline parameters
	lda.w #$E000
	sta.w DMAEnShadow
	lda.w #$0010
	sta.b $18
	lda.w #$001C
	jsl.l CreateSprite
	stx.b d3
	lda.w #$0001
	jsl.l SetSpriteAnim
	lda.w #$001C
	jsl.l CreateSprite
	stx.b d3+2
	lda.w #$0002
	jsl.l SetSpriteAnim
	lda.b $77
	sta.b d4+2
	lda.b a4
	sta.b d2
	ldy.b a3
	ldx.b $7B
	lda.b a1
	jsr.w DrawTradeListRows
	lda.b $79
	sta.b d4+2
	lda.b $75
	sta.b d2
	ldy.b a3+2
	ldx.b $7D
	lda.b a1+2
	jsr.w DrawTradeListRows
PlaceTradeCursors:					; each frame, places the two trade list cursor sprites (d3, $8D) at their
									; rows and hides the one past its list's end
	ldy.b a2
	ldx.b d3
	lda.w $006F,y
	asl a
	asl a
	asl a
	sec
	sbc.w #$0004
	sta.b $08,x
	lda.w $0077,y
	beq .1
	lda.b $22,x
	ora.w #$0001
	bra .2
.1:									; A = $22,x, A and $FFFE
	lda.b $22,x
	and.w #$FFFE
.2:									; $22,x = A, X = d3+2, A = $006F,y, A + $0067,y, ...
	sta.b $22,x
	ldx.b d3+2
	lda.w $006F,y
	clc
	adc.w $0067,y
	asl a
	asl a
	asl a
	adc.w #$0004
	sta.b $08,x
	lda.w $0077,y
	clc
	adc.w $0067,y
	cmp.w $007B,y
	bcs .3
	lda.b $22,x
	ora.w #$0001
	bra .4
.3:									; A = $22,x, A and $FFFE
	lda.b $22,x
	and.w #$FFFE
.4:									; $22,x = A, return
	sta.b $22,x
	rts
