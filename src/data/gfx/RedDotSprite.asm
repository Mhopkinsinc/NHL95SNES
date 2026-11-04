RedDotSprite:						; a small red dot
	dw RedDotFrames,RedDotFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$3F	; into the $04E2 run (loaded, not used)
	db 2,0,2						; the most 8x8, 16x16 and both sprites in a frame
	dw -2,13,0,7					; x from, x to, y from, y to (a box: not traced)
	dw 31							; palette number (SpritePalettes)
	dw (RedDotFramesEnd-RedDotFrames)/2	; number of frames
	db $03							; not traced
