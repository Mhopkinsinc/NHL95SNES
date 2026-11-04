StartSoundVolume:					; queues sample A with left and right volumes from tmp0 using driver
									; command 3
	phx
	phy
	tax
	lda.w #$0003
	ldy.b tmp0
	jsl.l QueueSoundCmd
	ply
	plx
	rtl
