WaitTransfers:						; lets the NMI run the queued transfers (TransfersReady + 1) and waits for
									; it (wai)
	inc.w TransfersReady
	wai
	rtl
