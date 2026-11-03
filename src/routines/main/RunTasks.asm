RunTasks:							; runs each task of the task list once, in order (its frame count + 1),
									; through jmlvector
	ldx.w TaskListHead
.loop:								; loop: d1 = X, $0008,x + 1, jmlvector+3 = $0004,x, ...
	stx.b d1
	inc.w $0008,x
	lda.w $0004,x
	sta.w jmlvector+3
	lda.w $0002,x
	sta.w jmlvector+1
	jsl.l jmlvector
	ldy.b d1
	ldx.w $0000,y
	bne .loop
	rtl
