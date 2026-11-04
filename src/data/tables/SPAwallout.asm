SPAwallout:							; per direction (facedir & 7, * 2): one sequence for all: SPFPen+6 back to
									; SPFPen over the boards out of the bench (asseben, and updateanim after a
									; bench check) or the penalty box (assepen)
	dw .d0,.d0,.d0,.d0,.d0,.d0,.d0,.d0
	dw 0
.d0:								; directions 0-7
	dw SPFPen+6,5,SPFPen+5,5,SPFPen+4,5,SPFPen+3,5,SPFPen+2,5,SPFPen+1,5,SPFPen,-5
