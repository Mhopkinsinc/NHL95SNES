LogoMTLSprite:						; the MTL logo
	dw LogoMTLFrames,LogoMTLFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$17	; into the $04E2 run (loaded, not used)
	db 4,6,10						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-20,19				; x from, x to, y from, y to (a box: not traced)
	dw 11							; palette number (SpritePalettes)
	dw (LogoMTLFramesEnd-LogoMTLFrames)/2	; number of frames
	db $03							; not traced
