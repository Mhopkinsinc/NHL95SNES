MakePlayerOptions:					; the Make Player setup lines: the Play Mode line only (a count of 1, then
									; its row)
	dw 1
	dw TxtPlayMode&$FFFF,PlayModeValues&$FFFF,OptPlayMode,DrawPlayModeOptions&$FFFF
