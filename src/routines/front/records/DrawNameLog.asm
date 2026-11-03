DrawNameLog:						; draws the Name Entry page: the team's name, then the 8 user names,
									; numbered
	stz.b a0+2
	ldx.b a0
	lda.w #$0010
	sta.b $05,x
	lda.w #$0036
	sta.b $08,x
	lda.b $D3
	ldy.w #$0700
	jsl.l ClearRAM7E
	ldy.w #$5000
	jsl.l ClearVRAM
	ldy.w #$2801
	lda.b a2
	cmp.w HomeTeam
	beq .1
	ldy.w #$2C01
.1:									; X = $5115, call MapTileBlock, X = d7, Y = d7+2, ...
	ldx.w #$5115
	jsl.l MapTileBlock
	ldx.b d7
	ldy.b d7+2
	lda.b a2
	cmp.w HomeTeam
	beq .2
	txy
	ldx.b d7+2
.2:									; $05,x = $00D0, $08,x = $0028, A = $22,x, A or $0001, ...
	lda.w #$00D0
	sta.b $05,x
	lda.w #$0028
	sta.b $08,x
	lda.b $22,x
	ora.w #$0001
	sta.b $22,x
	lda.w $0022,y
	and.w #$FFFE
	sta.w $0022,y
	lda.w #NameLogPage&$FFFF
	jsl.l PrintTextPage
	lda.w #$00A8
	sta.b $CF
	lda.w #$00F0
	sta.b $D1
	lda.b a2
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	ldy.w #$0009
	jsl.l PrintThinCentred
	lda.w #$0000
.loop:								; loop: push A, A + 1, call BCDText, mesarea,x = $003D, ...
	pha
	inc a
	jsr.w BCDText
	lda.w #$003D
	sta.w mesarea,x
	lda.w #$0014
	sta.b $CF
	lda.b $01,s
	clc
	adc.w #$0006
	tay
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
	lda.b $01,s
	jsr.w GetLogName
	cpx.w #$0000
	beq .3
	lda.w #$0020
	sta.b $CF
	lda.b $01,s
	clc
	adc.w #$0006
	tay
	ldx.w #mesarea
	jsl.l PrintBoldLeftStr
.3:									; pull A, A + 1, if A is not $0008 go to .loop, call SendTextMap, ...
	pla
	inc a
	cmp.w #$0008
	bne .loop
	jsl.l SendTextMap
	rts
