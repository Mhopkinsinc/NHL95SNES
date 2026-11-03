SetSPA:								; from Acheck, FallDown and other segments
	lda.b d1
	cmp.w SPA,x
	beq .rtl
	sta.w SPA,x
	stz.w SPAnum,x
	lda.w #$FFFF
	sta.w SPAcnt,x
.rtl:								; return
	rtl
