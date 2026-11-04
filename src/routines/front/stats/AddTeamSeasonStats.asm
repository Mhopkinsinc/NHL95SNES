AddTeamSeasonStats:					; adds team A's game totals (the table at Y) to its season record in save
									; RAM: the record read (BuildTeamSeasonRecord), each field plus the game
									; value written back
	phy
	phx
	pha
	pea.w $7F7E
	plb
	jsr.w BuildTeamSeasonRecord
	plb
	pla
	phx
	ldx.w #$0083
	jsl.l Mul16U
	plx
	ply
	clc
	lda.l $7E000E,x
	adc.w $000C,y
	jsr.w PutTeamStat12
	clc
	lda.l $7E0018,x
	adc.w $000E,y
	jsr.w PutTeamStat13
	clc
	lda.l $7E001C,x
	adc.w $0010,y
	jsr.w PutTeamStat14
	clc
	lda.l $7E001E,x
	adc.w $0012,y
	jsr.w PutTeamStat11
	clc
	lda.l $7E0020,x
	adc.w $0014,y
	jsr.w PutTeamStat11
	clc
	lda.l $7E0022,x
	adc.w $0016,y
	jsr.w PutTeamStat11
	clc
	lda.l $7E0024,x
	adc.w $0018,y
	jsr.w PutTeamStat11
	clc
	lda.l $7E0026,x
	adc.w $001A,y
	jsr.w PutTeamStat11
	clc
	lda.l $7E0028,x
	adc.w $001C,y
	jsr.w PutTeamStat11
	clc
	lda.l $7E002A,x
	adc.w $001E,y
	jsr.w PutTeamStat12
	clc
	lda.l $7E002E,x
	adc.w $0020,y
	jsr.w PutTeamStat14
	ply
	rts
