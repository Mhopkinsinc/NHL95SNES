marktexthi:							; textdirtyhi = A when A is higher; no caller found
	cmp.w textdirtyhi
	bcc .rtl
	sta.w textdirtyhi
.rtl:								; return
	rtl
