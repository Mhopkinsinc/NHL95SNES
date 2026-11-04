ItsInTheSprite:						; the words It's in the
	dw ItsInTheFrames,ItsInTheFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$4B	; into the $04E2 run (loaded, not used)
	db 0,7,7						; the most 8x8, 16x16 and both sprites in a frame
	dw -52,59,-8,7					; x from, x to, y from, y to (a box: not traced)
	dw 35							; palette number (SpritePalettes)
	dw (ItsInTheFramesEnd-ItsInTheFrames)/2	; number of frames
	db $03							; not traced
