; Raw planar frame tiles, then the map chunk of IceRinkMap; its tiles and colours are in the next segment.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CCE1E5
FrameTiles41E:						; the raw tiles of frame $41E (FrameTileSource / FrameBankLayout entry
									; $41E); pose not traced
	incbin "../Extracted/segments/bankCC_E000.bin":$1E5..$3E5
FrameTiles41F:						; the raw tiles of frame $41F (FrameTileSource / FrameBankLayout entry
									; $41F); pose not traced
	incbin "../Extracted/segments/bankCC_E000.bin":$3E5..$5E5
FrameTiles420:						; the raw tiles of frame $420 (FrameTileSource / FrameBankLayout entry
									; $420); pose not traced
	incbin "../Extracted/segments/bankCC_E000.bin":$5E5..$7E5
FrameTiles421:						; the raw tiles of frame $421 (FrameTileSource / FrameBankLayout entry
									; $421); pose not traced
	incbin "../Extracted/segments/bankCC_E000.bin":$7E5..$A45
FrameTiles422:						; the raw tiles of frame $422 (FrameTileSource / FrameBankLayout entry
									; $422); pose not traced
	incbin "../Extracted/segments/bankCC_E000.bin":$A45..$CA5
FrameTiles423:						; the raw tiles of frame $423 (FrameTileSource / FrameBankLayout entry
									; $423); pose not traced
	incbin "../Extracted/segments/bankCC_E000.bin":$CA5..$EA5
IceRinkMap:							; the rink, 32 x 170 tiles (both halves); setupice loads it
	dw IceRinkTiles-IceRinkMap-2	; map chunk length
	db $20,$AA						; width and height in tiles
	db $8C							; packed word map; other flag bits not traced
	dw $2A80						; unpacked map size
	incbin "../Extracted/segments/bankCC_E000.bin":$EAC..$1000
	incbin "../Extracted/segments/bankCC_F000.bin":$0..$E36
