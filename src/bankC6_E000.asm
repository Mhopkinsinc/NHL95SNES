; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C6E1E8
FrameTiles08C:						; the raw tiles of frame $08C (FrameTileSource / FrameBankLayout entry
									; $08C); pose not traced
	incbin "../Extracted/segments/bankC6_E000.bin":$1E8..$468
FrameTiles08D:						; the raw tiles of frame $08D (FrameTileSource / FrameBankLayout entry
									; $08D); pose not traced
	incbin "../Extracted/segments/bankC6_E000.bin":$468..$6E8
FrameTiles08E:						; the raw tiles of frame $08E (FrameTileSource / FrameBankLayout entry
									; $08E); pose not traced
	incbin "../Extracted/segments/bankC6_E000.bin":$6E8..$968
FrameTiles08F:						; the raw tiles of frame $08F (FrameTileSource / FrameBankLayout entry
									; $08F); pose not traced
	incbin "../Extracted/segments/bankC6_E000.bin":$968..$BE8
FrameTiles090:						; the raw tiles of frame $090 (FrameTileSource / FrameBankLayout entry
									; $090); pose not traced
	incbin "../Extracted/segments/bankC6_E000.bin":$BE8..$E68
FrameTiles091:						; the raw tiles of frame $091 (FrameTileSource / FrameBankLayout entry
									; $091); pose not traced
	incbin "../Extracted/segments/bankC6_E000.bin":$E68..$1000
	incbin "../Extracted/segments/bankC6_F000.bin":$0..$68
