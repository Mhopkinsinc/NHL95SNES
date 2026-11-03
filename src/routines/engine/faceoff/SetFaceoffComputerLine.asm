SetFaceoffComputerLine:				; line changes on and team d0 not on a pad: CompLine, setpersonel,
									; printscores1
	lda.w OptLine
	bne .1
	jmp.w rtsfaceoff
.1:									; if d0 is not cont1team go to .2, go to rtsfaceoff
	lda.b d0
	cmp.w cont1team
	bne .2
	jmp.w rtsfaceoff
.2:									; if A is not cont2team go to .3, go to rtsfaceoff
	cmp.w cont2team
	bne .3
	jmp.w rtsfaceoff
.3:									; if A is not cont3team go to .4, go to rtsfaceoff
	cmp.w cont3team
	bne .4
	jmp.w rtsfaceoff
.4:									; if A is not cont4team go to .5, go to rtsfaceoff
	cmp.w cont4team
	bne .5
	jmp.w rtsfaceoff
.5:									; if A is not cont5team go to SetFaceoffPersonnel, go to rtsfaceoff
	cmp.w cont5team
	bne SetFaceoffPersonnel
	jmp.w rtsfaceoff
