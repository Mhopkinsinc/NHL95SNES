TeamNumSecondText:					; X = the second packed string of team A's text list (A a team number;
									; TeamSecondText takes home / away)
	asl a
	tax
	lda.l $C30000,x
	tax
	lda.l $C30002,x
	tax
	jmp.w SkipPackedText
