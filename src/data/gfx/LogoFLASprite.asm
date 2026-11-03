LogoFLASprite:						; the FLA logo
	dw LogoFLAFrames,LogoFLAFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$11	; into the $04E2 run (loaded, not used)
	db 5,6,11						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-24,23				; x from, x to, y from, y to (a box: not traced)
	dw 8							; palette number (SpritePalettes)
	dw (LogoFLAFramesEnd-LogoFLAFrames)/2	; number of frames
	db $03							; not traced
