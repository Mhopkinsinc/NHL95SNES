; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CC4205
FrameTiles396:						; the raw tiles of frame $396 (FrameTileSource / FrameBankLayout entry
									; $396); pose not traced
	incbin "../Extracted/segments/bankCC_4000.bin":$205..$465
FrameTiles397:						; the raw tiles of frame $397 (FrameTileSource / FrameBankLayout entry
									; $397); pose not traced
	incbin "../Extracted/segments/bankCC_4000.bin":$465..$6C5
FrameTiles398:						; the raw tiles of frame $398 (FrameTileSource / FrameBankLayout entry
									; $398); pose not traced
	incbin "../Extracted/segments/bankCC_4000.bin":$6C5..$8C5
FrameTiles399:						; the raw tiles of frame $399 (FrameTileSource / FrameBankLayout entry
									; $399); pose not traced
	incbin "../Extracted/segments/bankCC_4000.bin":$8C5..$B45
FrameTiles39A:						; the raw tiles of frame $39A (FrameTileSource / FrameBankLayout entry
									; $39A); pose not traced
	incbin "../Extracted/segments/bankCC_4000.bin":$B45..$DA5
FrameTiles39B:						; the raw tiles of frame $39B (FrameTileSource / FrameBankLayout entry
									; $39B); pose not traced
	incbin "../Extracted/segments/bankCC_4000.bin":$DA5..$FA5
FrameTiles39C:						; the raw tiles of frame $39C (FrameTileSource / FrameBankLayout entry
									; $39C); pose not traced
	incbin "../Extracted/segments/bankCC_4000.bin":$FA5..$1000
	incbin "../Extracted/segments/bankCC_5000.bin":$0..$1E5
