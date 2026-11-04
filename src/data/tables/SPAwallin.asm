SPAwallin:							; per direction (facedir & 7, * 2): one sequence for all: SPFPen to
									; SPFPen+6 over the boards into the bench (assbench) or the penalty box
									; (asspenalty)
	dw .d0,.d0,.d0,.d0,.d0,.d0,.d0,.d0
	dw 0
.d0:								; directions 0-7
	dw SPFPen,5,SPFPen+1,5,SPFPen+2,5,SPFPen+3,5,SPFPen+4,5,SPFPen+5,5,SPFPen+6,-5
