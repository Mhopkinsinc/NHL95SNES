EASportsSprite:						; the EA SPORTS logo
	dw EASportsFrames,EASportsFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$41	; into the $04E2 run (loaded, not used)
	db 4,2,6						; the most 8x8, 16x16 and both sprites in a frame
	dw -15,16,-11,12				; x from, x to, y from, y to (a box: not traced)
	dw 32							; palette number (SpritePalettes)
	dw (EASportsFramesEnd-EASportsFrames)/2	; number of frames
	db $03							; not traced
