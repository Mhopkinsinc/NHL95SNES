; Raw planar frame tiles sent directly to VRAM by QueueFrameTiles.
; The frame groups are in frames95s.asm; FrameTiles<frame> labels mark the transfer sources.
org $CBE035
FrameTiles36D:						; the raw tiles of frame $36D (FrameTileSource / FrameBankLayout entry
									; $36D); pose not traced
	incbin "../Extracted/segments/bankCB_E000.bin":$35..$235
FrameTiles36E:						; the raw tiles of frame $36E (FrameTileSource / FrameBankLayout entry
									; $36E); pose not traced
	incbin "../Extracted/segments/bankCB_E000.bin":$235..$435
FrameTiles36F:						; the raw tiles of frame $36F (FrameTileSource / FrameBankLayout entry
									; $36F); pose not traced
	incbin "../Extracted/segments/bankCB_E000.bin":$435..$695
FrameTiles370:						; the raw tiles of frame $370 (FrameTileSource / FrameBankLayout entry
									; $370); pose not traced
	incbin "../Extracted/segments/bankCB_E000.bin":$695..$895
FrameTiles371:						; the raw tiles of frame $371 (FrameTileSource / FrameBankLayout entry
									; $371); pose not traced
	incbin "../Extracted/segments/bankCB_E000.bin":$895..$AF5
FrameTiles372:						; the raw tiles of frame $372 (FrameTileSource / FrameBankLayout entry
									; $372); pose not traced
	incbin "../Extracted/segments/bankCB_E000.bin":$AF5..$CF5
FrameTiles373:						; the raw tiles of frame $373 (FrameTileSource / FrameBankLayout entry
									; $373); pose not traced
	incbin "../Extracted/segments/bankCB_E000.bin":$CF5..$F75
FrameTiles374:						; the raw tiles of frame $374 (FrameTileSource / FrameBankLayout entry
									; $374); pose not traced
	incbin "../Extracted/segments/bankCB_E000.bin":$F75..$1000
	incbin "../Extracted/segments/bankCB_F000.bin":$0..$175
