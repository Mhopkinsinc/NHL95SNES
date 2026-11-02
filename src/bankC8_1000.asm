; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C811B9
FrameTiles106:						; the raw tiles of frame $106 (FrameTileSource / FrameBankLayout entry
									; $106); pose not traced
	incbin "../Extracted/segments/bankC8_1000.bin":$1B9..$439
FrameTiles107:						; the raw tiles of frame $107 (FrameTileSource / FrameBankLayout entry
									; $107); pose not traced
	incbin "../Extracted/segments/bankC8_1000.bin":$439..$6B9
FrameTiles108:						; the raw tiles of frame $108 (FrameTileSource / FrameBankLayout entry
									; $108); pose not traced
	incbin "../Extracted/segments/bankC8_1000.bin":$6B9..$939
FrameTiles109:						; the raw tiles of frame $109 (FrameTileSource / FrameBankLayout entry
									; $109); pose not traced
	incbin "../Extracted/segments/bankC8_1000.bin":$939..$BB9
FrameTiles10A:						; the raw tiles of frame $10A (FrameTileSource / FrameBankLayout entry
									; $10A); pose not traced
	incbin "../Extracted/segments/bankC8_1000.bin":$BB9..$DB9
FrameTiles10B:						; the raw tiles of frame $10B (FrameTileSource / FrameBankLayout entry
									; $10B); pose not traced
	incbin "../Extracted/segments/bankC8_1000.bin":$DB9..$FB9
FrameTiles10C:						; the raw tiles of frame $10C (FrameTileSource / FrameBankLayout entry
									; $10C); pose not traced
	incbin "../Extracted/segments/bankC8_1000.bin":$FB9..$1000
	incbin "../Extracted/segments/bankC8_2000.bin":$0..$239
