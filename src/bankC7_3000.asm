; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C7315E
FrameTiles0AC:						; the raw tiles of frame $0AC (FrameTileSource / FrameBankLayout entry
									; $0AC); pose not traced
	incbin "../Extracted/segments/bankC7_3000.bin":$15E..$3DE
FrameTiles0AD:						; the raw tiles of frame $0AD (FrameTileSource / FrameBankLayout entry
									; $0AD); pose not traced
	incbin "../Extracted/segments/bankC7_3000.bin":$3DE..$65E
FrameTiles0AE:						; the raw tiles of frame $0AE (FrameTileSource / FrameBankLayout entry
									; $0AE); pose not traced
	incbin "../Extracted/segments/bankC7_3000.bin":$65E..$8BE
FrameTiles0AF:						; the raw tiles of frame $0AF (FrameTileSource / FrameBankLayout entry
									; $0AF); pose not traced
	incbin "../Extracted/segments/bankC7_3000.bin":$8BE..$B3E
FrameTiles0B0:						; the raw tiles of frame $0B0 (FrameTileSource / FrameBankLayout entry
									; $0B0); pose not traced
	incbin "../Extracted/segments/bankC7_3000.bin":$B3E..$D7E
FrameTiles0B1:						; the raw tiles of frame $0B1 (FrameTileSource / FrameBankLayout entry
									; $0B1); pose not traced
	incbin "../Extracted/segments/bankC7_3000.bin":$D7E..$FDE
FrameTiles0B2:						; the raw tiles of frame $0B2 (FrameTileSource / FrameBankLayout entry
									; $0B2); pose not traced
	incbin "../Extracted/segments/bankC7_3000.bin":$FDE..$1000
	incbin "../Extracted/segments/bankC7_4000.bin":$0..$23E
