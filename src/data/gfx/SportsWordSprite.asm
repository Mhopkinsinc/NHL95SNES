SportsWordSprite:					; part of the word SPORTS
	dw SportsWordFrames,SportsWordFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$47	; into the $04E2 run (loaded, not used)
	db 0,19,19						; the most 8x8, 16x16 and both sprites in a frame
	dw -75,84,-13,18				; x from, x to, y from, y to (a box: not traced)
	dw 34							; palette number (SpritePalettes)
	dw (SportsWordFramesEnd-SportsWordFrames)/2	; number of frames
	db $02							; not traced
