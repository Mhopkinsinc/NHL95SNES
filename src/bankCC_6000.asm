; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CC61A5
FrameTiles3A4:						; the raw tiles of frame $3A4 (FrameTileSource / FrameBankLayout entry
									; $3A4); pose not traced
	incbin "../Extracted/segments/bankCC_6000.bin":$1A5..$425
FrameTiles3A5:						; the raw tiles of frame $3A5 (FrameTileSource / FrameBankLayout entry
									; $3A5); pose not traced
	incbin "../Extracted/segments/bankCC_6000.bin":$425..$6A5
FrameTiles3A6:						; the raw tiles of frame $3A6 (FrameTileSource / FrameBankLayout entry
									; $3A6); pose not traced
	incbin "../Extracted/segments/bankCC_6000.bin":$6A5..$8A5
FrameTiles3A7:						; the raw tiles of frame $3A7 (FrameTileSource / FrameBankLayout entry
									; $3A7); pose not traced
	incbin "../Extracted/segments/bankCC_6000.bin":$8A5..$B05
FrameTiles3A8:						; the raw tiles of frame $3A8 (FrameTileSource / FrameBankLayout entry
									; $3A8); pose not traced
	incbin "../Extracted/segments/bankCC_6000.bin":$B05..$D05
FrameTiles3A9:						; the raw tiles of frame $3A9 (FrameTileSource / FrameBankLayout entry
									; $3A9); pose not traced
	incbin "../Extracted/segments/bankCC_6000.bin":$D05..$F05
FrameTiles3AA:						; the raw tiles of frame $3AA (FrameTileSource / FrameBankLayout entry
									; $3AA); pose not traced
	incbin "../Extracted/segments/bankCC_6000.bin":$F05..$1000
	incbin "../Extracted/segments/bankCC_7000.bin":$0..$105
