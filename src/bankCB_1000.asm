; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CB1175
FrameTiles2DA:						; the raw tiles of frame $2DA (FrameTileSource / FrameBankLayout entry
									; $2DA); pose not traced
	incbin "../Extracted/segments/bankCB_1000.bin":$175..$3D5
FrameTiles2DB:						; the raw tiles of frame $2DB (FrameTileSource / FrameBankLayout entry
									; $2DB); pose not traced
	incbin "../Extracted/segments/bankCB_1000.bin":$3D5..$635
FrameTiles2DC:						; the raw tiles of frame $2DC (FrameTileSource / FrameBankLayout entry
									; $2DC); pose not traced
	incbin "../Extracted/segments/bankCB_1000.bin":$635..$895
FrameTiles2DD:						; the raw tiles of frame $2DD (FrameTileSource / FrameBankLayout entry
									; $2DD); pose not traced
	incbin "../Extracted/segments/bankCB_1000.bin":$895..$AF5
FrameTiles2DE:						; the raw tiles of frame $2DE (FrameTileSource / FrameBankLayout entry
									; $2DE); pose not traced
	incbin "../Extracted/segments/bankCB_1000.bin":$AF5..$D55
FrameTiles2DF:						; the raw tiles of frame $2DF (FrameTileSource / FrameBankLayout entry
									; $2DF); pose not traced
	incbin "../Extracted/segments/bankCB_1000.bin":$D55..$F55
FrameTiles2E0:						; the raw tiles of frame $2E0 (FrameTileSource / FrameBankLayout entry
									; $2E0); pose not traced
	incbin "../Extracted/segments/bankCB_1000.bin":$F55..$1000
	incbin "../Extracted/segments/bankCB_2000.bin":$0..$155
