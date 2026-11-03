RemoveTask:							; takes the running task (d1) out of the task list and frees its slot
	ldy.b d1
	lda.w $0002,y
	ldx.w $0004,y
	sta.b d2
	stx.b d2+2
	ldx.w #TaskListHead
.loop:								; loop: if A is not $0002,x go to .1, if d2+2 = $0004,x go to .2, A = d2
	cmp.w $0002,x
	bne .1
	lda.b d2+2
	cmp.w $0004,x
	beq .2
	lda.b d2
.1:									; Y = X, if $0000,y is not 0 go to .loop
	txy
	ldx.w $0000,y
	bne .loop
.2:									; $0000,y = $0000,x, A = X, X = TaskFreeIndex, X - 1, ...
	lda.w $0000,x
	sta.w $0000,y
	txa
	ldx.w TaskFreeIndex
	dex
	dex
	sta.w TaskSlotStack,x
	stx.w TaskFreeIndex
	rtl
