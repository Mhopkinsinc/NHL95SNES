; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CAB219
FrameTiles28F:						; the raw tiles of frame $28F (FrameTileSource / FrameBankLayout entry
									; $28F); pose not traced
	incbin "../Extracted/segments/bankCA_B000.bin":$219..$419
FrameTiles291:						; the raw tiles of frame $291 (FrameTileSource / FrameBankLayout entry
									; $291); pose not traced
	incbin "../Extracted/segments/bankCA_B000.bin":$419..$699
FrameTiles292:						; the raw tiles of frame $292 (FrameTileSource / FrameBankLayout entry
									; $292); pose not traced
	incbin "../Extracted/segments/bankCA_B000.bin":$699..$899
FrameTiles294:						; the raw tiles of frame $294 (FrameTileSource / FrameBankLayout entry
									; $294); pose not traced
	incbin "../Extracted/segments/bankCA_B000.bin":$899..$AF9
FrameTiles295:						; the raw tiles of frame $295 (FrameTileSource / FrameBankLayout entry
									; $295); pose not traced
	incbin "../Extracted/segments/bankCA_B000.bin":$AF9..$D59
FrameTiles297:						; the raw tiles of frame $297 (FrameTileSource / FrameBankLayout entry
									; $297); pose not traced
	incbin "../Extracted/segments/bankCA_B000.bin":$D59..$FB9
FrameTiles298:						; the raw tiles of frame $298 (FrameTileSource / FrameBankLayout entry
									; $298); pose not traced
	incbin "../Extracted/segments/bankCA_B000.bin":$FB9..$1000
	incbin "../Extracted/segments/bankCA_C000.bin":$0..$219
