ReturnGoalies:						; called from other segments
	stz.b a2
	lda.w #$0002
	sta.b a1
	jsl.l ReturnTeamGoalie
	stz.b a1
	lda.w #$0002
	sta.b a2
ReturnTeamGoalie:					; return team a2 goalie and reconsider the computer pull rule
	ldy.b a2
	lda.w tmgoalie,y
	bpl .rtl
	and.w #$00FF
	cmp.w #$000A
	bcs .rtl
	sta.w tmgoalie,y
	lda.w teampads,y
	bne .rtl
	lda.w foy
	sta.b d1
	jmp.w CPgoalie
.rtl:								; return
	rtl
