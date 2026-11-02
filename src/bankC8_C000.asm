; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C8C059
FrameTiles188:						; the raw tiles of frame $188 (FrameTileSource / FrameBankLayout entry
									; $188); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$59..$2D9
FrameTiles189:						; the raw tiles of frame $189 (FrameTileSource / FrameBankLayout entry
									; $189); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$2D9..$559
FrameTiles18A:						; the raw tiles of frame $18A (FrameTileSource / FrameBankLayout entry
									; $18A); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$559..$759
FrameTiles1B3:						; the raw tiles of frame $1B3 (FrameTileSource / FrameBankLayout entry
									; $1B3); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$759..$779
FrameTiles1B4:						; the raw tiles of frame $1B4 (FrameTileSource / FrameBankLayout entry
									; $1B4); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$779..$799
FrameTiles1B5:						; the raw tiles of frame $1B5 (FrameTileSource / FrameBankLayout entry
									; $1B5); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$799..$7B9
FrameTiles1B6:						; the raw tiles of frame $1B6 (FrameTileSource / FrameBankLayout entry
									; $1B6); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$7B9..$7D9
FrameTiles1B7:						; the raw tiles of frame $1B7 (FrameTileSource / FrameBankLayout entry
									; $1B7); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$7D9..$7F9
FrameTiles1B8:						; the raw tiles of frame $1B8 (FrameTileSource / FrameBankLayout entry
									; $1B8); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$7F9..$819
FrameTiles1B9:						; the raw tiles of frame $1B9 (FrameTileSource / FrameBankLayout entry
									; $1B9); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$819..$839
FrameTiles1BA:						; the raw tiles of frame $1BA (FrameTileSource / FrameBankLayout entry
									; $1BA); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$839..$859
FrameTiles1BB:						; the raw tiles of frame $1BB (FrameTileSource / FrameBankLayout entry
									; $1BB); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$859..$879
FrameTiles1BC:						; the raw tiles of frame $1BC (FrameTileSource / FrameBankLayout entry
									; $1BC); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$879..$899
FrameTiles1BD:						; the raw tiles of frame $1BD (FrameTileSource / FrameBankLayout entry
									; $1BD); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$899..$8B9
FrameTiles1BE:						; the raw tiles of frame $1BE (FrameTileSource / FrameBankLayout entry
									; $1BE); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$8B9..$B19
FrameTiles1BF:						; the raw tiles of frame $1BF (FrameTileSource / FrameBankLayout entry
									; $1BF); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$B19..$D19
FrameTiles1C0:						; the raw tiles of frame $1C0 (FrameTileSource / FrameBankLayout entry
									; $1C0); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$D19..$F19
FrameTiles1C1:						; the raw tiles of frame $1C1 (FrameTileSource / FrameBankLayout entry
									; $1C1); pose not traced
	incbin "../Extracted/segments/bankC8_C000.bin":$F19..$1000
	incbin "../Extracted/segments/bankC8_D000.bin":$0..$199
