LogoCGYSprite:						; the CGY logo
	dw LogoCGYFrames,LogoCGYFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$07	; into the $04E2 run (loaded, not used)
	db 3,8,11						; the most 8x8, 16x16 and both sprites in a frame
	dw -24,23,-24,23				; x from, x to, y from, y to (a box: not traced)
	dw 3							; palette number (SpritePalettes)
	dw (LogoCGYFramesEnd-LogoCGYFrames)/2	; number of frames
	db $03							; not traced
