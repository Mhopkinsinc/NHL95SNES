ScrollUpRowDrawn:					; ScrollListUp's new top row drawn: SendTextMap, then ScrollListUpAnim
	jsl.l SendTextMap
ScrollListUpAnim:					; scrolls the list up a row over 8 frames by the BG3 scroll HDMA entries
									; (BG3ScrollHDMA+$6 on)
	ldx.w #$0008
.loop:								; loop: X - 1, if the result < 0 go to .2, A 8-bit, A = tmp2, ...
	dex
	bmi .2
	wai
	sep #$20
	lda.b tmp2
	asl a
	asl a
	asl a
	cmp.w BG3ScrollHDMA+$6
	bne .1
	dec a
	sta.w BG3ScrollHDMA+$9
	lda.b #$01
	sta.w BG3ScrollHDMA+$6
	rep #$20
	lda.w BG3ScrollHDMA+$7
	dec a
	sta.w BG3ScrollHDMA+$A
	lda.b tmp2
	asl a
	asl a
	asl a
	dec a
	dec a
	sta.w BG3ScrollHDMA+$7
	lda.w #$0001
	sta.w BG3ScrollHDMA+$C
	lda.w #$FFFF
	sta.w BG3ScrollHDMA+$D
	stz.w BG3ScrollHDMA+$F
	bra .loop
.1:									; BG3ScrollHDMA+$6 + 1, BG3ScrollHDMA+$9 - 1, A 16-bit, ...
	inc.w BG3ScrollHDMA+$6
	dec.w BG3ScrollHDMA+$9
	rep #$20
	dec.w BG3ScrollHDMA+$7
	dec.w BG3ScrollHDMA+$A
	bra .loop
.2:									; padlast1 = 0, padchangeany = 0
	stz.w padlast1
	stz.w padchangeany
ScrollListUpReturn:					; the rts ScrollListUp leaves through when the list is at its top
	rts
