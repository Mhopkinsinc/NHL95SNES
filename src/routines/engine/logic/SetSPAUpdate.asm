SetSPAUpdate:						; from FallDown, updateanim and other segments
	cmp.w SPA,x
	beq .rtl
	sta.w SPA,x
	stz.w SPAnum,x
	lda.w #$FFFF
	sta.w SPAcnt,x
	jsl.l updateanim
.rtl:								; return
	rtl
