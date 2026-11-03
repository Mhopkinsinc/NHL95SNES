; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C9C18B
FrameTiles227:						; the raw tiles of frame $227 (FrameTileSource / FrameBankLayout entry
									; $227); pose not traced
	incbin "../Extracted/segments/bankC9_C000.bin":$18B..$3EB
FrameTiles228:						; the raw tiles of frame $228 (FrameTileSource / FrameBankLayout entry
									; $228); pose not traced
	incbin "../Extracted/segments/bankC9_C000.bin":$3EB..$66B
FrameTiles229:						; the raw tiles of frame $229 (FrameTileSource / FrameBankLayout entry
									; $229); pose not traced
	incbin "../Extracted/segments/bankC9_C000.bin":$66B..$8EB
FrameTiles22A:						; the raw tiles of frame $22A (FrameTileSource / FrameBankLayout entry
									; $22A); pose not traced
	incbin "../Extracted/segments/bankC9_C000.bin":$8EB..$AEB
FrameTiles22B:						; the raw tiles of frame $22B (FrameTileSource / FrameBankLayout entry
									; $22B); pose not traced
	incbin "../Extracted/segments/bankC9_C000.bin":$AEB..$D6B
FrameTiles22C:						; the raw tiles of frame $22C (FrameTileSource / FrameBankLayout entry
									; $22C); pose not traced
	incbin "../Extracted/segments/bankC9_C000.bin":$D6B..$F8B
FrameTiles22D:						; the raw tiles of frame $22D (FrameTileSource / FrameBankLayout entry
									; $22D); pose not traced
	incbin "../Extracted/segments/bankC9_C000.bin":$F8B..$1000
	incbin "../Extracted/segments/bankC9_D000.bin":$0..$20B
