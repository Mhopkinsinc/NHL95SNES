AnswerNameOk:						; start on Is the player name ok: No (d6 not 0) starts over
									; (CreatePlayer); Yes joins the names in mesarea and draws the position,
									; weight, number and hand page with its first values (state 3)
	lda.b d6
	beq .1
	pla
	jmp.w CreatePlayer
.1:									; call FadeOutWait, d6+2 + 1, A = CreateFirstName, A and $00FF, ...
	jsl.l FadeOutWait
	inc.b d6+2
	lda.w CreateFirstName
	and.w #$00FF
	dec a
	ldx.w #$4673
	ldy.w #mesarea
	mvn $7E,$7E
	lda.w #$0020
	sta.w $0000,y
	iny
	ldx.w #$467D
	lda.w CreateLastName
	and.w #$00FF
	mvn $7E,$7E
	lda.b $D3
	ldy.w #$0700
	jsl.l ClearRAM7E
	ldy.w #$5C00
	jsl.l QueueClearVRAM
	lda.w #PlayerInfoPage&$FFFF
	jsl.l PrintTextPage
	lda.w #$0010
	sta.b $CF
	ldx.w #mesarea
	ldy.w #$0002
	jsl.l PrintTitleStr
	jsl.l SendTextMap
	stz.b d0
	stz.b d1+2
	lda.w #$0032
	sta.b d1
	lda.w #$0008
	sta.b d0+2
	stz.b d6
	lda.w #$0078
	sta.b $CF
	jsr.w FieldPos
	jsr.w FieldWeight
	jsr.w FieldJersey
	jsr.w FieldHand
	lda.w #$0005
	sta.w fadein
	lda.w #$000B
	jsr.w SetRowPalette3
	lda.w #$000E
	jsr.w SetRowPalette3
	lda.w #$0011
	jmp.w SetRowPalette3
