TaskEndCheck:						; a task: once task flag bit 15 is cleared, fades out and sets the done
									; flag the task loops wait for
	bit.b d1+2
	bmi .rtl
	jsl.l FadeOutWait
	lda.w TasksDoneLast
	tax
	inc a
	sta.w TasksDone
.rtl:								; return
	rtl
