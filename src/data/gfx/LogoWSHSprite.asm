LogoWSHSprite:						; the WSH logo
	dw LogoWSHFrames,LogoWSHFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$31	; into the $04E2 run (loaded, not used)
	db 5,4,9						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-20,19				; x from, x to, y from, y to (a box: not traced)
	dw 24							; palette number (SpritePalettes)
	dw (LogoWSHFramesEnd-LogoWSHFrames)/2	; number of frames
	db $03							; not traced
