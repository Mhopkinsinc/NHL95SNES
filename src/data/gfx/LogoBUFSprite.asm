LogoBUFSprite:						; the BUF logo
	dw LogoBUFFrames,LogoBUFFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$05	; into the $04E2 run (loaded, not used)
	db 4,8,12						; the most 8x8, 16x16 and both sprites in a frame
	dw -22,25,-24,31				; x from, x to, y from, y to (a box: not traced)
	dw 2							; palette number (SpritePalettes)
	dw (LogoBUFFramesEnd-LogoBUFFrames)/2	; number of frames
	db $03							; not traced
