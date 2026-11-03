UpdateUserRecord:					; adds the game to the user record of team X: a win, loss or tie, the
									; biggest margin and the most goals with the teams, then WriteUserRecord
	pha
	jsr.w ReadUserRecord
	txa
	eor.w #$0002
	tay
	lda.w tmscore,x
	cmp.w tmscore,y
	beq .1
	bcs .2
	inc.b d4
	bra .4
.1:									; d3+2 + 1, go to .4
	inc.b d3+2
	bra .4
.2:									; d3 + 1, A = tmshots,y, A - tmscore,y, if A < d1+2 go to .3, ...
	inc.b d3
	lda.w tmshots,y
	sec
	sbc.w tmscore,y
	cmp.b d1+2
	bcc .3
	beq .3
	sta.b d1+2
	lda.w RecordTeams,x
	sta.b d2
	lda.w RecordTeams,y
	sta.b d2+2
.3:									; if tmscore,x < d0 go to .4, if zero go to .4, d0 = A, ...
	lda.w tmscore,x
	cmp.b d0
	bcc .4
	beq .4
	sta.b d0
	lda.w RecordTeams,x
	sta.b d0+2
	lda.w RecordTeams,y
	sta.b d1
.4:									; pull A
	pla
WriteUserRecord:					; writes d0, $81, d1 and $85 back as user a3's record in save RAM ($307112
									; on)
	sta.b a3
	asl a
	adc.b a3
	sta.b a3+2
	asl a
	sec
	sbc.b a3
	tax
	lsr a
	lsr a
	lsr a
	sta.b a4
	txa
	and.w #$0007
	sta.b $75
	lda.w #$0030
	sta.b $79
	ldx.w #$7112
	lda.b d0
	jsr.w WriteUserField12
	ldx.w #$711E
	lda.b d0+2
	jsr.w WriteUserField5
	ldx.w #$7123
	lda.b d1
	jsr.w WriteUserField5
	ldx.w #$7128
	lda.b d1+2
	jsr.w WriteUserField12
	ldx.w #$7134
	lda.b d2
	jsr.w WriteUserField5
	ldx.w #$7139
	lda.b d2+2
	jsr.w WriteUserField5
	ldx.w #$713E
	lda.b d3
	jsr.w WriteUserField12
	ldx.w #$714A
	lda.b d4
	jsr.w WriteUserField12
	ldx.w #$7156
	lda.b d3+2
WriteUserField12:					; writes A as the 12-bit field of the user record at X ($71 half-bytes in)
	stx.b $77
	tax
	lda.b a3+2
	lsr a
	tay
	bcc .1
	txa
	asl a
	asl a
	asl a
	asl a
	sta.b $7D
	lda.b [$77],y
	and.w #$000F
	ora.b $7D
	sta.b [$77],y
	rts
.1:									; $7D = X, A = [$77],y, A and $F000, A or $7D, ...
	stx.b $7D
	lda.b [$77],y
	and.w #$F000
	ora.b $7D
	sta.b [$77],y
	rts
