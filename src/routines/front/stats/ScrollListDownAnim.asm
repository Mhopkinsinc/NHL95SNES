ScrollListDownAnim:					; scrolls the list down a row over 8 frames by the BG3 scroll HDMA entries
									; (BG3ScrollHDMA+$6 on), then ScrollListDownDone
	inc.b a1+2
	ldx.w #$0008
.loop:								; loop: X - 1, if the result < 0 go to ScrollListDownDone, ...
	dex
	bmi ScrollListDownDone
	wai
	inc.w BG3ScrollHDMA+$7
	sep #$20
	dec.w BG3ScrollHDMA+$6
	bne .1
	lda.b tmp2
	asl a
	asl a
	asl a
	sta.w BG3ScrollHDMA+$6
	rep #$20
	lda.w #$FFFF
	sta.w BG3ScrollHDMA+$7
	stz.w BG3ScrollHDMA+$8
	bra .loop
.1:									; A = tmp2, A * 2, A * 2, A * 2, ...
	lda.b tmp2
	asl a
	asl a
	asl a
	sec
	sbc.w BG3ScrollHDMA+$6
	sta.w BG3ScrollHDMA+$9
	rep #$20
	lda.w BG3ScrollHDMA+$6
	and.w #$00FF
	eor.w #$FFFF
	sta.w BG3ScrollHDMA+$A
	lda.w #$0001
	sta.w BG3ScrollHDMA+$C
	lda.w #$FFFF
	sta.w BG3ScrollHDMA+$D
	stz.w BG3ScrollHDMA+$F
	bra .loop
