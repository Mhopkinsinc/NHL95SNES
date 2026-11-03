LayoutBigPieces:					; a layout record's 16 x 16 pieces by its first byte: 1, 2, 3 or 4 pieces,
									; or none (LayoutSmallNext)
	dw BigPieces1,BigPieces2,BigPieces3,BigPieces4
	dw LayoutSmallNext
