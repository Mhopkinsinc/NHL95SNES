LogoASWSprite:						; the Western all-star logo
	dw LogoASWFrames,LogoASWFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$37	; into the $04E2 run (loaded, not used)
	db 7,8,15						; the most 8x8, 16x16 and both sprites in a frame
	dw -25,30,-20,27				; x from, x to, y from, y to (a box: not traced)
	dw 27							; palette number (SpritePalettes)
	dw (LogoASWFramesEnd-LogoASWFrames)/2	; number of frames
	db $03							; not traced
