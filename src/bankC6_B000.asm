; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C6B108
FrameTiles056:						; the raw tiles of frame $056 (FrameTileSource / FrameBankLayout entry
									; $056); pose not traced
	incbin "../Extracted/segments/bankC6_B000.bin":$108..$348
FrameTiles057:						; the raw tiles of frame $057 (FrameTileSource / FrameBankLayout entry
									; $057); pose not traced
	incbin "../Extracted/segments/bankC6_B000.bin":$348..$5A8
FrameTiles058:						; the raw tiles of frame $058 (FrameTileSource / FrameBankLayout entry
									; $058); pose not traced
	incbin "../Extracted/segments/bankC6_B000.bin":$5A8..$808
FrameTiles06F:						; the raw tiles of frame $06F (FrameTileSource / FrameBankLayout entry
									; $06F); pose not traced
	incbin "../Extracted/segments/bankC6_B000.bin":$808..$A08
FrameTiles072:						; the raw tiles of frame $072 (FrameTileSource / FrameBankLayout entry
									; $072); pose not traced
	incbin "../Extracted/segments/bankC6_B000.bin":$A08..$C48
FrameTiles07B:						; the raw tiles of frame $07B (FrameTileSource / FrameBankLayout entry
									; $07B); pose not traced
	incbin "../Extracted/segments/bankC6_B000.bin":$C48..$EA8
FrameTiles07C:						; the raw tiles of frame $07C (FrameTileSource / FrameBankLayout entry
									; $07C); pose not traced
	incbin "../Extracted/segments/bankC6_B000.bin":$EA8..$1000
	incbin "../Extracted/segments/bankC6_C000.bin":$0..$A8
