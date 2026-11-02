; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C9718B
FrameTiles206:						; the raw tiles of frame $206 (FrameTileSource / FrameBankLayout entry
									; $206); pose not traced
	incbin "../Extracted/segments/bankC9_7000.bin":$18B..$40B
FrameTiles207:						; the raw tiles of frame $207 (FrameTileSource / FrameBankLayout entry
									; $207); pose not traced
	incbin "../Extracted/segments/bankC9_7000.bin":$40B..$68B
FrameTiles208:						; the raw tiles of frame $208 (FrameTileSource / FrameBankLayout entry
									; $208); pose not traced
	incbin "../Extracted/segments/bankC9_7000.bin":$68B..$8EB
FrameTiles209:						; the raw tiles of frame $209 (FrameTileSource / FrameBankLayout entry
									; $209); pose not traced
	incbin "../Extracted/segments/bankC9_7000.bin":$8EB..$B4B
FrameTiles20A:						; the raw tiles of frame $20A (FrameTileSource / FrameBankLayout entry
									; $20A); pose not traced
	incbin "../Extracted/segments/bankC9_7000.bin":$B4B..$DAB
FrameTiles20B:						; the raw tiles of frame $20B (FrameTileSource / FrameBankLayout entry
									; $20B); pose not traced
	incbin "../Extracted/segments/bankC9_7000.bin":$DAB..$1000
	incbin "../Extracted/segments/bankC9_8000.bin":$0..$B
