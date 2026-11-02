; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CC8025
FrameTiles3B2:						; the raw tiles of frame $3B2 (FrameTileSource / FrameBankLayout entry
									; $3B2); pose not traced
	incbin "../Extracted/segments/bankCC_8000.bin":$25..$225
FrameTiles3B3:						; the raw tiles of frame $3B3 (FrameTileSource / FrameBankLayout entry
									; $3B3); pose not traced
	incbin "../Extracted/segments/bankCC_8000.bin":$225..$425
FrameTiles3B4:						; the raw tiles of frame $3B4 (FrameTileSource / FrameBankLayout entry
									; $3B4); pose not traced
	incbin "../Extracted/segments/bankCC_8000.bin":$425..$6A5
FrameTiles3B5:						; the raw tiles of frame $3B5 (FrameTileSource / FrameBankLayout entry
									; $3B5); pose not traced
	incbin "../Extracted/segments/bankCC_8000.bin":$6A5..$925
FrameTiles3B6:						; the raw tiles of frame $3B6 (FrameTileSource / FrameBankLayout entry
									; $3B6); pose not traced
	incbin "../Extracted/segments/bankCC_8000.bin":$925..$BA5
FrameTiles3B7:						; the raw tiles of frame $3B7 (FrameTileSource / FrameBankLayout entry
									; $3B7); pose not traced
	incbin "../Extracted/segments/bankCC_8000.bin":$BA5..$E25
FrameTiles3B8:						; the raw tiles of frame $3B8 (FrameTileSource / FrameBankLayout entry
									; $3B8); pose not traced
	incbin "../Extracted/segments/bankCC_8000.bin":$E25..$1000
	incbin "../Extracted/segments/bankCC_9000.bin":$0..$A5
