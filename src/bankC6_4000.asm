; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C64128
FrameTiles012:						; the raw tiles of frame $012 (FrameTileSource / FrameBankLayout entry
									; $012); pose not traced
	incbin "../Extracted/segments/bankC6_4000.bin":$128..$388
FrameTiles013:						; the raw tiles of frame $013 (FrameTileSource / FrameBankLayout entry
									; $013); pose not traced
	incbin "../Extracted/segments/bankC6_4000.bin":$388..$588
FrameTiles016:						; the raw tiles of frame $016 (FrameTileSource / FrameBankLayout entry
									; $016); pose not traced
	incbin "../Extracted/segments/bankC6_4000.bin":$588..$808
FrameTiles017:						; the raw tiles of frame $017 (FrameTileSource / FrameBankLayout entry
									; $017); pose not traced
	incbin "../Extracted/segments/bankC6_4000.bin":$808..$A68
FrameTiles018:						; the raw tiles of frame $018 (FrameTileSource / FrameBankLayout entry
									; $018); pose not traced
	incbin "../Extracted/segments/bankC6_4000.bin":$A68..$C68
FrameTiles01A:						; the raw tiles of frame $01A (FrameTileSource / FrameBankLayout entry
									; $01A); pose not traced
	incbin "../Extracted/segments/bankC6_4000.bin":$C68..$EC8
FrameTiles01B:						; the raw tiles of frame $01B (FrameTileSource / FrameBankLayout entry
									; $01B); pose not traced
	incbin "../Extracted/segments/bankC6_4000.bin":$EC8..$1000
	incbin "../Extracted/segments/bankC6_5000.bin":$0..$C8
