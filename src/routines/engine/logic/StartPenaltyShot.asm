StartPenaltyShot:					; called from other segments
	lda.w penshot
	bne .rtl
	lda.w BA_Sktr_SCnum
	cmp.w #$000C
	bmi .1
	lda.w #$0002
	sta.w BA_Team
	inc.w tmPenShots+2
	bra .2
.1:									; BA_Team = 0, tmPenShots + 1
	stz.w BA_Team
	inc.w tmPenShots
.2:									; push Y, A = BA_Team, A xor $0002, Y = A, ...
	phy
	lda.w BA_Team
	eor.w #$0002
	tay
	lda.w #$0001
	sta.w tmap,y
	ldy.w BA_Team
	lda.w #$0001
	sta.w tmap,y
	ply
	phx
	ldx.w BA_Sktr_SCnum
	lda.w pnum,x
	sta.w BA_Skater_Offset
	plx
	stz.w penshot
	inc.w penshot
	lda.w fox
	sta.w psfoxsave
	lda.w foy
	sta.w psfoysave
	stz.w fox
	stz.w foy
.rtl:								; return
	rtl
