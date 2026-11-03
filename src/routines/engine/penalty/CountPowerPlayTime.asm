CountPowerPlayTime:					; from updatepentime and other segments
	stz.b d1
	lda.w tmap
	sec
	sbc.w tmap+2
	beq .rtl
	bpl .1
	lda.w #$0002
	sta.b d1
.1:									; Y = d1, A = tmPwrPlayTime,y, A + 1, tmPwrPlayTime,y = A
	ldy.b d1
	lda.w tmPwrPlayTime,y
	inc a
	sta.w tmPwrPlayTime,y
.rtl:								; return
	rtl
