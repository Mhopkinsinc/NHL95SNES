LogoNYRSprite:						; the NYR logo
	dw LogoNYRFrames,LogoNYRFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$1D	; into the $04E2 run (loaded, not used)
	db 0,9,9						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-24,23				; x from, x to, y from, y to (a box: not traced)
	dw 14							; palette number (SpritePalettes)
	dw (LogoNYRFramesEnd-LogoNYRFrames)/2	; number of frames
	db $03							; not traced
