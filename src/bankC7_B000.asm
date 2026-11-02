; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C7B1FE
FrameTiles0E1:						; the raw tiles of frame $0E1 (FrameTileSource / FrameBankLayout entry
									; $0E1); pose not traced
	incbin "../Extracted/segments/bankC7_B000.bin":$1FE..$47E
FrameTiles0E2:						; the raw tiles of frame $0E2 (FrameTileSource / FrameBankLayout entry
									; $0E2); pose not traced
	incbin "../Extracted/segments/bankC7_B000.bin":$47E..$6FE
FrameTiles0E3:						; the raw tiles of frame $0E3 (FrameTileSource / FrameBankLayout entry
									; $0E3); pose not traced
	incbin "../Extracted/segments/bankC7_B000.bin":$6FE..$97E
FrameTiles0E4:						; the raw tiles of frame $0E4 (FrameTileSource / FrameBankLayout entry
									; $0E4); pose not traced
	incbin "../Extracted/segments/bankC7_B000.bin":$97E..$BFE
FrameTiles0E5:						; the raw tiles of frame $0E5 (FrameTileSource / FrameBankLayout entry
									; $0E5); pose not traced
	incbin "../Extracted/segments/bankC7_B000.bin":$BFE..$E7E
FrameTiles0E6:						; the raw tiles of frame $0E6 (FrameTileSource / FrameBankLayout entry
									; $0E6); pose not traced
	incbin "../Extracted/segments/bankC7_B000.bin":$E7E..$1000
	incbin "../Extracted/segments/bankC7_C000.bin":$0..$FE
