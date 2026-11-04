LogoOTWSprite:						; the OTW logo
	dw LogoOTWFrames,LogoOTWFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$1F	; into the $04E2 run (loaded, not used)
	db 7,6,13						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-24,23				; x from, x to, y from, y to (a box: not traced)
	dw 15							; palette number (SpritePalettes)
	dw (LogoOTWFramesEnd-LogoOTWFrames)/2	; number of frames
	db $03							; not traced
