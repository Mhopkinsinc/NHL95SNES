SoundVolumeUp:						; the sound volume up to $7F7F in 16 steps (sound driver command 8)
	jsr.w WaitSoundQueueEmpty
	lda.w SoundVolume
	cmp.w #$007F
	beq .rtl
	stz.b tmp0
	ldx.w #$000F
.loop:								; loop: A = tmp0, A + $0808, if A < $7F80 go to .1, A = $7F7F
	lda.b tmp0
	clc
	adc.w #$0808
	cmp.w #$7F80
	bcc .1
	lda.w #$7F7F
.1:									; tmp0 = A, Y = A, A = $0008, call QueueSoundCmd, ...
	sta.b tmp0
	tay
	lda.w #$0008
	jsl.l QueueSoundCmd
	dex
	bpl .loop
	lda.w #$007F
	sta.w SoundVolume
.rtl:								; return
	rtl
