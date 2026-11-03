QueueSoundCmd:						; queues sound driver command A with the arguments X and Y (the command
									; queue, 4 bytes an entry)
	phy
	ldy.w SoundQueueHead
	sta.w SoundCmdQueue,y
	txa
	sta.w SoundCmdQueue+1,y
	pla
	sta.w SoundCmdQueue+2,y
	tya
	clc
	adc.w #$0004
	and.w #$00FF
	sta.w SoundQueueHead
QueueSoundCmdReturn:				; returns after advancing the sound command queue head
	rtl
