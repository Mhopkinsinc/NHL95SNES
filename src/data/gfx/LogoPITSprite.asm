LogoPITSprite:						; the PIT logo
	dw LogoPITFrames,LogoPITFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$23	; into the $04E2 run (loaded, not used)
	db 6,5,11						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-24,23				; x from, x to, y from, y to (a box: not traced)
	dw 17							; palette number (SpritePalettes)
	dw (LogoPITFramesEnd-LogoPITFrames)/2	; number of frames
	db $03							; not traced
