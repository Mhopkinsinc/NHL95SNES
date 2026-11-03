Mod100:								; from printscores1_per and other segments
	lda.b d0
.loop:								; loop: if A < $0064 go to .1, A - $0064, go to .loop
	cmp.w #$0064
	bcc .1
	sbc.w #$0064
	bra .loop
.1:									; d0 = A, return
	sta.b d0
	rtl
	rtl								; unreached: no code branches, falls or points here
