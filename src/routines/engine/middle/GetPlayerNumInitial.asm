GetPlayerNumInitial:				; formats TempPlOffset's player through PlayerShortName, d0 and a2 kept;
									; 94S code that nothing reaches in 95 (no caller)
	pei ($7F)
	pei ($81)
	pei ($6B)
	pei ($6D)
	stz.b a2
	lda.w TempPlOffset
	sta.b d0
	bpl .1
	and.w #$00FF
	sta.b d0
	inc.b a2
	inc.b a2
.1:									; call PlayerShortName, pull A, a2+2 = A, pull A, ...
	jsl.l PlayerShortName
	pla
	sta.b a2+2
	pla
	sta.b a2
	pla
	sta.b d0+2
	pla
	sta.b d0
	rtl
