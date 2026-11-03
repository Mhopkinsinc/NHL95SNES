LoadTeamSongs:						; the home team's 6 songs from TeamSongs into a list (each $FF a random
									; DefaultSongs pick), loaded to the sound CPU with TeamSongSoundList
	ldx.w #TeamSongSoundList>>16
	lda.w #TeamSongSoundList&$FFFF
	jsl.l LoadSounds
	lda.w HomeTeam
	asl a
	adc.w HomeTeam
	asl a
	tax
	lda.w #TeamSongList
	sta.b r0
	ldy.w #$0005
.loop:								; loop: A = TeamSongs,x, A and $00FF, if A is not $00FF go to .1, ...
	lda.l TeamSongs,x
	and.w #$00FF
	cmp.w #$00FF
	bne .1
	phx
	lda.w #$0007
	jsl.l RandomBelowA
	tax
	lda.l DefaultSongs,x
	plx
.1:									; (r0) = A, r0 + 1, X + 1, Y - 1, ...
	sta.b (r0)
	inc.b r0
	inx
	dey
	bpl .loop
	lda.w #$FFFF
	sta.b (r0)
	lda.w #TeamSongList
	ldx.w #$007E
	jsl.l AppendSounds
	ldx.w #$001B
	lda.w SampleSlots,x
	and.w #$00FF
	asl a
	tax
	lda.w #$00E8
	sta.w SampleNoteParams,x
	rtl
