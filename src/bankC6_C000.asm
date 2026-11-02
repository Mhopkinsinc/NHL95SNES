; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C6C0A8
FrameTiles07D:						; the raw tiles of frame $07D (FrameTileSource / FrameBankLayout entry
									; $07D); pose not traced
	incbin "../Extracted/segments/bankC6_C000.bin":$A8..$2A8
FrameTiles07E:						; the raw tiles of frame $07E (FrameTileSource / FrameBankLayout entry
									; $07E); pose not traced
	incbin "../Extracted/segments/bankC6_C000.bin":$2A8..$508
FrameTiles07F:						; the raw tiles of frame $07F (FrameTileSource / FrameBankLayout entry
									; $07F); pose not traced
	incbin "../Extracted/segments/bankC6_C000.bin":$508..$708
FrameTiles080:						; the raw tiles of frame $080 (FrameTileSource / FrameBankLayout entry
									; $080); pose not traced
	incbin "../Extracted/segments/bankC6_C000.bin":$708..$968
FrameTiles081:						; the raw tiles of frame $081 (FrameTileSource / FrameBankLayout entry
									; $081); pose not traced
	incbin "../Extracted/segments/bankC6_C000.bin":$968..$BE8
FrameTiles082:						; the raw tiles of frame $082 (FrameTileSource / FrameBankLayout entry
									; $082); pose not traced
	incbin "../Extracted/segments/bankC6_C000.bin":$BE8..$E68
FrameTiles083:						; the raw tiles of frame $083 (FrameTileSource / FrameBankLayout entry
									; $083); pose not traced
	incbin "../Extracted/segments/bankC6_C000.bin":$E68..$1000
	incbin "../Extracted/segments/bankC6_D000.bin":$0..$E8
