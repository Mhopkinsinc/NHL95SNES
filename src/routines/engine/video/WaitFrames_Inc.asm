WaitFrames_Inc:						; WaitFrames with Y + 1 first
	iny
WaitFrames:							; wait X frames, Y counting the rounds of 65536
	wai
	dex
	bne WaitFrames
	dey
	bne WaitFrames
	rtl
