; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CA3219
FrameTiles252:						; the raw tiles of frame $252 (FrameTileSource / FrameBankLayout entry
									; $252); pose not traced
	incbin "../Extracted/segments/bankCA_3000.bin":$219..$439
FrameTiles253:						; the raw tiles of frame $253 (FrameTileSource / FrameBankLayout entry
									; $253); pose not traced
	incbin "../Extracted/segments/bankCA_3000.bin":$439..$6B9
FrameTiles254:						; the raw tiles of frame $254 (FrameTileSource / FrameBankLayout entry
									; $254); pose not traced
	incbin "../Extracted/segments/bankCA_3000.bin":$6B9..$939
FrameTiles255:						; the raw tiles of frame $255 (FrameTileSource / FrameBankLayout entry
									; $255); pose not traced
	incbin "../Extracted/segments/bankCA_3000.bin":$939..$B99
FrameTiles256:						; the raw tiles of frame $256 (FrameTileSource / FrameBankLayout entry
									; $256); pose not traced
	incbin "../Extracted/segments/bankCA_3000.bin":$B99..$DF9
FrameTiles257:						; the raw tiles of frame $257 (FrameTileSource / FrameBankLayout entry
									; $257); pose not traced
	incbin "../Extracted/segments/bankCA_3000.bin":$DF9..$1000
	incbin "../Extracted/segments/bankCA_4000.bin":$0..$79
