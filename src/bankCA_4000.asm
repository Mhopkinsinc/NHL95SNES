; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CA4079
FrameTiles258:						; the raw tiles of frame $258 (FrameTileSource / FrameBankLayout entry
									; $258); pose not traced
	incbin "../Extracted/segments/bankCA_4000.bin":$79..$2D9
FrameTiles259:						; the raw tiles of frame $259 (FrameTileSource / FrameBankLayout entry
									; $259); pose not traced
	incbin "../Extracted/segments/bankCA_4000.bin":$2D9..$559
FrameTiles25A:						; the raw tiles of frame $25A (FrameTileSource / FrameBankLayout entry
									; $25A); pose not traced
	incbin "../Extracted/segments/bankCA_4000.bin":$559..$7D9
FrameTiles25B:						; the raw tiles of frame $25B (FrameTileSource / FrameBankLayout entry
									; $25B); pose not traced
	incbin "../Extracted/segments/bankCA_4000.bin":$7D9..$A39
FrameTiles25C:						; the raw tiles of frame $25C (FrameTileSource / FrameBankLayout entry
									; $25C); pose not traced
	incbin "../Extracted/segments/bankCA_4000.bin":$A39..$CB9
FrameTiles25D:						; the raw tiles of frame $25D (FrameTileSource / FrameBankLayout entry
									; $25D); pose not traced
	incbin "../Extracted/segments/bankCA_4000.bin":$CB9..$F39
FrameTiles25E:						; the raw tiles of frame $25E (FrameTileSource / FrameBankLayout entry
									; $25E); pose not traced
	incbin "../Extracted/segments/bankCA_4000.bin":$F39..$1000
	incbin "../Extracted/segments/bankCA_5000.bin":$0..$139
