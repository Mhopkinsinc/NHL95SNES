BlackBoxSprite:						; a black box with a white frame
	dw BlackBoxFrames,BlackBoxFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$4D	; into the $04E2 run (loaded, not used)
	db 1,15,16						; the most 8x8, 16x16 and both sprites in a frame
	dw -3,60,-3,60					; x from, x to, y from, y to (a box: not traced)
	dw 36							; palette number (SpritePalettes)
	dw (BlackBoxFramesEnd-BlackBoxFrames)/2	; number of frames
	db $03							; not traced
