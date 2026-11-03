LogoASESprite:						; the Eastern all-star logo
	dw LogoASEFrames,LogoASEFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$35	; into the $04E2 run (loaded, not used)
	db 7,8,15						; the most 8x8, 16x16 and both sprites in a frame
	dw -25,30,-20,27				; x from, x to, y from, y to (a box: not traced)
	dw 26							; palette number (SpritePalettes)
	dw (LogoASEFramesEnd-LogoASEFrames)/2	; number of frames
	db $03							; not traced
