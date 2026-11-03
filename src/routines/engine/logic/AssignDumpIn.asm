AssignDumpIn:						; replace the current assignment with a dump-in
	lda.w #$0014
	sta.b d0
	jmp.w assreplace
