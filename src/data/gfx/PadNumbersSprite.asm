PadNumbersSprite:					; a controller, then the numbers 1 to 5
	dw PadNumbersFrames,PadNumbersFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$3B	; into the $04E2 run (loaded, not used)
	db 3,2,3						; the most 8x8, 16x16 and both sprites in a frame
	dw -15,16,-11,13				; x from, x to, y from, y to (a box: not traced)
	dw 29							; palette number (SpritePalettes)
	dw (PadNumbersFramesEnd-PadNumbersFrames)/2	; number of frames
	db $03							; not traced
