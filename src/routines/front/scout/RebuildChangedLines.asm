RebuildChangedLines:				; for both teams of the game (HomeTeam into HomeRoster, VisTeam into
									; VisRoster), in play mode 2 or 3, or 0 / 1 with OptRosters set:
									; BuildTeamLines when its roster differs from the cartridge one
	lda.w OptPlayMode
	cmp.w #$0002
	bcc .3
.1:									; A = HomeTeam, Y = ScratchBuf, call LoadDefaultRoster, ...
	lda.w HomeTeam
	ldy.w #ScratchBuf
	jsl.l LoadDefaultRoster
	ldy.w #HomeRoster
	ldx.w #ScratchBuf
	jsr.w RosterDiffers
	bcc .2
	ldy.w #HomeRoster
	jsr.w BuildTeamLines
.2:									; A = VisTeam, Y = ScratchBuf, call LoadDefaultRoster, Y = VisRoster, ...
	lda.w VisTeam
	ldy.w #ScratchBuf
	jsl.l LoadDefaultRoster
	ldy.w #VisRoster
	ldx.w #ScratchBuf
	jsr.w RosterDiffers
	bcc .rts
	ldy.w #VisRoster
	jsr.w BuildTeamLines
	bra .rts
.3:									; if OptPlayMode = 0 go to .4, A - 1, if the result is not 0 go to .rts
	lda.w OptPlayMode
	beq .4
	dec a
	bne .rts
.4:									; if OptRosters is not 0 go to .1
	lda.w OptRosters
	bne .1
.rts:								; return
	rts
