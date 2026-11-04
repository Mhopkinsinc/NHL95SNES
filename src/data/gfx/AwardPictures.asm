AwardPictures:						; the picture (map set) of each award, a long pointer; read by DrawAward
	dw VezinaPicMap&$FFFF,VezinaPicMap>>16	; 0: Vezina Trophy
	dw SelkePicMap&$FFFF,SelkePicMap>>16	; 1: Frank J. Selke Trophy
	dw ConnSmythePicMap&$FFFF,ConnSmythePicMap>>16	; 2: Conn Smythe Trophy
	dw JenningsPicMap&$FFFF,JenningsPicMap>>16	; 3: William M. Jennings Trophy
	dw HartPicMap&$FFFF,HartPicMap>>16	; 4: Hart Memorial Trophy
	dw ArtRossPicMap&$FFFF,ArtRossPicMap>>16	; 5: Art Ross Trophy
	dw NorrisPicMap&$FFFF,NorrisPicMap>>16	; 6: James Norris Memorial Trophy
	dw PresidentsPicMap&$FFFF,PresidentsPicMap>>16	; 7: Presidents Trophy
