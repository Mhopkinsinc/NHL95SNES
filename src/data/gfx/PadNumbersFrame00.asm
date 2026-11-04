PadNumbersFrame00:					; 0 8x8 and 2 16x16 sprites, packed tiles (flags 2)
	db 0,2							; the 8x8 and 16x16 sprite counts
	dw PadNumbersPieces00-SpritePieces	; its pieces
	db 2							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl PadNumbersTiles00			; its tiles
PadNumbersFrame01:					; 3 8x8 and 0 16x16 sprites, packed tiles
	db 3,0							; the 8x8 and 16x16 sprite counts
	dw PadNumbersPieces01-SpritePieces	; its pieces
	db 1							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl PadNumbersTiles01			; its tiles
PadNumbersFrame02:					; 1 8x8 and 1 16x16 sprites, packed tiles (flags 3)
	db 1,1							; the 8x8 and 16x16 sprite counts
	dw PadNumbersPieces02-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl PadNumbersTiles02			; its tiles
PadNumbersFrame03:					; 2 8x8 and 1 16x16 sprites, packed tiles (flags 3)
	db 2,1							; the 8x8 and 16x16 sprite counts
	dw PadNumbersPieces03-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl PadNumbersTiles03			; its tiles
PadNumbersFrame04:					; 0 8x8 and 1 16x16 sprites, packed tiles (flags 2)
	db 0,1							; the 8x8 and 16x16 sprite counts
	dw PadNumbersPieces04-SpritePieces	; its pieces
	db 2							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl PadNumbersTiles04			; its tiles
PadNumbersFrame05:					; 1 8x8 and 1 16x16 sprites, packed tiles (flags 3)
	db 1,1							; the 8x8 and 16x16 sprite counts
	dw PadNumbersPieces02-SpritePieces	; its pieces
	db 3							; flags: bit 0 packed, bit 1 the 16x16 part packed
	dl PadNumbersTiles05			; its tiles
