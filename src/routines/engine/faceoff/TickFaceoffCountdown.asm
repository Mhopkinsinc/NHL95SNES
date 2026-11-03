TickFaceoffCountdown:				; counts the face off time (temp1) down by d7: updatefaceoff while it
									; runs, else Endfaceoff, then play mode 1's path, SetupPenaltyShot or the
									; normal drop
	lda.b d7
	sta.b tmp0
	cmp.w temp1,x
	bmi .1
	lda.w #$0001
	sta.b tmp0
.1:									; A = temp1,x, A - tmp0, temp1,x = A, if minus go to .2, ...
	lda.w temp1,x
	sec
	sbc.b tmp0
	sta.w temp1,x
	bmi .2
	jml.l updatefaceoff
.2:									; if OptPlayMode is not $0001 go to .3, call Endfaceoff, ...
	lda.w OptPlayMode
	cmp.w #$0001
	bne .3
	jsl.l Endfaceoff
	jml.l PracticeFaceoffDrop
.3:									; if penshot = 0 go to .4, call Endfaceoff, go to SetupPenaltyShot
	lda.w penshot
	beq .4
	jsl.l Endfaceoff
	jml.l SetupPenaltyShot
.4:									; PenShotActive = 0, BA_Sktr_SCnum = $FFFF, go to Endfaceoff
	stz.w PenShotActive
	lda.w #$FFFF
	sta.w BA_Sktr_SCnum
	jml.l Endfaceoff
