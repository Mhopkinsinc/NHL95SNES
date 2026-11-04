lcfound:							; from lineinput and other segments
	ldx.b a3
	ldy.b a2
	lda.b d2
	sta.w tmlcchoice,y
	jsr.w getlchoice
	bmi .rtl
	sta.b d0
	lda.w pflags,x
	ora.w #$0008
	sta.w pflags,x
	jsl.l loadTeamStruct
	ldy.b a2
	lda.w tmflags,y
	and.w #$FFF7
	sta.w tmflags,y
	lda.b d0
	sta.w tmline,y
	lda.w #$FFFF
	sta.w lcpad,y
	jsl.l setpersonel
	lda.w #$0000
.rtl:								; return
	rtl
