SoundVolumeDown:					; the sound volume down to 0 in 16 steps (sound driver command 8)
	jsr.w WaitSoundQueueEmpty
	lda.w SoundVolume
	beq .rtl
	xba
	sta.b tmp0
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b tmp2
	ldx.w #$000F
.loop:								; loop: A = tmp0, A - tmp2, tmp0 = A, A and $FF00, ...
	sec
	lda.b tmp0
	sbc.b tmp2
	sta.b tmp0
	and.w #$FF00
	sta.b tmp1
	xba
	ora.b tmp1
	tay
	lda.w #$0008
	jsl.l QueueSoundCmd
	dex
	bpl .loop
	stz.w SoundVolume
.rtl:								; return
	rtl
