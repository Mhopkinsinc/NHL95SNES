EndPenaltyShot:						; called from other segments
	lda.w PenShotActive
	beq .rtl
	lda.w penshot
	beq .rtl
	phx
	jsl.l WaitTransfers
	jsl.l RedrawPeriodBox
	stz.w PenShotActive
	stz.w penshot
	lda.w #$FFFF
	sta.w BA_Sktr_SCnum
	lda.w #$000A
	sta.b d0
	jsl.l ShootoutWonBy
	lda.w psfoxsave
	sta.w ltx
	lda.w psfoysave
	sta.w lty
	plx
.rtl:								; return
	rtl
