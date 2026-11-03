ScrollGamesDown:					; Games Today step 2: ScrollGamesDownLine twice a frame
	jsr.w ScrollGamesDownLine
ScrollGamesDownLine:				; one line of the scroll to the game below: BG2 scroll + 1, the scroll
									; HDMA counts and values moved, the entering game's colours queued; step 0
									; again at the end
	inc.w BG2VScroll
	sep #$20
	lda.w BG3ScrollHDMA+$3
	dec a
	beq .7
	sta.w BG3ScrollHDMA+$3
	cmp.b #$28
	bne .2
	rep #$20
	lda.b d1+2
	lsr a
	ldx.w #$0020
	bcc .1
	ldx.w #$0040
.1:									; A = d3+2, A and $00FF, call QueueTeamPalette, A 8-bit, ...
	lda.b d3+2
	and.w #$00FF
	jsr.w QueueTeamPalette
	sep #$20
	bra .4
.2:									; if A is not $10 go to .4, A 16-bit, A = d1+2, A / 2, ...
	cmp.b #$10
	bne .4
	rep #$20
	lda.b d1+2
	lsr a
	ldx.w #$0030
	bcc .3
	ldx.w #$0050
.3:									; A = $8E, A and $00FF, call QueueTeamPalette, A 8-bit
	lda.b $8E
	and.w #$00FF
	jsr.w QueueTeamPalette
	sep #$20
.4:									; if $38 = BG3ScrollHDMA+$6 go to .5, BG3ScrollHDMA+$6 = A, go to .6
	lda.b #$38
	cmp.w BG3ScrollHDMA+$6
	beq .5
	sta.w BG3ScrollHDMA+$6
	bra .6
.5:									; BG3ScrollHDMA+$9 + 1
	inc.w BG3ScrollHDMA+$9
.6:									; A 16-bit, A = BandScroll+$10, A + 1, BandScroll+$4 = A, ...
	rep #$20
	lda.w BandScroll+$10
	inc a
	sta.w BandScroll+$4
	sta.w BandScroll+$10
	inc.w BandScroll
	inc.w BandScroll+$2
	rts
.7:									; BG3ScrollHDMA+$3 = $38, A - 1, BG3ScrollHDMA+$6 = A, ...
	lda.b #$38
	sta.w BG3ScrollHDMA+$3
	dec a
	sta.w BG3ScrollHDMA+$6
	lda.b #$01
	sta.w BG3ScrollHDMA+$9
	rep #$20
	sec
	lda.w BandScroll
	sbc.w #$00A7
	sta.w BandScroll+$10
	lda.w BandScroll+$2
	inc a
	sta.w BandScroll
	lda.w BandScroll+$4
	inc a
	sta.w BandScroll+$2
	sta.w BandScroll+$4
	stz.b d2+2
	rts
