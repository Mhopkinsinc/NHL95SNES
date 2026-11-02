; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CB90D5
FrameTiles348:						; the raw tiles of frame $348 (FrameTileSource / FrameBankLayout entry
									; $348); pose not traced
	incbin "../Extracted/segments/bankCB_9000.bin":$D5..$335
FrameTiles349:						; the raw tiles of frame $349 (FrameTileSource / FrameBankLayout entry
									; $349); pose not traced
	incbin "../Extracted/segments/bankCB_9000.bin":$335..$5B5
FrameTiles34A:						; the raw tiles of frame $34A (FrameTileSource / FrameBankLayout entry
									; $34A); pose not traced
	incbin "../Extracted/segments/bankCB_9000.bin":$5B5..$815
FrameTiles34B:						; the raw tiles of frame $34B (FrameTileSource / FrameBankLayout entry
									; $34B); pose not traced
	incbin "../Extracted/segments/bankCB_9000.bin":$815..$A95
FrameTiles34C:						; the raw tiles of frame $34C (FrameTileSource / FrameBankLayout entry
									; $34C); pose not traced
	incbin "../Extracted/segments/bankCB_9000.bin":$A95..$C95
FrameTiles34D:						; the raw tiles of frame $34D (FrameTileSource / FrameBankLayout entry
									; $34D); pose not traced
	incbin "../Extracted/segments/bankCB_9000.bin":$C95..$F15
FrameTiles34E:						; the raw tiles of frame $34E (FrameTileSource / FrameBankLayout entry
									; $34E); pose not traced
	incbin "../Extracted/segments/bankCB_9000.bin":$F15..$1000
	incbin "../Extracted/segments/bankCB_A000.bin":$0..$115
