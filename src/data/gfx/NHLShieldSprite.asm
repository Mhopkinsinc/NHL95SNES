NHLShieldSprite:					; the NHL shield
	dw NHLShieldFrames,NHLShieldFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$4F	; into the $04E2 run (loaded, not used)
	db 5,7,12						; the most 8x8, 16x16 and both sprites in a frame
	dw 0,47,0,47					; x from, x to, y from, y to (a box: not traced)
	dw 37							; palette number (SpritePalettes)
	dw (NHLShieldFramesEnd-NHLShieldFrames)/2	; number of frames
	db $03							; not traced
