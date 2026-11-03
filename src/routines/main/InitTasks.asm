InitTasks:							; empties the task list: 10 free task slots, the list head and its last
									; task (TaskFrameEnd), the task flags; the done flag is kept as the last
									; one and cleared
	ldx.w #$0000
	lda.w #TaskSlots
	clc
.loop:								; loop: TaskSlotStack,x = A, A + $000C, X + 1, X + 1, ...
	sta.w TaskSlotStack,x
	adc.w #$000C
	inx
	inx
	cpx.w #$0014
	bne .loop
	stz.w TaskSlotStack,x
	stz.w TaskFreeIndex
	lda.w #TaskFrameEnd
	sta.w TaskListHead+2
	sta.w TaskListEnd+2
	lda.w #TaskFrameEnd>>16
	sta.w TaskListHead+4
	sta.w TaskListEnd+4
	stz.w TaskListHead+6
	lda.w #TaskListEnd
	sta.w TaskListHead
	lda.w #$FFFF
	sta.w TaskListEnd+6
	stz.w TaskListEnd
	lda.w #$8002
	sta.b d1+2
	lda.w TasksDone
	sta.w TasksDoneLast
	stz.w TasksDone
	rtl
