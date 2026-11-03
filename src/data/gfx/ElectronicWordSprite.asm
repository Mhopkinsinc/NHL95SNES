ElectronicWordSprite:				; part of the words ELECTRONIC ARTS
	dw ElectronicWordFrames,ElectronicWordFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$49	; into the $04E2 run (loaded, not used)
	db 0,9,9						; the most 8x8, 16x16 and both sprites in a frame
	dw -72,71,-5,10					; x from, x to, y from, y to (a box: not traced)
	dw 34							; palette number (SpritePalettes)
	dw (ElectronicWordFramesEnd-ElectronicWordFrames)/2	; number of frames
	db $02							; not traced
