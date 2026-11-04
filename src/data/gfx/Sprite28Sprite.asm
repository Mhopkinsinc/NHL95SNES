Sprite28Sprite:						; sprite 28, small symbols: up and down arrows (StartScrollList's scroll
									; marks), a shine on a ball, a sparkle, the copyright and registered marks
									; (CopyrightScreen)
	dw Sprite28Frames,Sprite28FramesEnd	; the frame list and its end (the script pointer)
	dl SpriteField4DataUnused+$39	; into the $04E2 run (loaded, not used)
	db 2,1,2						; the most 8x8, 16x16 and both sprites in a frame
	dw -7,10,-15,15					; x from, x to, y from, y to (a box: not traced)
	dw 28							; palette number (SpritePalettes)
	dw (Sprite28FramesEnd-Sprite28Frames)/2	; number of frames
	db $03							; not traced
