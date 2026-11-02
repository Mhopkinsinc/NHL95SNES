; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C8E139
FrameTiles1C9:						; the raw tiles of frame $1C9 (FrameTileSource / FrameBankLayout entry
									; $1C9); pose not traced
	incbin "../Extracted/segments/bankC8_E000.bin":$139..$3B9
FrameTiles1CA:						; the raw tiles of frame $1CA (FrameTileSource / FrameBankLayout entry
									; $1CA); pose not traced
	incbin "../Extracted/segments/bankC8_E000.bin":$3B9..$639
FrameTiles1CB:						; the raw tiles of frame $1CB (FrameTileSource / FrameBankLayout entry
									; $1CB); pose not traced
	incbin "../Extracted/segments/bankC8_E000.bin":$639..$8B9
FrameTiles1CC:						; the raw tiles of frame $1CC (FrameTileSource / FrameBankLayout entry
									; $1CC); pose not traced
	incbin "../Extracted/segments/bankC8_E000.bin":$8B9..$B39
FrameTiles1CD:						; the raw tiles of frame $1CD (FrameTileSource / FrameBankLayout entry
									; $1CD); pose not traced
	incbin "../Extracted/segments/bankC8_E000.bin":$B39..$D59
FrameTiles1CE:						; the raw tiles of frame $1CE (FrameTileSource / FrameBankLayout entry
									; $1CE); pose not traced
	incbin "../Extracted/segments/bankC8_E000.bin":$D59..$F59
FrameTiles1CF:						; the raw tiles of frame $1CF (FrameTileSource / FrameBankLayout entry
									; $1CF); pose not traced
	incbin "../Extracted/segments/bankC8_E000.bin":$F59..$1000
	incbin "../Extracted/segments/bankC8_F000.bin":$0..$1B9
