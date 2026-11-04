donothing:							; from OffensiveDefenceThink, assdefd, asswingd, ...
	lda.w playerpad,x
	bpl .rtl
	lda.w #$0008
	sta.b d0
	jml.l doplayeracc
.rtl:								; return
	rtl
