LogoDALSprite:						; the DAL logo
	dw LogoDALFrames,LogoDALFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$0B	; into the $04E2 run (loaded, not used)
	db 10,5,15						; the most 8x8, 16x16 and both sprites in a frame
	dw -23,32,-24,23				; x from, x to, y from, y to (a box: not traced)
	dw 5							; palette number (SpritePalettes)
	dw (LogoDALFramesEnd-LogoDALFrames)/2	; number of frames
	db $03							; not traced
