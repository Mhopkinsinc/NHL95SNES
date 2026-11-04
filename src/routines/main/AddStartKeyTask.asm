AddStartKeyTask:					; adds TaskStartKey to the task list (priority $F000)
	lda.w #TaskStartKey
	ldx.w #TaskStartKey>>16
	ldy.w #$F000
	bra AddTask
