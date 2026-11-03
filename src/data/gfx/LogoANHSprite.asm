LogoANHSprite:						; the ANH logo
	dw LogoANHFrames,LogoANHFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$00	; into the $04E2 run (loaded, not used)
	db 4,8,12						; the most 8x8, 16x16 and both sprites in a frame
	dw -25,30,-24,23				; x from, x to, y from, y to (a box: not traced)
	dw 0							; palette number (SpritePalettes)
	dw (LogoANHFramesEnd-LogoANHFrames)/2	; number of frames
	db $03							; not traced
