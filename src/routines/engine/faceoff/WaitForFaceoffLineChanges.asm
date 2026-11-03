WaitForFaceoffLineChanges:			; runs both line change timers; when both are done, the computer lines,
									; then assignment $1C (puckfaceoff2)
	stz.w penshotlive
	stz.b d0
	jsl.l UpdateFaceoffLineChangeTimer
	lda.w #$0020
	sta.b d0
	jsl.l UpdateFaceoffLineChangeTimer
	ldx.b a3
	lda.w temp1,x
	bpl rtsfaceoff
	lda.w temp2,x
	bpl rtsfaceoff
	stz.b a2
	lda.w #$0001
	sta.b d0
	inc a
	sta.b a1
	jsl.l SetFaceoffComputerLine
	lda.w #$001C
	sta.b d0
	ldx.b a3
	jml.l assreplace
