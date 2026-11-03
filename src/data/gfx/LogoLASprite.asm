LogoLASprite:						; the LA logo
	dw LogoLAFrames,LogoLAFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$15	; into the $04E2 run (loaded, not used)
	db 3,6,9						; the most 8x8, 16x16 and both sprites in a frame
	dw -25,30,-16,23				; x from, x to, y from, y to (a box: not traced)
	dw 10							; palette number (SpritePalettes)
	dw (LogoLAFramesEnd-LogoLAFrames)/2	; number of frames
	db $03							; not traced
