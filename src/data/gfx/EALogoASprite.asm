EALogoASprite:						; the big A of the EA logo
	dw EALogoAFrames,EALogoAFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$45	; into the $04E2 run (loaded, not used)
	db 0,19,19						; the most 8x8, 16x16 and both sprites in a frame
	dw -40,47,-38,41				; x from, x to, y from, y to (a box: not traced)
	dw 33							; palette number (SpritePalettes)
	dw (EALogoAFramesEnd-EALogoAFrames)/2	; number of frames
	db $02							; not traced
