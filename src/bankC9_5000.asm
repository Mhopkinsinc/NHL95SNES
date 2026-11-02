; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C951AB
FrameTiles1F5:						; the raw tiles of frame $1F5 (FrameTileSource / FrameBankLayout entry
									; $1F5); pose not traced
	incbin "../Extracted/segments/bankC9_5000.bin":$1AB..$3AB
FrameTiles1F6:						; the raw tiles of frame $1F6 (FrameTileSource / FrameBankLayout entry
									; $1F6); pose not traced
	incbin "../Extracted/segments/bankC9_5000.bin":$3AB..$5AB
FrameTiles1F7:						; the raw tiles of frame $1F7 (FrameTileSource / FrameBankLayout entry
									; $1F7); pose not traced
	incbin "../Extracted/segments/bankC9_5000.bin":$5AB..$7AB
FrameTiles1F8:						; the raw tiles of frame $1F8 (FrameTileSource / FrameBankLayout entry
									; $1F8); pose not traced
	incbin "../Extracted/segments/bankC9_5000.bin":$7AB..$9AB
FrameTiles1F9:						; the raw tiles of frame $1F9 (FrameTileSource / FrameBankLayout entry
									; $1F9); pose not traced
	incbin "../Extracted/segments/bankC9_5000.bin":$9AB..$BAB
FrameTiles1FA:						; the raw tiles of frame $1FA (FrameTileSource / FrameBankLayout entry
									; $1FA); pose not traced
	incbin "../Extracted/segments/bankC9_5000.bin":$BAB..$DAB
FrameTiles1FB:						; the raw tiles of frame $1FB (FrameTileSource / FrameBankLayout entry
									; $1FB); pose not traced
	incbin "../Extracted/segments/bankC9_5000.bin":$DAB..$FAB
FrameTiles1FC:						; the raw tiles of frame $1FC (FrameTileSource / FrameBankLayout entry
									; $1FC); pose not traced
	incbin "../Extracted/segments/bankC9_5000.bin":$FAB..$1000
	incbin "../Extracted/segments/bankC9_6000.bin":$0..$20B
