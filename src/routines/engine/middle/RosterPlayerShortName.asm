RosterPlayerShortName:				; selects the roster and player from TempPlOffset and formats a short name
	ldx.w #HomeRoster
	lda.w TempPlOffset
	bpl FormatRosterShortName
	and.w #$00FF
	ldx.w #VisRoster
FormatRosterShortName:				; builds packed number, first initial and surname text from roster X and
									; player A
	stx.b tmp0
	xba
	lsr a
	lsr a
	lsr a
	adc.b tmp0
	tax
	lda.w #$0032
	jsl.l AllocWorkBuf2
	tay
	phx
	lda.w $0110,x
	and.w #$007F
	jsr.w BinToBCD
	tax
	and.w #$00F0
	lsr a
	lsr a
	lsr a
	lsr a
	adc.w #$00B0
	sta.w $0001,y
	txa
	and.w #$000F
	adc.w #$00B0
	ora.w #$A000
	sta.w $0002,y
	plx
	phy
	sep #$21
	lda.w $0118,x
	cmp.b #$3D
	bne .1
	lda.b #$2E
.1:									; A xor $80, $0004,y = A, $0005,y = $AE, $0006,y = $A0
	eor.b #$80
	sta.w $0004,y
	lda.b #$AE
	sta.w $0005,y
	lda.b #$A0
	sta.w $0006,y
.loop:								; loop: A = $0119,x, X + 1, if $0119,x is not $20 go to .loop
	lda.w $0119,x
	inx
	cmp.b #$20
	bne .loop
.loop2:								; loop: X + 1, Y + 1, if $0118,x is not $3D go to .2, A = $2E
	inx
	iny
	lda.w $0118,x
	cmp.b #$3D
	bne .2
	lda.b #$2E
.2:									; A xor $80, $0006,y = A, if the result is not 0 go to .loop2, ...
	eor.b #$80
	sta.w $0006,y
	eor.b #$80
	bne .loop2
	sta.w $0006,y
	rep #$21
	tya
	sbc.b $01,s
	adc.w #$0005
	sep #$20
	ply
	sta.w $0000,y
	rep #$20
	tya
	ldx.w #$007E
	rtl
