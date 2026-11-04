StartMenuMusic:						; reloads and starts the front end song $A4 (LoadSounds of SongLists,
									; StartSound) between SoundVolumeDown and SoundVolumeUp; on its first call
									; it only sets its flag, unless the request flag is set
	lda.w MenuMusicPending
	bne .1
	lda.w MenuMusicVisited
	beq .2
.1:									; MenuMusicPending = 0, call SoundVolumeDown, X = SongLists>>16, ...
	stz.w MenuMusicPending
	jsl.l SoundVolumeDown
	ldx.w #SongLists>>16
	lda.w #SongLists&$FFFF
	jsl.l LoadSounds
	lda.w #$00A4
	jsl.l StartSound
	jsl.l SoundVolumeUp
.2:									; MenuMusicVisited = $0001, return
	lda.w #$0001
	sta.w MenuMusicVisited
	rtl
