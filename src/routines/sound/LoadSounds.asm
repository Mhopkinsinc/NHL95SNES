LoadSounds:							; loads the samples and sounds of the list at X:A into the sound CPU:
									; bytes below $80 samples (LoadSample), from $80 sounds (LoadSequence),
									; $FF ends it
	ldy.w SoundQueueTail
	cpy.w SoundQueueHead
	bne LoadSounds
	wai
	stz.w CrowdSoundOn
	pha
	phx
	lda.w #$0C00
	sta.b tmp0
	ldx.w #$00FE
	lda.w #$FFFF
.loop:								; loop: LoadedSampleSources,x = A, SequenceAddrs,x = A, ...
	sta.w LoadedSampleSources,x
	sta.w SequenceAddrs,x
	stz.w SampleSlots,x
	dex
	dex
	bpl .loop
	lda.w #$0001
	sta.w SampleSlotNext
	plx
	pla
AppendSounds:						; loads the list at X:A using the current sample allocation, then uploads
									; the sound lookup tables
	sta.b r2
	stx.b r2+2
.loop:								; loop: A = [r2], A and $00FF, if a $0080 bit set go to .1, r2 + 1, ...
	lda.b [r2]
	and.w #$00FF
	bit.w #$0080
	bne .1
	inc.b r2
	jsl.l LoadSample
	bra .loop
.1:									; if A = $00FF go to .2, r2 + 1, call LoadSequence, go to .loop
	cmp.w #$00FF
	beq .2
	inc.b r2
	jsl.l LoadSequence
	bra .loop
.2:									; A = tmp0
	lda.b tmp0
	clc
UploadSoundTables:					; finishes the allocation bounds and uploads sequence pointers, sample
									; slots, envelopes and sample parameters
	adc.w #$0B80
	sta.w SoundAllocBound
	eor.w #$FFFF
	inc a
	sta.w SoundAllocNegBound
	lda.w #$0100
	sta.w SequenceAddrsSize
	lda.w #SequenceAddrsSize
	ldx.w #$007E
	ldy.w #$F600
	jsl.l UploadSoundData
	lda.w #$0100
	sta.w SampleSlotsSize
	lda.w #SampleSlotsSize
	ldx.w #$007E
	ldy.w #$F480
	jsl.l UploadSoundData
	lda.w #$0080
	sta.w SampleEnvelopesSize
	lda.w #SampleEnvelopesSize
	ldx.w #$007E
	ldy.w #$F580
	jsl.l UploadSoundData
	lda.w #$0280
	sta.w SampleTablesSize
	lda.w #SampleTablesSize
	ldx.w #$007E
	ldy.w #$FD00
	jmp.w UploadSoundData
