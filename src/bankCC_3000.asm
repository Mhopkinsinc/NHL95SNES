; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CC3085
FrameTiles38E:						; the raw tiles of frame $38E (FrameTileSource / FrameBankLayout entry
									; $38E); pose not traced
	incbin "../Extracted/segments/bankCC_3000.bin":$85..$285
FrameTiles38F:						; the raw tiles of frame $38F (FrameTileSource / FrameBankLayout entry
									; $38F); pose not traced
	incbin "../Extracted/segments/bankCC_3000.bin":$285..$485
FrameTiles390:						; the raw tiles of frame $390 (FrameTileSource / FrameBankLayout entry
									; $390); pose not traced
	incbin "../Extracted/segments/bankCC_3000.bin":$485..$685
FrameTiles391:						; the raw tiles of frame $391 (FrameTileSource / FrameBankLayout entry
									; $391); pose not traced
	incbin "../Extracted/segments/bankCC_3000.bin":$685..$8E5
FrameTiles392:						; the raw tiles of frame $392 (FrameTileSource / FrameBankLayout entry
									; $392); pose not traced
	incbin "../Extracted/segments/bankCC_3000.bin":$8E5..$B45
FrameTiles393:						; the raw tiles of frame $393 (FrameTileSource / FrameBankLayout entry
									; $393); pose not traced
	incbin "../Extracted/segments/bankCC_3000.bin":$B45..$DA5
FrameTiles394:						; the raw tiles of frame $394 (FrameTileSource / FrameBankLayout entry
									; $394); pose not traced
	incbin "../Extracted/segments/bankCC_3000.bin":$DA5..$FA5
FrameTiles395:						; the raw tiles of frame $395 (FrameTileSource / FrameBankLayout entry
									; $395); pose not traced
	incbin "../Extracted/segments/bankCC_3000.bin":$FA5..$1000
	incbin "../Extracted/segments/bankCC_4000.bin":$0..$205
