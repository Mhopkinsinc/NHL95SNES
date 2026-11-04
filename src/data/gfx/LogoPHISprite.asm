LogoPHISprite:						; the PHI logo
	dw LogoPHIFrames,LogoPHIFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$21	; into the $04E2 run (loaded, not used)
	db 5,6,11						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-20,19				; x from, x to, y from, y to (a box: not traced)
	dw 16							; palette number (SpritePalettes)
	dw (LogoPHIFramesEnd-LogoPHIFrames)/2	; number of frames
	db $03							; not traced
