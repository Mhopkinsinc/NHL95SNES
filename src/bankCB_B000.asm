; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CBB235
FrameTiles356:						; the raw tiles of frame $356 (FrameTileSource / FrameBankLayout entry
									; $356); pose not traced
	incbin "../Extracted/segments/bankCB_B000.bin":$235..$435
FrameTiles357:						; the raw tiles of frame $357 (FrameTileSource / FrameBankLayout entry
									; $357); pose not traced
	incbin "../Extracted/segments/bankCB_B000.bin":$435..$635
FrameTiles358:						; the raw tiles of frame $358 (FrameTileSource / FrameBankLayout entry
									; $358); pose not traced
	incbin "../Extracted/segments/bankCB_B000.bin":$635..$835
FrameTiles359:						; the raw tiles of frame $359 (FrameTileSource / FrameBankLayout entry
									; $359); pose not traced
	incbin "../Extracted/segments/bankCB_B000.bin":$835..$A35
FrameTiles35A:						; the raw tiles of frame $35A (FrameTileSource / FrameBankLayout entry
									; $35A); pose not traced
	incbin "../Extracted/segments/bankCB_B000.bin":$A35..$C35
FrameTiles35B:						; the raw tiles of frame $35B (FrameTileSource / FrameBankLayout entry
									; $35B); pose not traced
	incbin "../Extracted/segments/bankCB_B000.bin":$C35..$E35
FrameTiles35C:						; the raw tiles of frame $35C (FrameTileSource / FrameBankLayout entry
									; $35C); pose not traced
	incbin "../Extracted/segments/bankCB_B000.bin":$E35..$1000
	incbin "../Extracted/segments/bankCB_C000.bin":$0..$35
