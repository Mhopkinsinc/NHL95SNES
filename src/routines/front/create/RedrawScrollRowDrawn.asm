RedrawScrollRowDrawn:				; a row drawn for RedrawScrollList: WaitTransfers, RestoreWorkBuf, the
									; next row
	jsl.l WaitTransfers
	jsl.l RestoreWorkBuf
	lda.b a3
	inc a
	bra RedrawScrollRowNext
