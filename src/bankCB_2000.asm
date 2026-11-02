; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; Frame poses are not traced; DATA8_ labels identify the transfer sources.
org $CB2155
FrameTiles2E1:						; the raw tiles of frame $2E1 (FrameTileSource / FrameBankLayout entry
									; $2E1); pose not traced
	incbin "../Extracted/segments/bankCB_2000.bin":$155..$3B5
FrameTiles2E2:						; the raw tiles of frame $2E2 (FrameTileSource / FrameBankLayout entry
									; $2E2); pose not traced
	incbin "../Extracted/segments/bankCB_2000.bin":$3B5..$615
FrameTiles2E3:						; the raw tiles of frame $2E3 (FrameTileSource / FrameBankLayout entry
									; $2E3); pose not traced
	incbin "../Extracted/segments/bankCB_2000.bin":$615..$815
FrameTiles2E4:						; the raw tiles of frame $2E4 (FrameTileSource / FrameBankLayout entry
									; $2E4); pose not traced
	incbin "../Extracted/segments/bankCB_2000.bin":$815..$A75
FrameTiles2E5:						; the raw tiles of frame $2E5 (FrameTileSource / FrameBankLayout entry
									; $2E5); pose not traced
	incbin "../Extracted/segments/bankCB_2000.bin":$A75..$C75
FrameTiles2E6:						; the raw tiles of frame $2E6 (FrameTileSource / FrameBankLayout entry
									; $2E6); pose not traced
	incbin "../Extracted/segments/bankCB_2000.bin":$C75..$ED5
FrameTiles2E7:						; the raw tiles of frame $2E7 (FrameTileSource / FrameBankLayout entry
									; $2E7); pose not traced
	incbin "../Extracted/segments/bankCB_2000.bin":$ED5..$1000
	incbin "../Extracted/segments/bankCB_3000.bin":$0..$D5
