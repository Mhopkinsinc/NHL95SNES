MenuBackMap:						; the menu screens' background: a 16 x 3 block of tiles repeated over a 32
									; x 28 tilemap, LZSS packed; screen set-ups (SetupScreen, setoptions,
									; ScoutingReport ...) have the map unpacker send it to VRAM
	dw .end-.width					; bytes after this word
.width:								; map width in tiles
	db $20
	db $1C							; height in tiles
	db $8C							; flags: bit 7 LZSS packed
	dw $0700						; unpacked size in bytes, then the LZSS stream
	incbin "../../../Extracted/segments/bankC0_8000.bin":$7F9..$939
.end:								; the end of the set
