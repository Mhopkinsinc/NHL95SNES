LogoDETSprite:						; the DET logo
	dw LogoDETFrames,LogoDETFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$0D	; into the $04E2 run (loaded, not used)
	db 11,4,15						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-24,23				; x from, x to, y from, y to (a box: not traced)
	dw 6							; palette number (SpritePalettes)
	dw (LogoDETFramesEnd-LogoDETFrames)/2	; number of frames
	db $03							; not traced
