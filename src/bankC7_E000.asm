; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C7E0BE
FrameTiles0F4:						; the raw tiles of frame $0F4 (FrameTileSource / FrameBankLayout entry
									; $0F4); pose not traced
	incbin "../Extracted/segments/bankC7_E000.bin":$BE..$33E
FrameTiles0F5:						; the raw tiles of frame $0F5 (FrameTileSource / FrameBankLayout entry
									; $0F5); pose not traced
	incbin "../Extracted/segments/bankC7_E000.bin":$33E..$5BE
FrameTiles0F6:						; the raw tiles of frame $0F6 (FrameTileSource / FrameBankLayout entry
									; $0F6); pose not traced
	incbin "../Extracted/segments/bankC7_E000.bin":$5BE..$7DE
FrameTiles0F7:						; the raw tiles of frame $0F7 (FrameTileSource / FrameBankLayout entry
									; $0F7); pose not traced
	incbin "../Extracted/segments/bankC7_E000.bin":$7DE..$A3E
FrameTiles0F8:						; the raw tiles of frame $0F8 (FrameTileSource / FrameBankLayout entry
									; $0F8); pose not traced
	incbin "../Extracted/segments/bankC7_E000.bin":$A3E..$C3E
FrameTiles0F9:						; the raw tiles of frame $0F9 (FrameTileSource / FrameBankLayout entry
									; $0F9); pose not traced
	incbin "../Extracted/segments/bankC7_E000.bin":$C3E..$E9E
FrameTiles0FA:						; the raw tiles of frame $0FA (FrameTileSource / FrameBankLayout entry
									; $0FA); pose not traced
	incbin "../Extracted/segments/bankC7_E000.bin":$E9E..$1000
	incbin "../Extracted/segments/bankC7_F000.bin":$0..$9E
