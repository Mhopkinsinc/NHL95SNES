; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C7219E
FrameTiles0A5:						; the raw tiles of frame $0A5 (FrameTileSource / FrameBankLayout entry
									; $0A5); pose not traced
	incbin "../Extracted/segments/bankC7_2000.bin":$19E..$39E
FrameTiles0A6:						; the raw tiles of frame $0A6 (FrameTileSource / FrameBankLayout entry
									; $0A6); pose not traced
	incbin "../Extracted/segments/bankC7_2000.bin":$39E..$61E
FrameTiles0A7:						; the raw tiles of frame $0A7 (FrameTileSource / FrameBankLayout entry
									; $0A7); pose not traced
	incbin "../Extracted/segments/bankC7_2000.bin":$61E..$81E
FrameTiles0A8:						; the raw tiles of frame $0A8 (FrameTileSource / FrameBankLayout entry
									; $0A8); pose not traced
	incbin "../Extracted/segments/bankC7_2000.bin":$81E..$A7E
FrameTiles0A9:						; the raw tiles of frame $0A9 (FrameTileSource / FrameBankLayout entry
									; $0A9); pose not traced
	incbin "../Extracted/segments/bankC7_2000.bin":$A7E..$C7E
FrameTiles0AA:						; the raw tiles of frame $0AA (FrameTileSource / FrameBankLayout entry
									; $0AA); pose not traced
	incbin "../Extracted/segments/bankC7_2000.bin":$C7E..$EDE
FrameTiles0AB:						; the raw tiles of frame $0AB (FrameTileSource / FrameBankLayout entry
									; $0AB); pose not traced
	incbin "../Extracted/segments/bankC7_2000.bin":$EDE..$1000
	incbin "../Extracted/segments/bankC7_3000.bin":$0..$15E
