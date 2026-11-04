SetTasksDoneUnused:					; TasksDone = A and the stack at $1FFC, then rtl; nothing calls it
	sta.w TasksDone
	lda.w #$1FFC
	tcs
	rtl
