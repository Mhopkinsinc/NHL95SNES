ScrollGamesUp:						; Games Today step 1: ScrollGamesUpLine twice a frame
	jsr.w ScrollGamesUpLine
ScrollGamesUpLine:					; one line of the scroll to the game above: BG2 scroll - 1, the scroll
									; HDMA counts and values moved, the entering game's colours queued; step 0
									; again at the end
	dec.w BG2VScroll
	lda.w BG3ScrollHDMA+$3
	and.w #$00FF
	cmp.w #$0038
	bne .1
	lda.w BandScroll+$2
	dec a
	sta.w BandScroll+$4
	lda.w BandScroll
	dec a
	sta.w BandScroll+$2
	clc
	lda.w BandScroll+$10
	adc.w #$00A7
	sta.w BandScroll
	sep #$20
	lda.b #$01
	sta.w BG3ScrollHDMA+$3
	lda.b #$38
	sta.w BG3ScrollHDMA+$6
	dec a
	sta.w BG3ScrollHDMA+$9
	rep #$20
	rts
.1:									; BandScroll - 1, BandScroll+$2 - 1, BandScroll+$4 - 1, ...
	dec.w BandScroll
	dec.w BandScroll+$2
	dec.w BandScroll+$4
	cmp.w #$0028
	bne .3
	pha
	lda.b d1+2
	lsr a
	ldx.w #$0020
	bcc .2
	ldx.w #$0040
.2:									; A = d3+2, A and $00FF, call QueueTeamPalette, pull A
	lda.b d3+2
	and.w #$00FF
	jsr.w QueueTeamPalette
	pla
.3:									; if A is not $0010 go to .5, push A, A = d1+2, A / 2, ...
	cmp.w #$0010
	bne .5
	pha
	lda.b d1+2
	lsr a
	ldx.w #$0030
	bcc .4
	ldx.w #$0050
.4:									; A = $8E, A and $00FF, call QueueTeamPalette, pull A
	lda.b $8E
	and.w #$00FF
	jsr.w QueueTeamPalette
	pla
.5:									; A 8-bit, A + 1, BG3ScrollHDMA+$3 = A, A = BG3ScrollHDMA+$9, ...
	sep #$20
	inc a
	sta.w BG3ScrollHDMA+$3
	lda.w BG3ScrollHDMA+$9
	dec a
	bne .6
	lda.b #$37
	sta.w BG3ScrollHDMA+$6
	rep #$20
	lda.w BandScroll+$4
	sta.w BandScroll+$10
	lda.w BandScroll+$2
	sta.w BandScroll+$4
	stz.b d2+2
	rts
.6:									; BG3ScrollHDMA+$9 = A, A 16-bit, return
	sta.w BG3ScrollHDMA+$9
	rep #$20
	rts
