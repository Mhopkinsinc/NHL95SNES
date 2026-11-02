; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CC11A5
FrameTiles380:						; the raw tiles of frame $380 (FrameTileSource / FrameBankLayout entry
									; $380); pose not traced
	incbin "../Extracted/segments/bankCC_1000.bin":$1A5..$405
FrameTiles381:						; the raw tiles of frame $381 (FrameTileSource / FrameBankLayout entry
									; $381); pose not traced
	incbin "../Extracted/segments/bankCC_1000.bin":$405..$685
FrameTiles382:						; the raw tiles of frame $382 (FrameTileSource / FrameBankLayout entry
									; $382); pose not traced
	incbin "../Extracted/segments/bankCC_1000.bin":$685..$8E5
FrameTiles383:						; the raw tiles of frame $383 (FrameTileSource / FrameBankLayout entry
									; $383); pose not traced
	incbin "../Extracted/segments/bankCC_1000.bin":$8E5..$B45
FrameTiles384:						; the raw tiles of frame $384 (FrameTileSource / FrameBankLayout entry
									; $384); pose not traced
	incbin "../Extracted/segments/bankCC_1000.bin":$B45..$D45
FrameTiles385:						; the raw tiles of frame $385 (FrameTileSource / FrameBankLayout entry
									; $385); pose not traced
	incbin "../Extracted/segments/bankCC_1000.bin":$D45..$FA5
FrameTiles386:						; the raw tiles of frame $386 (FrameTileSource / FrameBankLayout entry
									; $386); pose not traced
	incbin "../Extracted/segments/bankCC_1000.bin":$FA5..$1000
	incbin "../Extracted/segments/bankCC_2000.bin":$0..$225
