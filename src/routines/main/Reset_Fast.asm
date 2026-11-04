Reset_Fast:							; the rest of the reset: CPU and PPU registers, RAM, the hooks, ...
	lda.w #$0000
	sta.l MDMAEN
	lda.w #$1FFF
	tcs
	lda.w #$2100
	tcd
	sep #$30
	lda.b #$80
	pha
	plb
	stz.w NMITIMEN
	stz.w HTIMEL
	stz.w $4208
	stz.w VTIMEL
	stz.w VTIMEH
	stz.w MEMSEL
	sta.b INIDISP&$FF
	sta.w brightness
	stz.b TM&$FF
	stz.b TS&$FF
	stz.b SETINI&$FF
	lda.b #$01
	sta.b BGMODE&$FF
	stz.b MOSAIC&$FF
	ldx.b #$03
	stx.b OBSEL&$FF
	sta.b VMAIN&$FF
	stz.b CGWSEL&$FF
	stz.b CGADSUB&$FF
	stz.b COLDATA&$FF
	stz.b W12SEL&$FF
	stz.b W34SEL&$FF
	stz.b WOBJSEL&$FF
	ldx.b #$FF
	stx.b WH0&$FF
	stz.b WH1&$FF
	stx.b WH2&$FF
	stz.b WH3&$FF
	stz.b OAMADDL&$FF
	stz.b OAMADDH&$FF
	stz.b M7A&$FF
	stz.b M7A&$FF
	stz.b M7B&$FF
	stz.b OAMDATA&$FF
	stz.b BGMODE&$FF
	stz.b MOSAIC&$FF
	ldx.b #$01
	stx.w JOYSER0
	stz.w JOYSER0
	rep #$20
	lda.w #$8008
	sta.w DMAP0
	lda.w #ZeroFillWord
	sta.w A1T0L
	ldx.b #ZeroFillWord>>16
	stx.w A1B0
	stz.w DAS0L
	ldx.b #$7F
	stx.b WMADDH&$FF
	stz.b WMADDL&$FF
	ldx.b #$01
	stx.w MDMAEN
	stz.b WMADDL&$FF
	stz.b WMADDM&$FF
	lda.w #$2000
	sta.w DAS0L
	stx.w MDMAEN
	rep #$10
	lda.w #$DFC0
	sta.w DAS0L
	lda.w #$0001
	sta.w MDMAEN
	lda.w #$003F
	ldx.w #$FFC0
	txy
	mvn $7E,$C0
	jsr.w SetBGMapRegs
	db $58,$51,$5C,$5C,$02,$43		; inline parameters
	lda.w #$0000
	tcd
	jsl.l InitSaveRAM
	lda.w #$548B
	sta.w BlockMove
	lda.w #$6BAB
	sta.w BlockMove+4
	inc.w homepracplayers
	jml.l Opening
