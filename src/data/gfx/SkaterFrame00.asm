SkaterFrame00:						; 7 8x8 and 6 16x16 sprites, packed tiles (flags 3)
	db 7,6							; the 8x8 and 16x16 sprite counts
	dw SkaterPieces00-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl SkaterTiles00				; its tiles
SkaterFrame01:						; 6 8x8 and 8 16x16 sprites, packed tiles (flags 3)
	db 6,8							; the 8x8 and 16x16 sprite counts
	dw SkaterPieces01-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl SkaterTiles01				; its tiles
SkaterFrame02:						; 10 8x8 and 5 16x16 sprites, packed tiles (flags 3)
	db 10,5							; the 8x8 and 16x16 sprite counts
	dw SkaterPieces02-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl SkaterTiles02				; its tiles
SkaterFrame03:						; 11 8x8 and 7 16x16 sprites, packed tiles (flags 3)
	db 11,7							; the 8x8 and 16x16 sprite counts
	dw SkaterPieces03-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl SkaterTiles03				; its tiles
SkaterFrame04:						; 6 8x8 and 7 16x16 sprites, packed tiles (flags 3)
	db 6,7							; the 8x8 and 16x16 sprite counts
	dw SkaterPieces04-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl SkaterTiles04				; its tiles
SkaterFrame05:						; 5 8x8 and 7 16x16 sprites, packed tiles (flags 3)
	db 5,7							; the 8x8 and 16x16 sprite counts
	dw SkaterPieces05-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl SkaterTiles05				; its tiles
