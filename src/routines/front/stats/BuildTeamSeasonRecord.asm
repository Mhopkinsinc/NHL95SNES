BuildTeamSeasonRecord:				; team A's season record in a new $32-byte work buffer entry (Y): stat
									; fields from save RAM (ReadTeamStatBits), wins / losses / ties from the
									; 2-bit results at SRTeamResults, points, percentages
	tax
	lda.w #$0032
	jsl.l AllocWorkBuf
	tay
	txa
	sta.w $000C,y
	phy
	ldx.w #$0083
	jsl.l Mul16U
	ply
	lda.w #$000C
	jsr.w ReadTeamStatBits
	sta.w $000E,y
	lda.w #$000D
	jsr.w ReadTeamStatBits
	sta.w $0018,y
	lda.w #$000E
	jsr.w ReadTeamStatBits
	sta.w $001C,y
	lda.w #$000B
	jsr.w ReadTeamStatBits
	sta.w $001E,y
	lda.w #$000B
	jsr.w ReadTeamStatBits
	sta.w $0020,y
	lda.w #$000B
	jsr.w ReadTeamStatBits
	sta.w $0022,y
	lda.w #$000B
	jsr.w ReadTeamStatBits
	sta.w $0024,y
	lda.w #$000B
	jsr.w ReadTeamStatBits
	sta.w $0026,y
	lda.w #$000B
	jsr.w ReadTeamStatBits
	sta.w $0028,y
	lda.w #$000C
	jsr.w ReadTeamStatBits
	sta.w $002A,y
	lda.w #$000E
	jsr.w ReadTeamStatBits
	sta.w $002E,y
	lda.w $000C,y
	ldx.w #$0015
	phy
	jsl.l Mul8U
	plx
	tay
	stz.b r0
	stz.b r0+2
	lda.w #$0014
	sta.b r1
	phx
	sep #$20
	phb
	lda.b #$30
	pha
	plb
.loop:								; loop: r1+2 = SRTeamResults&$FFFF,y, A and $03, X = A, $2C,x + 1, ...
	lda.w SRTeamResults&$FFFF,y
	sta.b r1+2
	and.b #$03
	tax
	inc.b $2C,x
	lda.b r1+2
	lsr a
	lsr a
	sta.b r1+2
	and.b #$03
	tax
	inc.b $2C,x
	lda.b r1+2
	lsr a
	lsr a
	sta.b r1+2
	and.b #$03
	tax
	inc.b $2C,x
	lda.b r1+2
	lsr a
	lsr a
	tax
	inc.b $2C,x
	iny
	dex
	dec.b r1
	bpl .loop
	rep #$20
	plb
	ply
	lda.b $2D
	and.w #$00FF
	sta.w $0004,y
	lda.b r0+2
	and.w #$00FF
	sta.w $0006,y
	lda.b $2F
	and.w #$00FF
	sta.w $0008,y
	lda.w $0004,y
	asl a
	adc.w $0008,y
	sta.w $000A,y
	lda.w #$0054
	sec
	stz.b $2D
	sbc.b r0
	sta.w $002C,y
	ldx.w $000E,y
	lda.w #$0064
	phy
	jsl.l Mul16x8U
	ply
	phy
	stz.b r1+2
	lda.w $002C,y
	sta.b r1
	beq .1
	jsl.l Div32x32U
	lda.b r0
.1:									; pull Y, $0010,y = A, X = $002A,y, A = $0064, ...
	ply
	sta.w $0010,y
	ldx.w $002A,y
	lda.w #$0064
	phy
	jsl.l Mul16x8U
	ply
	phy
	stz.b r1+2
	lda.w $002C,y
	sta.b r1
	beq .2
	jsl.l Div32x32U
	lda.b r0
.2:									; pull Y, $0012,y = A, A = $002E,y, A - $002A,y, ...
	ply
	sta.w $0012,y
	sec
	lda.w $002E,y
	sbc.w $002A,y
	tax
	lda.w #$0064
	phy
	jsl.l Mul16x8U
	ply
	phy
	stz.b r1+2
	lda.w $002E,y
	sta.b r1
	beq .3
	jsl.l Div32x32U
	lda.b r0
.3:									; pull Y, $0014,y = A, X = $000E,y, A = $0064, ...
	ply
	sta.w $0014,y
	sec
	ldx.w $000E,y
	lda.w #$0064
	phy
	jsl.l Mul16x8U
	ply
	phy
	stz.b r1+2
	lda.w $0018,y
	sta.b r1
	beq .4
	jsl.l Div32x32U
	lda.b r0
.4:									; pull Y, $0016,y = A, X = $0018,y, A = $0064, ...
	ply
	sta.w $0016,y
	ldx.w $0018,y
	lda.w #$0064
	phy
	jsl.l Mul16x8U
	ply
	phy
	stz.b r1+2
	lda.w $002C,y
	sta.b r1
	beq .5
	jsl.l Div32x32U
	lda.b r0
.5:									; pull Y, $001A,y = A, X = $002E,y, A = $0064, ...
	ply
	sta.w $001A,y
	ldx.w $002E,y
	lda.w #$0064
	phy
	jsl.l Mul16x8U
	ply
	phy
	stz.b r1+2
	lda.w $002C,y
	sta.b r1
	beq .6
	jsl.l Div32x32U
	lda.b r0
.6:									; pull Y, $0030,y = A, X = Y, $0000,x = 0, ...
	ply
	sta.w $0030,y
	tyx
	stz.w $0000,x
	stz.w $0002,x
	rts
