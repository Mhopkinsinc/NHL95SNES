LogoEDMSprite:						; the EDM logo
	dw LogoEDMFrames,LogoEDMFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$0F	; into the $04E2 run (loaded, not used)
	db 0,9,9						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-24,23				; x from, x to, y from, y to (a box: not traced)
	dw 7							; palette number (SpritePalettes)
	dw (LogoEDMFramesEnd-LogoEDMFrames)/2	; number of frames
	db $03							; not traced
