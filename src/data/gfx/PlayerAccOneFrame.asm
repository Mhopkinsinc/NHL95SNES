PlayerAccOneFrame:					; the acceleration routine of each direction (0 up, clockwise) when d7 is
									; 1: one step
	dw PlayerAccDir0,PlayerAccDir1,PlayerAccDir2,PlayerAccDir3
	dw PlayerAccDir4,PlayerAccDir5,PlayerAccDir6,PlayerAccDir7
