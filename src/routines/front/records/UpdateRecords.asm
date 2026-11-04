UpdateRecords:						; after a game, outside play mode 1 and with user records on (OptUserRec):
									; the user record of each team that has a user name (HomeUserRec /
									; VisUserRec)
	lda.w OptPlayMode
	cmp.w #$0001
	beq .rtl
	lda.w OptUserRec
	beq .rtl
	lda.w HomeTeam
	sta.w RecordTeams
	lda.w VisTeam
	sta.w RecordTeams+2
	lda.w HomeUserRec
	bmi .1
	ldx.w #$0000
	jsr.w UpdateUserRecord
.1:									; if VisUserRec < 0 go to .rtl, X = $0002, call UpdateUserRecord
	lda.w VisUserRec
	bmi .rtl
	ldx.w #$0002
	jsr.w UpdateUserRecord
.rtl:								; return
	rtl
