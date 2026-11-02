; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CB70D5
FrameTiles339:						; the raw tiles of frame $339 (FrameTileSource / FrameBankLayout entry
									; $339); pose not traced
	incbin "../Extracted/segments/bankCB_7000.bin":$D5..$2D5
FrameTiles33A:						; the raw tiles of frame $33A (FrameTileSource / FrameBankLayout entry
									; $33A); pose not traced
	incbin "../Extracted/segments/bankCB_7000.bin":$2D5..$4D5
FrameTiles33B:						; the raw tiles of frame $33B (FrameTileSource / FrameBankLayout entry
									; $33B); pose not traced
	incbin "../Extracted/segments/bankCB_7000.bin":$4D5..$6D5
FrameTiles33C:						; the raw tiles of frame $33C (FrameTileSource / FrameBankLayout entry
									; $33C); pose not traced
	incbin "../Extracted/segments/bankCB_7000.bin":$6D5..$935
FrameTiles33D:						; the raw tiles of frame $33D (FrameTileSource / FrameBankLayout entry
									; $33D); pose not traced
	incbin "../Extracted/segments/bankCB_7000.bin":$935..$B35
FrameTiles33E:						; the raw tiles of frame $33E (FrameTileSource / FrameBankLayout entry
									; $33E); pose not traced
	incbin "../Extracted/segments/bankCB_7000.bin":$B35..$D95
FrameTiles33F:						; the raw tiles of frame $33F (FrameTileSource / FrameBankLayout entry
									; $33F); pose not traced
	incbin "../Extracted/segments/bankCB_7000.bin":$D95..$F95
FrameTiles340:						; the raw tiles of frame $340 (FrameTileSource / FrameBankLayout entry
									; $340); pose not traced
	incbin "../Extracted/segments/bankCB_7000.bin":$F95..$1000
	incbin "../Extracted/segments/bankCB_8000.bin":$0..$1F5
