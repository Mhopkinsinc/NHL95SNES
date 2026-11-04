PracticeFaceoffSetup:				; the face off set-up in practice (OptPlayMode 1): no face off box,
									; DrawPeriodBox, then FinishFaceoffSetup
	jsl.l DrawPeriodBox
	jmp.w FinishFaceoffSetup
