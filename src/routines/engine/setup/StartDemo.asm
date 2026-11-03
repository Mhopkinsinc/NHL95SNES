StartDemo:							; starts the demo: the demo flag set, user records off, play mode
									; Exhibition, then the controller setup (StartExhibition)
	lda.w #$0001
	sta.l $7E23BA
	stz.w OptUserRec
	stz.w OptPlayMode
	jmp.w StartExhibition
