; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CCD265
FrameTiles3F8:						; the raw tiles of frame $3F8 (FrameTileSource / FrameBankLayout entry
									; $3F8); pose not traced
	incbin "../Extracted/segments/bankCC_D000.bin":$265..$465
FrameTiles3F9:						; the raw tiles of frame $3F9 (FrameTileSource / FrameBankLayout entry
									; $3F9); pose not traced
	incbin "../Extracted/segments/bankCC_D000.bin":$465..$6C5
FrameTiles3FA:						; the raw tiles of frame $3FA (FrameTileSource / FrameBankLayout entry
									; $3FA); pose not traced
	incbin "../Extracted/segments/bankCC_D000.bin":$6C5..$8C5
FrameTiles3FB:						; the raw tiles of frame $3FB (FrameTileSource / FrameBankLayout entry
									; $3FB); pose not traced
	incbin "../Extracted/segments/bankCC_D000.bin":$8C5..$B25
FrameTiles41B:						; the raw tiles of frame $41B (FrameTileSource / FrameBankLayout entry
									; $41B); pose not traced
	incbin "../Extracted/segments/bankCC_D000.bin":$B25..$D85
FrameTiles41C:						; the raw tiles of frame $41C (FrameTileSource / FrameBankLayout entry
									; $41C); pose not traced
	incbin "../Extracted/segments/bankCC_D000.bin":$D85..$FE5
FrameTiles41D:						; the raw tiles of frame $41D (FrameTileSource / FrameBankLayout entry
									; $41D); pose not traced
	incbin "../Extracted/segments/bankCC_D000.bin":$FE5..$1000
	incbin "../Extracted/segments/bankCC_E000.bin":$0..$1E5
