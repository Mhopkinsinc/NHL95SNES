SkaterSprite:						; a skating player: the face off box's centre (puckfaceoff2 makes
									; FaceoffSpriteLeft / FaceoffSpriteRight), two stick swings of 3 frames
	dw SkaterFrames,SkaterFramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$3D	; into the $04E2 run (loaded, not used)
	db 11,8,18						; the most 8x8, 16x16 and both sprites in a frame
	dw 0,63,-61,7					; x from, x to, y from, y to (a box: not traced)
	dw 30							; palette number (SpritePalettes)
	dw (SkaterFramesEnd-SkaterFrames)/2	; number of frames
	db $03							; not traced
