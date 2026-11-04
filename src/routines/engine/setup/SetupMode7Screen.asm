SetupMode7Screen:					; a mode 7 screen: fade out, the work buffer reset, BGMODE 7, M7SEL, the
									; mode 7 scroll and matrix registers, OBSEL, TM
	jsl.l FadeOutWait
	jsl.l WaitTransfers
	jsl.l ResetWorkBuf
	jsl.l ResetSprites
	pea.w $7E80
	plb
	sep #$20
	lda.b #$07
	sta.w BGMODE
	lda.b #$80
	sta.w M7SEL
	sta.l introM7SEL
	lda.b #$03
	sta.w OBSEL
	lda.b #$17
	sta.w TM
	stz.w $210D
	stz.w $210D
	lda.b #$FF
	sta.w $210E
	sta.w $210E
	stz.w M7B
	stz.w M7B
	stz.w M7C
	stz.w M7C
	lda.b #$80
	sta.w VMAIN
	lda.b #$09
	sta.w DMAP0
	lda.b #$18
	sta.w $4301
	lda.b #$00
	sta.w A1B0
	ldx.w #$1900
	stx.w A1T0L
	lda.b #$01
	sta.w MDMAEN
	rep #$20
	plb
	lda.w #$0100
	sta.w introM7Scale
	rtl
