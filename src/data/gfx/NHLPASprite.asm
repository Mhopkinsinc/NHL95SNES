NHLPASprite:						; the NHLPA logo
	dw NHLPAFrames,NHLPAFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$51	; into the $04E2 run (loaded, not used)
	db 10,4,14						; the most 8x8, 16x16 and both sprites in a frame
	dw 0,39,0,55					; x from, x to, y from, y to (a box: not traced)
	dw 38							; palette number (SpritePalettes)
	dw (NHLPAFramesEnd-NHLPAFrames)/2	; number of frames
	db $03							; not traced
