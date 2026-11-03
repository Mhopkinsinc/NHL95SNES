WaitSPCUploadAck:					; waits for port 0 to equal A during SPCUpload
	cmp.w APUIO0
	bne WaitSPCUploadAck
	rts
