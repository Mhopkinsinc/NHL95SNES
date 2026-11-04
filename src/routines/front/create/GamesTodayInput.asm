GamesTodayInput:					; the Games Today screen each frame (screen state 7): its current step's
									; routine from GamesTodaySteps
	ldx.b d2+2
	jmp (GamesTodaySteps,x)
