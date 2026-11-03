SetSPAFromA:						; from Sweepcheck, assstanley, dostop, CheckPlayerContact, ...
	cmp.w SPA,x
	beq .rtl
	sta.w SPA,x
	stz.w SPAnum,x
	lda.w #$FFFF
	sta.w SPAcnt,x
.rtl:								; return
	rtl
