; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C7423E
FrameTiles0B3:						; the raw tiles of frame $0B3 (FrameTileSource / FrameBankLayout entry
									; $0B3); pose not traced
	incbin "../Extracted/segments/bankC7_4000.bin":$23E..$4BE
FrameTiles0B4:						; the raw tiles of frame $0B4 (FrameTileSource / FrameBankLayout entry
									; $0B4); pose not traced
	incbin "../Extracted/segments/bankC7_4000.bin":$4BE..$73E
FrameTiles0B5:						; the raw tiles of frame $0B5 (FrameTileSource / FrameBankLayout entry
									; $0B5); pose not traced
	incbin "../Extracted/segments/bankC7_4000.bin":$73E..$9BE
FrameTiles0B6:						; the raw tiles of frame $0B6 (FrameTileSource / FrameBankLayout entry
									; $0B6); pose not traced
	incbin "../Extracted/segments/bankC7_4000.bin":$9BE..$C3E
FrameTiles0B7:						; the raw tiles of frame $0B7 (FrameTileSource / FrameBankLayout entry
									; $0B7); pose not traced
	incbin "../Extracted/segments/bankC7_4000.bin":$C3E..$EBE
FrameTiles0B8:						; the raw tiles of frame $0B8 (FrameTileSource / FrameBankLayout entry
									; $0B8); pose not traced
	incbin "../Extracted/segments/bankC7_4000.bin":$EBE..$1000
	incbin "../Extracted/segments/bankC7_5000.bin":$0..$13E
