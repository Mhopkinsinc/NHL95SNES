SetupScrollDown:					; a frame of the setup list's scroll after SetupLineDown ($99 = 4): the
									; band scroll words move a line over 16 frames, then $99 = 0
	sep #$20
	lda.w BG3ScrollHDMA+$6
	dec a
	beq .3
	sta.w BG3ScrollHDMA+$6
	lda.b #$10
	cmp.w BG3ScrollHDMA+$F
	beq .1
	sta.w BG3ScrollHDMA+$F
	bra .2
.1:									; BG3ScrollHDMA+$12 + 1
	inc.w BG3ScrollHDMA+$12
.2:									; A 16-bit, A = BandScroll+$10, A + 1, BandScroll+$8 = A, ...
	rep #$20
	lda.w BandScroll+$10
	inc a
	sta.w BandScroll+$8
	sta.w BandScroll+$10
	inc.w BandScroll
	inc.w BandScroll+$2
	inc.w BandScroll+$4
	inc.w BandScroll+$6
	rts
.3:									; BG3ScrollHDMA+$6 = $10, A - 1, BG3ScrollHDMA+$F = A, ...
	lda.b #$10
	sta.w BG3ScrollHDMA+$6
	dec a
	sta.w BG3ScrollHDMA+$F
	lda.b #$01
	sta.w BG3ScrollHDMA+$12
	rep #$20
	sec
	lda.w BandScroll
	sbc.w #$004F
	sta.w BandScroll+$10
	lda.w BandScroll+$2
	inc a
	sta.w BandScroll
	lda.w BandScroll+$4
	inc a
	sta.w BandScroll+$2
	lda.w BandScroll+$6
	inc a
	sta.w BandScroll+$4
	lda.w BandScroll+$8
	inc a
	sta.w BandScroll+$6
	sta.w BandScroll+$8
	stz.b d6+2
	rts
