LogoQUESprite:						; the QUE logo
	dw LogoQUEFrames,LogoQUEFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$25	; into the $04E2 run (loaded, not used)
	db 6,5,11						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-20,19				; x from, x to, y from, y to (a box: not traced)
	dw 18							; palette number (SpritePalettes)
	dw (LogoQUEFramesEnd-LogoQUEFrames)/2	; number of frames
	db $03							; not traced
