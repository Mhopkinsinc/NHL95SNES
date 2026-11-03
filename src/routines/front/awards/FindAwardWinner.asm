FindAwardWinner:					; A = the winner of award a0, from its routine in AwardScanTbl
	lda.w #$0030
	sta.b a1+2
	lda.b a0
	asl a
	tax
	jmp (AwardScanTbl,x)
