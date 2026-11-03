; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CA81F9
FrameTiles276:						; the raw tiles of frame $276 (FrameTileSource / FrameBankLayout entry
									; $276); pose not traced
	incbin "../Extracted/segments/bankCA_8000.bin":$1F9..$459
FrameTiles277:						; the raw tiles of frame $277 (FrameTileSource / FrameBankLayout entry
									; $277); pose not traced
	incbin "../Extracted/segments/bankCA_8000.bin":$459..$659
FrameTiles278:						; the raw tiles of frame $278 (FrameTileSource / FrameBankLayout entry
									; $278); pose not traced
	incbin "../Extracted/segments/bankCA_8000.bin":$659..$859
FrameTiles279:						; the raw tiles of frame $279 (FrameTileSource / FrameBankLayout entry
									; $279); pose not traced
	incbin "../Extracted/segments/bankCA_8000.bin":$859..$A59
FrameTiles27A:						; the raw tiles of frame $27A (FrameTileSource / FrameBankLayout entry
									; $27A); pose not traced
	incbin "../Extracted/segments/bankCA_8000.bin":$A59..$C59
FrameTiles27B:						; the raw tiles of frame $27B (FrameTileSource / FrameBankLayout entry
									; $27B); pose not traced
	incbin "../Extracted/segments/bankCA_8000.bin":$C59..$E59
FrameTiles27C:						; the raw tiles of frame $27C (FrameTileSource / FrameBankLayout entry
									; $27C); pose not traced
	incbin "../Extracted/segments/bankCA_8000.bin":$E59..$1000
	incbin "../Extracted/segments/bankCA_9000.bin":$0..$B9
