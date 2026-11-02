; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CA09D9
FrameTiles241:						; the raw tiles of frame $241 (FrameTileSource / FrameBankLayout entry
									; $241); pose not traced
	incbin "../Extracted/segments/bankCA_0000.bin":$9D9..$C39
FrameTiles242:						; the raw tiles of frame $242 (FrameTileSource / FrameBankLayout entry
									; $242); pose not traced
	incbin "../Extracted/segments/bankCA_0000.bin":$C39..$E99
FrameTiles243:						; the raw tiles of frame $243 (FrameTileSource / FrameBankLayout entry
									; $243); pose not traced
	incbin "../Extracted/segments/bankCA_0000.bin":$E99..$1000
	incbin "../Extracted/segments/bankCA_1000.bin":$0..$99
