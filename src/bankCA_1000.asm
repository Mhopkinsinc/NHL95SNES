; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CA1099
FrameTiles244:						; the raw tiles of frame $244 (FrameTileSource / FrameBankLayout entry
									; $244); pose not traced
	incbin "../Extracted/segments/bankCA_1000.bin":$99..$2F9
FrameTiles245:						; the raw tiles of frame $245 (FrameTileSource / FrameBankLayout entry
									; $245); pose not traced
	incbin "../Extracted/segments/bankCA_1000.bin":$2F9..$579
FrameTiles246:						; the raw tiles of frame $246 (FrameTileSource / FrameBankLayout entry
									; $246); pose not traced
	incbin "../Extracted/segments/bankCA_1000.bin":$579..$7F9
FrameTiles247:						; the raw tiles of frame $247 (FrameTileSource / FrameBankLayout entry
									; $247); pose not traced
	incbin "../Extracted/segments/bankCA_1000.bin":$7F9..$A79
FrameTiles248:						; the raw tiles of frame $248 (FrameTileSource / FrameBankLayout entry
									; $248); pose not traced
	incbin "../Extracted/segments/bankCA_1000.bin":$A79..$C79
FrameTiles249:						; the raw tiles of frame $249 (FrameTileSource / FrameBankLayout entry
									; $249); pose not traced
	incbin "../Extracted/segments/bankCA_1000.bin":$C79..$EF9
FrameTiles24A:						; the raw tiles of frame $24A (FrameTileSource / FrameBankLayout entry
									; $24A); pose not traced
	incbin "../Extracted/segments/bankCA_1000.bin":$EF9..$1000
	incbin "../Extracted/segments/bankCA_2000.bin":$0..$159
