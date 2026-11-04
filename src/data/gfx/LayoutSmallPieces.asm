LayoutSmallPieces:					; a layout record's 8 x 8 pieces by their first byte: 1, 2, 3 or 4 pieces,
									; or none (LayoutDone)
	dw SmallPieces1,SmallPieces2,SmallPieces3,SmallPieces4
	dw LayoutDone
