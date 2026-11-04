EALogoESprite:						; the big E of the EA logo
	dw EALogoEFrames,EALogoEFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$43	; into the $04E2 run (loaded, not used)
	db 0,24,24						; the most 8x8, 16x16 and both sprites in a frame
	dw -44,51,-38,41				; x from, x to, y from, y to (a box: not traced)
	dw 33							; palette number (SpritePalettes)
	dw (EALogoEFramesEnd-EALogoEFrames)/2	; number of frames
	db $02							; not traced
