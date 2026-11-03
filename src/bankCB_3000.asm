; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CB30D5
FrameTiles2E8:						; the raw tiles of frame $2E8 (FrameTileSource / FrameBankLayout entry
									; $2E8); pose not traced
	incbin "../Extracted/segments/bankCB_3000.bin":$D5..$2D5
FrameTiles2E9:						; the raw tiles of frame $2E9 (FrameTileSource / FrameBankLayout entry
									; $2E9); pose not traced
	incbin "../Extracted/segments/bankCB_3000.bin":$2D5..$4D5
FrameTiles2EA:						; the raw tiles of frame $2EA (FrameTileSource / FrameBankLayout entry
									; $2EA); pose not traced
	incbin "../Extracted/segments/bankCB_3000.bin":$4D5..$735
FrameTiles2EB:						; the raw tiles of frame $2EB (FrameTileSource / FrameBankLayout entry
									; $2EB); pose not traced
	incbin "../Extracted/segments/bankCB_3000.bin":$735..$995
FrameTiles2EC:						; the raw tiles of frame $2EC (FrameTileSource / FrameBankLayout entry
									; $2EC); pose not traced
	incbin "../Extracted/segments/bankCB_3000.bin":$995..$BF5
FrameTiles2ED:						; the raw tiles of frame $2ED (FrameTileSource / FrameBankLayout entry
									; $2ED); pose not traced
	incbin "../Extracted/segments/bankCB_3000.bin":$BF5..$DF5
FrameTiles2EE:						; the raw tiles of frame $2EE (FrameTileSource / FrameBankLayout entry
									; $2EE); pose not traced
	incbin "../Extracted/segments/bankCB_3000.bin":$DF5..$1000
	incbin "../Extracted/segments/bankCB_4000.bin":$0..$75
