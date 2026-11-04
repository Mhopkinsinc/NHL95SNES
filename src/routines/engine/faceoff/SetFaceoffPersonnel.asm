SetFaceoffPersonnel:				; the computer team's line (CompLine), the players set on the ice
									; (setpersonel), then printscores1
	jsl.l CompLine
	jsl.l setpersonel
	jml.l printscores1
