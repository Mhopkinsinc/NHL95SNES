; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $C791FE
FrameTiles0D4:						; the raw tiles of frame $0D4 (FrameTileSource / FrameBankLayout entry
									; $0D4); pose not traced
	incbin "../Extracted/segments/bankC7_9000.bin":$1FE..$47E
FrameTiles0D5:						; the raw tiles of frame $0D5 (FrameTileSource / FrameBankLayout entry
									; $0D5); pose not traced
	incbin "../Extracted/segments/bankC7_9000.bin":$47E..$6FE
FrameTiles0D6:						; the raw tiles of frame $0D6 (FrameTileSource / FrameBankLayout entry
									; $0D6); pose not traced
	incbin "../Extracted/segments/bankC7_9000.bin":$6FE..$91E
FrameTiles0D7:						; the raw tiles of frame $0D7 (FrameTileSource / FrameBankLayout entry
									; $0D7); pose not traced
	incbin "../Extracted/segments/bankC7_9000.bin":$91E..$B9E
FrameTiles0D8:						; the raw tiles of frame $0D8 (FrameTileSource / FrameBankLayout entry
									; $0D8); pose not traced
	incbin "../Extracted/segments/bankC7_9000.bin":$B9E..$E1E
FrameTiles0D9:						; the raw tiles of frame $0D9 (FrameTileSource / FrameBankLayout entry
									; $0D9); pose not traced
	incbin "../Extracted/segments/bankC7_9000.bin":$E1E..$1000
	incbin "../Extracted/segments/bankC7_A000.bin":$0..$7E
