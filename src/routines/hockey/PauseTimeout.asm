PauseTimeout:						; pause menu Time Out: when team a2 has one left, takes it, gives the team
									; full energy (reenergizeteam) and prints Time Out by and the team's name
	jsl.l GetPadTeam
	ldx.b a2
	lda.w tmtimeouts,x
	beq ShowQuitPrompt
	dec a
	sta.w tmtimeouts,x
	jsl.l reenergizeteam
	ldx.w #BlankPauseItems&$FFFF
	jsr.w PrintPauseItems
	lda.w #$00C3
	sta.b r0+2
	lda.w #$5A08
	sta.b r0
	lda.w #$0318
	jsr.w PutPauseText
	lda.w #$5A11
	sta.b r0
	lda.w #$039E
	jsr.w PutPauseText
	lda.w HomeTeam
	ldx.b a2
	beq .1
	lda.w VisTeam
.1:									; A * 2, X = A, A = TeamCityNames,x, X = A, ...
	asl a
	tax
	lda.l TeamCityNames,x
	tax
	jsl.l UnpackText
	lda.w #$007E
	sta.b r0+2
	stx.b r0
	sep #$20
	ldy.w #$0000
.loop:								; loop: Y + 1, X + 1, if $0000,x is not 0 go to .loop, A = Y, ...
	iny
	inx
	lda.w $0000,x
	bne .loop
	tya
	pha
.loop2:								; loop: X - 1, if $0000,x is not $3D go to .2, A = $2E
	dex
	lda.w $0000,x
	cmp.b #$3D
	bne .2
	lda.b #$2E
.2:									; A xor $80, $0001,x = A, Y - 1, if the result is not 0 go to .loop2, ...
	eor.b #$80
	sta.w $0001,x
	dey
	bne .loop2
	pla
	sta.w $0000,x
	rep #$20
	and.w #$00FF
	eor.w #$FFFF
	sec
	adc.w #$000C
	lsr a
	adc.w #$0000
	asl a
	adc.w #$0414
	jsr.w PutPauseText
	dec.b QueueBusy
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	pea.w $0700
	pea.w $5800
	pea.w $007E
	lda.w PauseMapBuf
	pha
	lda.b VRAMQueueSP
	tsx
	tcs
	stx.b VRAMQueueSP
	stz.b QueueBusy
	jsl.l WaitTransfers
	ldx.w #$0096
	ldy.w #$0000
	jsl.l WaitFrames_Inc
	lda.w pausetab
	jmp.w DrawPauseTab
