SeasonOptions:						; the League Menu (season mode): draws its page (Play Games, NHL
									; Standings, Games Today, League Leaders, Team Stats, Player Stats) and
									; makes SeasonOptionsInput the screen's handler
	lda.w #$8000
	sta.w DMAEnShadow
	ldy.w #$5000
	jsl.l QueueClearVRAM
	ldy.w #$5C00
	jsl.l QueueClearVRAM
	lda.w #$FFFF
	sta.w BG3VScroll
	jsl.l WaitTransfers
	lda.w #$0002
	sta.w OptPlayMode
	lda.l SeasonDay
	and.w #$00FF
	asl a
	tax
	lda.l SeasonDates,x
	bne .1
	jsl.l SetupPlayoffs
	inc.w OptPlayMode
.1:									; X = d7, call DeleteSprite, X = d7+2, call DeleteSprite, ...
	ldx.b d7
	jsl.l DeleteSprite
	ldx.b d7+2
	jsl.l DeleteSprite
	jsr.w DeleteArrowSprites
	jsl.l ResetWorkBuf
	jsl.l InitTextMap
	lda.w #LeagueMenuPage&$FFFF
	jsl.l PrintTextPage
	clc
	lda.b $D3
	adc.w #$0240
	tax
	ldy.w #$01DF
.loop:								; loop: A = $0000,x, A and $E3FF, A or $0C00, $0000,x = A, ...
	lda.w $0000,x
	and.w #$E3FF
	ora.w #$0C00
	sta.w $0000,x
	inx
	inx
	dey
	bpl .loop
	stz.b d6
	lda.w #$0006
	sta.b d6+2
	stz.w fadein
PlaceLeagueCursor:					; the cursor sprite (a0) to League Menu item d6: x $30, y d6 * 24 + $3E
	ldx.b a0
	lda.w #$0030
	sta.b $05,x
	lda.b d6
	asl a
	asl a
	asl a
	sta.b tmp0
	asl a
	adc.b tmp0
	adc.w #$003E
	sta.b $08,x
	rts
