; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C7621E
FrameTiles0C0:						; the raw tiles of frame $0C0 (FrameTileSource / FrameBankLayout entry
									; $0C0); pose not traced
	incbin "../Extracted/segments/bankC7_6000.bin":$21E..$49E
FrameTiles0C1:						; the raw tiles of frame $0C1 (FrameTileSource / FrameBankLayout entry
									; $0C1); pose not traced
	incbin "../Extracted/segments/bankC7_6000.bin":$49E..$71E
FrameTiles0C2:						; the raw tiles of frame $0C2 (FrameTileSource / FrameBankLayout entry
									; $0C2); pose not traced
	incbin "../Extracted/segments/bankC7_6000.bin":$71E..$99E
FrameTiles0C3:						; the raw tiles of frame $0C3 (FrameTileSource / FrameBankLayout entry
									; $0C3); pose not traced
	incbin "../Extracted/segments/bankC7_6000.bin":$99E..$C1E
FrameTiles0C4:						; the raw tiles of frame $0C4 (FrameTileSource / FrameBankLayout entry
									; $0C4); pose not traced
	incbin "../Extracted/segments/bankC7_6000.bin":$C1E..$E9E
FrameTiles0C5:						; the raw tiles of frame $0C5 (FrameTileSource / FrameBankLayout entry
									; $0C5); pose not traced
	incbin "../Extracted/segments/bankC7_6000.bin":$E9E..$1000
	incbin "../Extracted/segments/bankC7_7000.bin":$0..$FE
