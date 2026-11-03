ResetTransferQueues:				; empties the transfer queues: VRAMQueueSP = $03FF, VRAMModeQueueSP =
									; $01FF, CGRAMQueueSP = $048F, with QueueBusy set around the stores
	lda.w #$FFFF
	sta.b QueueBusy
	lda.w #$03FF
	sta.b VRAMQueueSP
	lda.w #$01FF
	sta.b VRAMModeQueueSP
	lda.w #$048F
	sta.b CGRAMQueueSP
	stz.b QueueBusy
	rtl
