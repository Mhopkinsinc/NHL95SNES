ResetClock:							; sets the period length: gameclock, PerTimeTotal and gmclock from
									; GetPeriodTime (25 in the shootout, 300 in overtime when OptPlayMode is
									; 0) and the clock digits
	jsl.l GetPeriodTime
	lda.w shootoutmode
	beq .1
	lda.w #$0019
	sta.b d0
	lda.w #$0025
	sta.w clockbcd
	bra .2
.1:									; clockbcd = tmp0, if gsp is not $0003 go to .2, ...
	lda.b tmp0
	sta.w clockbcd
	lda.w gsp
	cmp.w #$0003
	bne .2
	lda.w OptPlayMode
	bne .2
	lda.w #$0500
	sta.w clockbcd
	lda.w #$012C
	sta.b d0
.2:									; gameclock = d0, PerTimeTotal = A, gmclock = A, return
	lda.b d0
	sta.w gameclock
	sta.w PerTimeTotal
	sta.w gmclock
	rtl
