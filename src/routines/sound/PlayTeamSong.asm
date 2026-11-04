PlayTeamSong:						; plays song A of the home team's songs (LoadTeamSongs) when the sound CPU
									; is ready and not busy
	phx
	sta.b tmp0
	ldx.w #$03E8
.loop:								; loop: X - 1, if the result < 0 go to PlayTeamSongReturn, ...
	dex
	bmi PlayTeamSongReturn
	lda.l APUIO3
	and.w #$00FF
	cmp.w #$007E
	bne .loop
	lda.l APUIO2
	and.w #$0038
	bne PlayTeamSongReturn
StartSelectedTeamSong:				; starts the team song selected by tmp0, then restores X and returns
	ldx.b tmp0
	lda.w TeamSongList,x
	and.w #$00FF
	jsl.l StartSound
PlayTeamSongReturn:					; PlayTeamSong's exit: X pulled, rtl
	plx
	rtl
