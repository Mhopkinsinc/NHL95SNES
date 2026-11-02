; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CAC219
FrameTiles29A:						; the raw tiles of frame $29A (FrameTileSource / FrameBankLayout entry
									; $29A); pose not traced
	incbin "../Extracted/segments/bankCA_C000.bin":$219..$479
FrameTiles29B:						; the raw tiles of frame $29B (FrameTileSource / FrameBankLayout entry
									; $29B); pose not traced
	incbin "../Extracted/segments/bankCA_C000.bin":$479..$679
FrameTiles29D:						; the raw tiles of frame $29D (FrameTileSource / FrameBankLayout entry
									; $29D); pose not traced
	incbin "../Extracted/segments/bankCA_C000.bin":$679..$8D9
FrameTiles29E:						; the raw tiles of frame $29E (FrameTileSource / FrameBankLayout entry
									; $29E); pose not traced
	incbin "../Extracted/segments/bankCA_C000.bin":$8D9..$AD9
FrameTiles29F:						; the raw tiles of frame $29F (FrameTileSource / FrameBankLayout entry
									; $29F); pose not traced
	incbin "../Extracted/segments/bankCA_C000.bin":$AD9..$CD9
FrameTiles2A0:						; the raw tiles of frame $2A0 (FrameTileSource / FrameBankLayout entry
									; $2A0); pose not traced
	incbin "../Extracted/segments/bankCA_C000.bin":$CD9..$ED9
FrameTiles2A1:						; the raw tiles of frame $2A1 (FrameTileSource / FrameBankLayout entry
									; $2A1); pose not traced
	incbin "../Extracted/segments/bankCA_C000.bin":$ED9..$1000
	incbin "../Extracted/segments/bankCA_D000.bin":$0..$D9
