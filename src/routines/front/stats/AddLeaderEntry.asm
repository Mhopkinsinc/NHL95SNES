AddLeaderEntry:						; adds player tmp0 to the League Leaders list at d0: a 16-byte entry
									; (FillLeaderEntry) linked in sorted by category d1
	lda.w #$0010
	jsl.l AllocWorkBuf
	tay
	lda.b tmp0
	jsr.w FillLeaderEntry
	lda.b d1
	asl a
	tax
	jmp (LeaderInserts,x)
