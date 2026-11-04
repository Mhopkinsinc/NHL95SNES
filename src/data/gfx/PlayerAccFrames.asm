PlayerAccFrames:					; the acceleration routine of each direction (0 up, clockwise) when d7 is
									; not 1: the step taken twice
	dw PlayerAccDir0x2,PlayerAccDir1x2,PlayerAccDir2x2,PlayerAccDir3x2
	dw PlayerAccDir4x2,PlayerAccDir5x2,PlayerAccDir6x2,PlayerAccDir7x2
