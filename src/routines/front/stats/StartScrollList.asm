StartScrollList:					; starts a scrolling list: X rows shown from text row Y, each row drawn by
									; the routine A, a1 = the last row; the first rows drawn
	sta.b $75
	stx.b a3+2
	sty.b a4
	stz.b a1+2
	jsl.l WaitTransfers
	ldx.w #$0060
	jsl.l SetupHDMA
	db $00,$2C,$9D,$46,$7E,$00		; inline parameters
	ldx.w #$0000
	ldy.w #$0017
	lda.b a4
	dec a
	asl a
	asl a
	asl a
	cmp.w #$0080
	bcc .1
	sbc.w #$007F
	ldx.w #$007F
	stx.w BG3ScrollHDMA+$11
	sty.w BG3ScrollHDMA+$12
	ldx.w #$0002
.1:									; BG3ScrollHDMA+$11,x = A, A = Y, BG3ScrollHDMA+$12,x = A, ...
	sta.w BG3ScrollHDMA+$11,x
	tya
	sta.w BG3ScrollHDMA+$12,x
	lda.w #$0008
	sta.w BG3ScrollHDMA+$13,x
	lda.w #$0013
	sta.w BG3ScrollHDMA+$14,x
	lda.b a3+2
	asl a
	asl a
	asl a
	sta.w BG3ScrollHDMA+$15,x
	tya
	sta.w BG3ScrollHDMA+$16,x
	lda.w #$0008
	sta.w BG3ScrollHDMA+$17,x
	lda.w #$0013
	sta.w BG3ScrollHDMA+$18,x
	lda.w #$0001
	sta.w BG3ScrollHDMA+$19,x
	tya
	sta.w BG3ScrollHDMA+$1A,x
	ldx.w #$FFFF
	lda.b a4
	dec a
	asl a
	asl a
	asl a
	cmp.w #$0080
	bcc .2
	sbc.w #$007F
	sta.w BG3ScrollHDMA+$3
	stx.w BG3ScrollHDMA+$4
	lda.w #$007F
	sta.w BG3ScrollHDMA
	stx.w BG3ScrollHDMA+$1
	ldx.w #$0050
	jsl.l SetupHDMA
	db $02,$12,$8C,$46,$7E,$7E		; inline parameters
	bra .3
.2:									; BG3ScrollHDMA+$3 = A, BG3ScrollHDMA+$4 = X, X = $0050, call SetupHDMA
	sta.w BG3ScrollHDMA+$3
	stx.w BG3ScrollHDMA+$4
	ldx.w #$0050
	jsl.l SetupHDMA
	db $02,$12,$8F,$46,$7E,$7E		; inline parameters
.3:									; X = $FFFF, A = a3+2, A + 1, A + 1, ...
	ldx.w #$FFFF
	lda.b a3+2
	inc a
	inc a
	asl a
	asl a
	asl a
	sta.w BG3ScrollHDMA+$6
	stx.w BG3ScrollHDMA+$7
	stz.w BG3ScrollHDMA+$9
	lda.w #$E000
	sta.w DMAEnShadow
	lda.w #$0010
	sta.b $18
	lda.b a4
	asl a
	asl a
	asl a
	sec
	sbc.w #$0004
	sta.b $1A
	lda.w #$001C
	jsl.l CreateSprite
	stx.b $77
	lda.w #$0001
	jsl.l SetSpriteAnim
	lda.b a4
	clc
	adc.b a3+2
	asl a
	asl a
	asl a
	adc.w #$0004
	sta.b $1A
	lda.w #$001C
	jsl.l CreateSprite
	stx.b $79
	lda.w #$0002
	jsl.l SetSpriteAnim
	stz.b a3
	lda.b a4
	sta.b a2+2
StartScrollRowNext:					; StartScrollList's row loop: text row $6D cleared, then the row routine
									; at $75 (returning to StartScrollRowDrawn)
	jsr.w ClearTextRow
	pea.w StartScrollRowDrawn-1
	jmp ($0075)
