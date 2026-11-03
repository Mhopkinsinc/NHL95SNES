marktextlo:							; textdirtylo = A when A is lower; no caller found
	cmp.w textdirtylo
	bcs .rtl
	sta.w textdirtylo
.rtl:								; return
	rtl
