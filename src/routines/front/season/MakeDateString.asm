MakeDateString:						; the date of season day A as text in mesarea: the day name, the month,
									; the day of the month
	asl a
	tax
	lda.l SeasonDates,x
	tay
	and.w #$001F
	tax
	lda.l BCDTable,x
	jsr.w BCDDigits4
	lda.w mesarea+2
	pha
	tya
	and.w #$00E0
	asl a
	asl a
	asl a
	xba
	sta.b tmp0
	asl a
	adc.b tmp0
	tax
	lda.l DayNames,x
	sta.w mesarea
	lda.l DayNames+2,x
	sta.w mesarea+2
	lda.w #$403D
	sta.w mesarea+3
	lda.w #$0020
	sta.w mesarea+5
	tya
	xba
	and.w #$00FF
	asl a
	tax
	lda.l MonthNames,x
	tax
	ldy.w #$FFFF
	sep #$20
.loop:								; loop: Y + 1, X + 1, $04FB,y = $C4FFFF,x, ...
	iny
	inx
	lda.l $C4FFFF,x
	sta.w mesarea+6,y
	bne .loop
	lda.b #$20
	sta.w mesarea+6,y
	pla
	cmp.b #$30
	beq .1
	sta.w mesarea+7,y
	iny
.1:									; pull A, $04FC,y = A, X = Y, $04FD,x = 0, ...
	pla
	sta.w mesarea+7,y
	tyx
	stz.w mesarea+8,x
	rep #$20
	rts
