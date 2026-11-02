; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CBA115
FrameTiles34F:						; the raw tiles of frame $34F (FrameTileSource / FrameBankLayout entry
									; $34F); pose not traced
	incbin "../Extracted/segments/bankCB_A000.bin":$115..$375
FrameTiles350:						; the raw tiles of frame $350 (FrameTileSource / FrameBankLayout entry
									; $350); pose not traced
	incbin "../Extracted/segments/bankCB_A000.bin":$375..$5D5
FrameTiles351:						; the raw tiles of frame $351 (FrameTileSource / FrameBankLayout entry
									; $351); pose not traced
	incbin "../Extracted/segments/bankCB_A000.bin":$5D5..$835
FrameTiles352:						; the raw tiles of frame $352 (FrameTileSource / FrameBankLayout entry
									; $352); pose not traced
	incbin "../Extracted/segments/bankCB_A000.bin":$835..$AB5
FrameTiles353:						; the raw tiles of frame $353 (FrameTileSource / FrameBankLayout entry
									; $353); pose not traced
	incbin "../Extracted/segments/bankCB_A000.bin":$AB5..$D35
FrameTiles354:						; the raw tiles of frame $354 (FrameTileSource / FrameBankLayout entry
									; $354); pose not traced
	incbin "../Extracted/segments/bankCB_A000.bin":$D35..$FB5
FrameTiles355:						; the raw tiles of frame $355 (FrameTileSource / FrameBankLayout entry
									; $355); pose not traced
	incbin "../Extracted/segments/bankCB_A000.bin":$FB5..$1000
	incbin "../Extracted/segments/bankCB_B000.bin":$0..$235
