; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $C630A8
FrameTiles007:						; the raw tiles of frame $007 (FrameTileSource / FrameBankLayout entry
									; $007); pose not traced
	incbin "../Extracted/segments/bankC6_3000.bin":$A8..$308
FrameTiles008:						; the raw tiles of frame $008 (FrameTileSource / FrameBankLayout entry
									; $008); pose not traced
	incbin "../Extracted/segments/bankC6_3000.bin":$308..$508
FrameTiles00A:						; the raw tiles of frame $00A (FrameTileSource / FrameBankLayout entry
									; $00A); pose not traced
	incbin "../Extracted/segments/bankC6_3000.bin":$508..$788
FrameTiles00B:						; the raw tiles of frame $00B (FrameTileSource / FrameBankLayout entry
									; $00B); pose not traced
	incbin "../Extracted/segments/bankC6_3000.bin":$788..$9E8
FrameTiles00E:						; the raw tiles of frame $00E (FrameTileSource / FrameBankLayout entry
									; $00E); pose not traced
	incbin "../Extracted/segments/bankC6_3000.bin":$9E8..$C68
FrameTiles00F:						; the raw tiles of frame $00F (FrameTileSource / FrameBankLayout entry
									; $00F); pose not traced
	incbin "../Extracted/segments/bankC6_3000.bin":$C68..$EC8
FrameTiles010:						; the raw tiles of frame $010 (FrameTileSource / FrameBankLayout entry
									; $010); pose not traced
	incbin "../Extracted/segments/bankC6_3000.bin":$EC8..$1000
	incbin "../Extracted/segments/bankC6_4000.bin":$0..$128
