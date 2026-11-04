StartSeasonInput:					; the season in progress question each frame (screen state 13): up / down
									; Continue Old / Start New; Continue Old goes to the League Menu, Start
									; New clears the season and goes back to the setup screen
	lda.w repeatdelayframes
	beq .1
	rts
.1:									; A = padchangeany, if a $3000 bit set go to .5, ...
	lda.w padchangeany
	bit.w #$3000
	bne .5
	bit.w #$0800
	bne .2
	bit.w #$0400
	bne .4
	rts
.2:									; A = $0015, call SetRowPalette0, A = $0018, call SetRowPalette3, ...
	lda.w #$0015
	jsr.w SetRowPalette0
	lda.w #$0018
	jsr.w SetRowPalette3
	lda.w #$00B5
.3:									; X = a0, $08,x = A, call SendTextMap, return
	ldx.b a0
	sta.b $08,x
	jsl.l SendTextMap
	rts
.4:									; A = $0015, call SetRowPalette3, A = $0018, call SetRowPalette0, ...
	lda.w #$0015
	jsr.w SetRowPalette3
	lda.w #$0018
	jsr.w SetRowPalette0
	lda.w #$00CD
	bra .3
.5:									; X = a0, pull Y, if $08,x is not $00B5 go to .6, go to EnterLeagueMenu
	ldx.b a0
	ply
	lda.b $08,x
	cmp.w #$00B5
	bne .6
	jmp.w EnterLeagueMenu
.6:									; X = a0, $05,x = $0008, $08,x = $008C, call ClearSeasonWarning, ...
	ldx.b a0
	lda.w #$0008
	sta.b $05,x
	lda.w #$008C
	sta.b $08,x
	jsr.w ClearSeasonWarning
	lda.w #$0007
	sta.w OptPlayMode
	jsr.w InitSetupScroll
	lda.w #$C000
	sta.w DMAEnShadow
	jsr.w CreateSetupArrows
	lda.w #$5CC1
	jsl.l DrawOptionList
	jmp.w GameSetUp_reenter
