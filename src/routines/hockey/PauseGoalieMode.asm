PauseGoalieMode:					; pause menu Mnual Goalie / Auto Goalie: switches the goalie mode word of
									; team a2, then redraws the menu
	jsl.l GetPadTeam
	ldx.b a2
	lda.w goaliemode1,x
	eor.w #$0001
	sta.w goaliemode1,x
	lda.w pausetab
	jmp.w DrawPauseTab
