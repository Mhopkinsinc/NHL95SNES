StartTasks:							; a new task list (InitTasks) with TaskEndCheck, then AddTask X:A, Y; with
									; carry set the sprites are not built each frame
	pha
	phx
	phy
	php
	jsl.l InitTasks
	lda.w #TaskEndCheck
	ldx.w #TaskEndCheck>>16
	ldy.w #$FFFE
	jsl.l AddTask
	plp
	bcc .1
	lda.w #$0002
	trb.b d1+2
.1:									; pull Y, pull X, pull A
	ply
	plx
	pla
AddTask:							; adds the task routine X:A with priority Y to the task list, before the
									; first task of a higher priority
	phx
	pha
	ldx.w #TaskListHead
	phy
	tya
.loop:								; loop: if A < $0006,x go to .1, Y = X, if $0000,y is not 0 go to .loop
	cmp.w $0006,x
	bcc .1
	txy
	ldx.w $0000,y
	bne .loop
.1:									; X = TaskFreeIndex, A = TaskSlotStack,x, X + 1, X + 1, ...
	ldx.w TaskFreeIndex
	lda.w TaskSlotStack,x
	inx
	inx
	stx.w TaskFreeIndex
	tax
	pla
	sta.w $0006,x
	stz.w $0008,x
	stz.w $000A,x
	pla
	sta.w $0002,x
	pla
	sta.w $0004,x
	lda.w $0000,y
	sta.w $0000,x
	txa
	sta.w $0000,y
	rtl
