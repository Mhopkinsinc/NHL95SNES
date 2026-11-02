; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CA2159
FrameTiles24B:						; the raw tiles of frame $24B (FrameTileSource / FrameBankLayout entry
									; $24B); pose not traced
	incbin "../Extracted/segments/bankCA_2000.bin":$159..$3D9
FrameTiles24C:						; the raw tiles of frame $24C (FrameTileSource / FrameBankLayout entry
									; $24C); pose not traced
	incbin "../Extracted/segments/bankCA_2000.bin":$3D9..$639
FrameTiles24D:						; the raw tiles of frame $24D (FrameTileSource / FrameBankLayout entry
									; $24D); pose not traced
	incbin "../Extracted/segments/bankCA_2000.bin":$639..$839
FrameTiles24E:						; the raw tiles of frame $24E (FrameTileSource / FrameBankLayout entry
									; $24E); pose not traced
	incbin "../Extracted/segments/bankCA_2000.bin":$839..$AB9
FrameTiles24F:						; the raw tiles of frame $24F (FrameTileSource / FrameBankLayout entry
									; $24F); pose not traced
	incbin "../Extracted/segments/bankCA_2000.bin":$AB9..$D19
FrameTiles250:						; the raw tiles of frame $250 (FrameTileSource / FrameBankLayout entry
									; $250); pose not traced
	incbin "../Extracted/segments/bankCA_2000.bin":$D19..$F99
FrameTiles251:						; the raw tiles of frame $251 (FrameTileSource / FrameBankLayout entry
									; $251); pose not traced
	incbin "../Extracted/segments/bankCA_2000.bin":$F99..$1000
	incbin "../Extracted/segments/bankCA_3000.bin":$0..$219
