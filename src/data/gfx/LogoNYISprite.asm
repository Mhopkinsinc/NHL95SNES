LogoNYISprite:						; the NYI logo
	dw LogoNYIFrames,LogoNYIFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$1B	; into the $04E2 run (loaded, not used)
	db 4,8,12						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-28,27				; x from, x to, y from, y to (a box: not traced)
	dw 13							; palette number (SpritePalettes)
	dw (LogoNYIFramesEnd-LogoNYIFrames)/2	; number of frames
	db $03							; not traced
