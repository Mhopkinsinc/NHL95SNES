CheckGlyphLeftOverlap:				; test whether the glyph leading column overlaps existing text pixels
	lda.b $0A
	and.w #$0007
	tax
	lda.l PixelBitMasks,x
	and.w #$00FF
	sta.b r2+2
	lda.b $10
	clc
	adc.b $0C
	tax
	lda.b $0A
	and.w #$FFF8
	asl a
	adc.b tmp3
	tay
	sep #$20
	lda.l $C00000,x
	ora.l $C00001,x
	asl a
	bcc .1
	lda.w $0000,y
	ora.w $0001,y
	bit.b r2+2
	bne .7
.1:									; A = $C00002,x, A or $C00003,x, A * 2, if carry clear go to .2, ...
	lda.l $C00002,x
	ora.l $C00003,x
	asl a
	bcc .2
	lda.w $0002,y
	ora.w $0003,y
	bit.b r2+2
	bne .7
.2:									; A = $C00004,x, A or $C00005,x, A * 2, if carry clear go to .3, ...
	lda.l $C00004,x
	ora.l $C00005,x
	asl a
	bcc .3
	lda.w $0004,y
	ora.w $0005,y
	bit.b r2+2
	bne .7
.3:									; A = $C00006,x, A or $C00007,x, A * 2, if carry clear go to .4, ...
	lda.l $C00006,x
	ora.l $C00007,x
	asl a
	bcc .4
	lda.w $0006,y
	ora.w $0007,y
	bit.b r2+2
	bne .7
.4:									; A = $C00008,x, A or $C00009,x, A * 2, if carry clear go to .5, ...
	lda.l $C00008,x
	ora.l $C00009,x
	asl a
	bcc .5
	lda.w $0008,y
	ora.w $0009,y
	bit.b r2+2
	bne .7
.5:									; A = $C0000A,x, A or $C0000B,x, A * 2, if carry clear go to .6, ...
	lda.l $C0000A,x
	ora.l $C0000B,x
	asl a
	bcc .6
	lda.w $000A,y
	ora.w $000B,y
	bit.b r2+2
	bne .7
.6:									; A = $C0000C,x, A or $C0000D,x, A * 2, if carry clear go to .8, ...
	lda.l $C0000C,x
	ora.l $C0000D,x
	asl a
	bcc .8
	lda.w $000C,y
	ora.w $000D,y
	bit.b r2+2
	beq .8
.7:									; A 16-bit, return
	rep #$20
	rts
.8:									; A = $C0000E,x, A or $C0000F,x, A * 2, if carry clear go to .9, ...
	lda.l $C0000E,x
	ora.l $C0000F,x
	asl a
	bcc .9
	lda.w $000E,y
	ora.w $000F,y
	bit.b r2+2
	bne .7
.9:									; A = $0E, A / 2, if carry set go to .10, A 16-bit, ...
	lda.b $0E
	lsr a
	bcs .10
	rep #$20
	rts
.10:								; A = $C00020,x, A or $C00021,x, A * 2, if carry clear go to .11, ...
	lda.l $C00020,x
	ora.l $C00021,x
	asl a
	bcc .11
	lda.w $0200,y
	ora.w $0201,y
	bit.b r2+2
	bne .7
.11:								; A = $C00022,x, A or $C00023,x, A * 2, if carry clear go to .12, ...
	lda.l $C00022,x
	ora.l $C00023,x
	asl a
	bcc .12
	lda.w $0202,y
	ora.w $0203,y
	bit.b r2+2
	bne .7
.12:								; A = $C00024,x, A or $C00025,x, A * 2, if carry clear go to .13, ...
	lda.l $C00024,x
	ora.l $C00025,x
	asl a
	bcc .13
	lda.w $0204,y
	ora.w $0205,y
	bit.b r2+2
	bne .7
.13:								; A = $C00026,x, A or $C00027,x, A * 2, if carry clear go to .14, ...
	lda.l $C00026,x
	ora.l $C00027,x
	asl a
	bcc .14
	lda.w $0206,y
	ora.w $0207,y
	bit.b r2+2
	bne .7
.14:								; A = $C00028,x, A or $C00029,x, A * 2, if carry clear go to .15, ...
	lda.l $C00028,x
	ora.l $C00029,x
	asl a
	bcc .15
	lda.w $0208,y
	ora.w $0209,y
	bit.b r2+2
	bne .18
.15:								; A = $C0002A,x, A or $C0002B,x, A * 2, if carry clear go to .16, ...
	lda.l $C0002A,x
	ora.l $C0002B,x
	asl a
	bcc .16
	lda.w $020A,y
	ora.w $020B,y
	bit.b r2+2
	bne .18
.16:								; A = $C0002C,x, A or $C0002D,x, A * 2, if carry clear go to .17, ...
	lda.l $C0002C,x
	ora.l $C0002D,x
	asl a
	bcc .17
	lda.w $020C,y
	ora.w $020D,y
	bit.b r2+2
	bne .18
.17:								; A = $C0002E,x, A or $C0002F,x, A * 2, if carry clear go to .18, ...
	lda.l $C0002E,x
	ora.l $C0002F,x
	asl a
	bcc .18
	lda.w $020E,y
	ora.w $020F,y
	bit.b r2+2
	bne .18
	clc
.18:								; A 16-bit, return
	rep #$20
	rts
