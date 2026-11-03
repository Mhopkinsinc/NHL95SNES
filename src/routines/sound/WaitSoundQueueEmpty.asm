WaitSoundQueueEmpty:				; waits for the CPU sound command queue head and tail to match
	ldy.w SoundQueueTail
	cpy.w SoundQueueHead
	bne WaitSoundQueueEmpty
	rts
