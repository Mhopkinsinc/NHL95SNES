SetupScrollUp:						; a frame of the setup list's scroll after SetupLineUp ($99 = 2): the band
									; scroll words move a line over 16 frames, then $99 = 0
	lda.w BG3ScrollHDMA+$6
	and.w #$00FF
	cmp.w #$0010
	bne .1
	lda.w BandScroll+$6
	dec a
	sta.w BandScroll+$8
	lda.w BandScroll+$4
	dec a
	sta.w BandScroll+$6
	lda.w BandScroll+$2
	dec a
	sta.w BandScroll+$4
	lda.w BandScroll
	dec a
	sta.w BandScroll+$2
	clc
	lda.w BandScroll+$10
	adc.w #$004F
	sta.w BandScroll
	sep #$20
	lda.b #$01
	sta.w BG3ScrollHDMA+$6
	lda.b #$10
	sta.w BG3ScrollHDMA+$F
	dec a
	sta.w BG3ScrollHDMA+$12
	rep #$20
	rts
.1:									; BandScroll - 1, BandScroll+$2 - 1, BandScroll+$4 - 1, ...
	dec.w BandScroll
	dec.w BandScroll+$2
	dec.w BandScroll+$4
	dec.w BandScroll+$6
	dec.w BandScroll+$8
	sep #$20
	inc a
	sta.w BG3ScrollHDMA+$6
	lda.w BG3ScrollHDMA+$12
	dec a
	bne .2
	lda.b #$0F
	sta.w BG3ScrollHDMA+$F
	rep #$20
	lda.w BandScroll+$8
	sta.w BandScroll+$10
	lda.w BandScroll+$6
	sta.w BandScroll+$8
	stz.b d6+2
	rts
.2:									; BG3ScrollHDMA+$12 = A, A 16-bit, return
	sta.w BG3ScrollHDMA+$12
	rep #$20
	rts
