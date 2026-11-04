BuildAllTeamRecords:				; BuildTeamSeasonRecord for every team ($19 down to 0 through HomeTeam),
									; linked into a list by + 2, then MarkWorkBuf
	lda.w #$0019
	sta.w HomeTeam
	jsr.w BuildTeamSeasonRecord
	stz.w $0000,x
	stx.b d0+2
.loop:								; loop: push X, A = HomeTeam, A - 1, if the result < 0 go to .1, ...
	phx
	lda.w HomeTeam
	dec a
	bmi .1
	sta.w HomeTeam
	jsr.w BuildTeamSeasonRecord
	ply
	tya
	sta.w $0000,x
	txa
	sta.w $0002,y
	bra .loop
.1:									; pull X, $0002,x = 0, go to MarkWorkBuf
	plx
	stz.w $0002,x
	jml.l MarkWorkBuf
	brk #$00						; a brk in the ROM, between routines
SaveOptPlayoffs:					; before the playoffs (SRPODay 0), stores OptPlayoffs as SRBestOfSeven
	lda.l SRPODay
	and.w #$00FF
	beq .1
	rts
.1:									; A 8-bit, SRBestOfSeven = OptPlayoffs, A 16-bit, return
	sep #$20
	lda.w OptPlayoffs
	sta.l SRBestOfSeven
	rep #$20
	rts
	brk #$00						; a brk in the ROM, between routines
SaveOptLine:						; stores OptLine in save RAM (SROptLine)
	sep #$20
	lda.w OptLine
	sta.l SROptLine
	rep #$20
	rts
	brk #$00						; a brk in the ROM, between routines
SaveOptPen:							; stores OptPen in save RAM (SROptPen)
	sep #$20
	lda.w OptPen
	sta.l SROptPen
	rep #$20
	rts
	brk #$00						; a brk in the ROM, between routines
SaveOptperlen:						; stores Optperlen in save RAM (SROptperlen)
	sep #$20
	lda.w Optperlen
	sta.l SROptperlen
	rep #$20
	rts
	brk #$00						; a brk in the ROM, between routines
SaveOptGoalie:						; stores OptGoalie in save RAM (SROptGoalie)
	sep #$20
	lda.w OptGoalie
	sta.l SROptGoalie
	rep #$20
	rts
	brk #$00						; a brk in the ROM, between routines
SaveOptUserRec:						; stores OptUserRec in save RAM (SROptUserRec)
	sep #$20
	lda.w OptUserRec
	sta.l SROptUserRec
	rep #$20
	rts
	brk #$00						; a brk in the ROM, between routines
SaveOptRosters:						; stores OptRosters in save RAM, then with it set ClampRosterTeams
	sep #$20
	lda.w OptRosters
	sta.l SROptRosters
	rep #$20
	lda.w OptRosters
	bne ClampRosterTeams
ClampRosterTeamsReturn:				; the rts ClampRosterTeams leaves through when the visiting team is in
									; range
	rts
